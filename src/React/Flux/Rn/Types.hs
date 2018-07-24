{-# LANGUAGE CPP                   #-}
{-# LANGUAGE DataKinds             #-}
{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NoImplicitPrelude     #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE PolyKinds             #-}
{-# LANGUAGE RankNTypes            #-}
module React.Flux.Rn.Types where

import           Data.Aeson
import           Data.Aeson.Types           hiding ((.:))
import           Data.JSString              (pack)
import           Data.Map
import           Data.Maybe                 (fromMaybe)
import           Data.String                (IsString (..))
import           Data.Time.LocalTime
import           Data.Word                  (Word8)
import           GHC.Generics               (Generic)
import           GHCJS.Marshal
import           GHCJS.Types                (JSString, JSVal)
import qualified JavaScript.Object.Internal as OI
import           Network.Http.Types         (Method)
import           Network.URI
import           Numeric.Natural            (Natural)
import           Prelude                    (Bool, Double, IO, Int, Maybe (..),
                                             Num, Show, String, error, fmap,
                                             fromIntegral, id, pure, read,
                                             undefined, ($), (+), (++), (.),
                                             (<$>), (>>=))
import qualified Prelude                    as P
import           React.Flux
import           React.Flux.Internal        (ReactViewRef (..))
import           React.Flux.Rn.Events       (fromNativeJSON, nativeEvent)
import           System.IO.Unsafe           (unsafePerformIO)

{-# ANN module ("HLint: ignore Use camelCase" :: String) #-}

str :: String -> IO JSVal
str = toJSVal

int :: Int -> IO JSVal
int = toJSVal

type NodeID = String

type JavaScript = String

type UnitInterval = Double -- TODO

instance ToJSVal (ReactViewRef x) where
  toJSVal (ReactViewRef x) = pure x

instance ToJSVal Natural where
  toJSVal nat = toJSVal (fromIntegral nat :: Int)
instance FromJSVal Natural where
  fromJSVal jsval = fmap fromIntegral <$> (fromJSVal jsval :: IO (Maybe Int))

newtype Percentage = Percent Natural
  deriving (Show, Generic)
instance ToJSVal Percentage where
  toJSVal (Percent x) = toJSVal $ P.show x ++ "%"

data Length = Pt Natural | Perc Natural
  deriving (Show, Generic)
instance Num Length where
  Pt a + Pt b = Pt (a+b)
instance IsString Length where
  fromString x@[_,'%'] = Perc (read x)
instance ToJSVal Length where
  toJSVal (Pt x)   = toJSVal x
  toJSVal (Perc x) = toJSVal $ P.show x ++ "%"

data Size = Small
          | Large
          | Natural
  deriving (Show, Generic)
instance ToJSVal Size where
  toJSVal Small   = str "small"
  toJSVal Large   = str "large"
  toJSVal Natural = str "natural"

data Color = Color String
           | Rgb Word8 Word8 Word8
           | Rgba Word8 Word8 Word8 Double
           | Hsl Natural Percentage Percentage
           | Hsla Natural Percentage Percentage Double
           | Transparent
  deriving (Show, Generic)

-- TODO: named colors

instance ToJSVal Color where
  toJSVal (Color s)      = str s
  toJSVal (Rgb r g b)    = str $ "rgb("  ++ P.show r ++ "," ++ P.show g ++ "," ++ P.show b ++ ")"
  toJSVal (Rgba r g b a) = str $ "rgba(" ++ P.show r ++ "," ++ P.show g ++ "," ++ P.show b ++ "," ++ P.show a ++ ")"
  toJSVal (Hsl h s l)    = str $ "hsl("  ++ P.show h ++ "," ++ P.show s ++ "%," ++ P.show l ++ "%)"
  toJSVal (Hsla h s l a) = str $ "hsla(" ++ P.show h ++ "," ++ P.show s ++ "%," ++ P.show l ++ "%," ++ P.show a ++ ")"
  toJSVal Transparent    = str "transparent"

instance IsString Color where
   fromString "transparent" = Transparent
   fromString x             = Color x

-- TODO: ?
instance ToJSVal LocalTime where
  toJSVal localTime = undefined
instance FromJSVal LocalTime where
  fromJSVal jsval = parseMaybe parseJSON <$> undefined

data MinuteInterval = M1 | M2 | M3 | M4 | M5 | M6 | M10 | M12 | M15 | M20 | M30
  deriving (Show, Generic)
instance ToJSVal MinuteInterval where
  toJSVal M1  = int 1
  toJSVal M2  = int 2
  toJSVal M3  = int 3
  toJSVal M4  = int 4
  toJSVal M5  = int 5
  toJSVal M6  = int 6
  toJSVal M10 = int 10
  toJSVal M12 = int 12
  toJSVal M15 = int 15
  toJSVal M20 = int 20
  toJSVal M30 = int 30

data Mode = Date | Time | DateTime
  deriving (Show, Generic)
instance ToJSVal Mode where
  toJSVal Date     = str "date"
  toJSVal Time     = str "time"
  toJSVal DateTime = str "datetime"

data DrawerPosition = Left | Right
  deriving (Show, Generic)
instance ToJSVal DrawerPosition where
  toJSVal Left  = str "left"
  toJSVal Right = str "right"

data KeyboardDismissMode = None | OnDrag | Interactive {- IOS -}
  deriving (Show, Generic)
instance ToJSVal KeyboardDismissMode where
  toJSVal None        = str "none"
  toJSVal OnDrag      = str "on-drag"
  toJSVal Interactive = str "interactive"

data DrawerLockMode = Unlocked | LockedClosed | LockedOpen
  deriving (Show, Generic)
instance ToJSVal DrawerLockMode where
  toJSVal Unlocked     = str "unlocked"
  toJSVal LockedClosed = str "locked-closed"
  toJSVal LockedOpen   = str "locked-open"

data Visibility = Visible | Hidden
  deriving (Show, Generic)
instance ToJSVal Visibility where
  toJSVal Visible = str "visible"
  toJSVal Hidden  = str "hidden"

data ResizeMode = Contain
                | Cover
                | Stretch
                | Center
                | Repeat
  deriving (Show,Generic)
instance ToJSVal ResizeMode where
  toJSVal Contain = str "contain"
  toJSVal Cover   = str "cover"
  toJSVal Stretch = str "stretch"
  toJSVal Center  = str "center"
  toJSVal Repeat  = str "repeat"

instance ToJSON URI where
  toJSON uri = toJSON $ uriToString id uri ""
instance ToJSON Method where
  toJSON = toJSON . P.show

data ImageURISource = ImageURISource {
  uri     :: URI,
  bundle  :: Maybe String,
  method  :: Maybe Method,
  headers :: Map String String,
  body    :: Maybe String,
  width   :: Maybe Natural,
  height  :: Maybe Natural,
  scale   :: Maybe Double
} deriving (Show,Generic)
instance ToJSON ImageURISource
instance ToJSVal ImageURISource where
  toJSVal = toJSVal . toJSON

imageURISource uri = ImageURISource uri Nothing Nothing empty Nothing Nothing Nothing Nothing

data ImageSource = ImageSourceURI ImageURISource | ImageSourceResource String | ImageSourceURIs [ImageURISource]
  deriving (Show, Generic)
instance ToJSVal ImageSource where
  toJSVal (ImageSourceURI x)      = toJSVal $ toJSON x
  toJSVal (ImageSourceURIs xs)    = toJSVal $ toJSON xs
  toJSVal (ImageSourceResource x) = js_require $ pack x

data URISource = URISource {
  uri     :: URI,
  method  :: Maybe Method,
  headers :: Map String String,
  body    :: Maybe String
} deriving (Show,Generic)
instance ToJSON URISource
instance ToJSVal URISource where
  toJSVal = toJSVal . toJSON

data StaticSource = StaticSource {
    html    :: String,
    baseUrl :: URI
  } deriving (Show,Generic)
instance ToJSON StaticSource
instance ToJSVal StaticSource where
  toJSVal = toJSVal . toJSON

data Source = SourceURI URISource | SourceStatic StaticSource | SourceResource String
  deriving (Show, Generic)
instance ToJSVal Source where
  toJSVal (SourceURI x)      = toJSVal $ toJSON x
  toJSVal (SourceStatic x)   = toJSVal $ toJSON x
  toJSVal (SourceResource x) = js_require $ pack x

data ResizeMethod = Auto | Resize | Scale
  deriving (Show, Generic)
instance ToJSVal ResizeMethod where
  toJSVal Auto   = str "auto"
  toJSVal Resize = str "resize"
  toJSVal Scale  = str "scale"

data OnProgress = OnProgress {
    loaded :: Double,
    total  :: Double
} deriving (Show, Generic)
instance FromJSON OnProgress
instance FromJSVal OnProgress where fromJSVal = fromNativeJSON

data OnPageScroll = OnPageScroll {
    position :: Natural,
    offset   :: Double
} deriving (Show, Generic)
instance FromJSON OnPageScroll
instance FromJSVal OnPageScroll where fromJSVal = fromNativeJSON

data PageScrollingState = Idle | Dragging | Settling
  deriving (Show, Generic)
instance FromJSVal PageScrollingState where
  fromJSVal jsval = fmap parse <$> nativeEvent jsval
   where parse :: JSString -> PageScrollingState
         parse "idle"     = Idle
         parse "dragging" = Dragging
         parse "settling" = Settling

newtype OnPageSelected = OnPageSelected {
    position :: Natural
} deriving (Show, Generic)
instance FromJSON OnPageSelected
instance FromJSVal OnPageSelected where fromJSVal = fromNativeJSON

newtype OnMessage = OnMessage {
    data_ :: String
} deriving (Show, Generic)
instance FromJSON OnMessage where
  parseJSON = withObject "OnMessage" $ \v -> OnMessage <$> v .: "data"
instance FromJSVal OnMessage where fromJSVal = fromNativeJSON

data Inset = Inset {
  top    :: Natural,
  left   :: Natural,
  bottom :: Natural,
  right  :: Natural
} deriving (Show,Generic)
instance ToJSON Inset
instance ToJSVal Inset where
  toJSVal = toJSVal . toJSON

data DefaultURISource = DefaultURISource {
  uri    :: URI,
  width  :: Maybe Natural,
  height :: Maybe Natural,
  scale  :: Maybe Double
} deriving (Show,Generic)
instance ToJSON DefaultURISource
instance ToJSVal DefaultURISource where
  toJSVal = toJSVal . toJSON

data DefaultSource = DefaultSourceURI DefaultURISource | DefaultSourceResource Int
  deriving (Show,Generic)
instance ToJSON DefaultSource
instance ToJSVal DefaultSource where
  toJSVal = toJSVal . toJSON

data Behavior = Height | Position | Padding
  deriving (Show, Generic)
instance ToJSVal Behavior where
  toJSVal Height   = str "height"
  toJSVal Position = str "position"
  toJSVal Padding  = str "padding"

data SupportedOrientations = Portrait
                           | PortraitUpsideDown
                           | Landscape
                           | LandscapeLeft
                           | LandscapeRight
  deriving (Show, Generic)
instance ToJSVal SupportedOrientations where
  toJSVal Portrait           = str "portrait"
  toJSVal PortraitUpsideDown = str "portrait-upside-down"
  toJSVal Landscape          = str "landscape"
  toJSVal LandscapeLeft      = str "landscape-left"
  toJSVal LandscapeRight     = str "landscape-right"

data AnimationType = None_ | Slide | Fade
  deriving (Show, Generic)
instance ToJSVal AnimationType where
  toJSVal None_ = str "none"
  toJSVal Slide = str "slide"
  toJSVal Fade  = str "fade"

data PresentationStyle = FullScreen | PageSheet | FormSheet | OverFullScreen
  deriving (Show, Generic)
instance ToJSVal PresentationStyle where
  toJSVal FullScreen     = str "fullScreen"
  toJSVal PageSheet      = str "pageSheet"
  toJSVal FormSheet      = str "formSheet"
  toJSVal OverFullScreen = str "overFullScreen"

data BarStyle = Default | Black
  deriving (Show, Generic)
instance ToJSVal BarStyle where
  toJSVal Default = str "default"
  toJSVal Black   = str "black"

data SystemIcon = Done
                | Cancel
                | Edit
                | Save
                | Add
                | Compose
                | Reply
                | Action
                | Organize
                | Bookmarks
                | Search
                | Refresh
                | Stop
                | Camera
                | Trash
                | Play
                | Pause
                | Rewind
                | FastForward
                | Undo
                | Redo
                | PageCurl
  deriving (Show, Generic)

data Route = Route {
  component             :: ReactViewRef (),
  title                 :: String,
  titleImage            :: ImageSource,
  passProps             :: forall handler. [PropertyOrHandler handler],
  backButtonIcon        :: ImageSource,
  backButtonTitle       :: String,
  leftButtonIcon        :: ImageSource,
  leftButtonTitle       :: String,
  leftButtonSystemIcon  :: SystemIcon,
  onLeftButtonPress     :: forall handler. EventHandlerType handler -> PropertyOrHandler handler,
  rightButtonIcon       :: ImageSource,
  rightButtonTitle      :: String,
  rightButtonSystemIcon :: SystemIcon,
  onRightButtonPress    :: forall handler. EventHandlerType handler -> PropertyOrHandler handler,
  wrapperStyle          :: forall handler. [PropertyOrHandler handler],
  navigationBarHidden   :: Bool,
  shadowHidden          :: Bool,
  tintColor             :: Color,
  barTintColor          :: Color,
  barStyle              :: BarStyle,
  titleTextColor        :: Color,
  translucent           :: Bool
}
-- TODO:
instance ToJSON Route where
  toJSON r = undefined
instance ToJSVal Route where
  toJSVal = toJSVal . toJSON

-- TODO:
data BackgroundPropType
  deriving Generic
instance ToJSVal BackgroundPropType

data PickerMode = Dialog | Dropdown
  deriving (Show, Generic)
instance ToJSVal PickerMode where
  toJSVal Dialog   = str "dialog"
  toJSVal Dropdown = str "dropdown"

data StyleAttr = Horizontal | Normal | Small_ | Large_ | Inverse | SmallInverse | LargeInverse
  deriving (Show, Generic)
instance ToJSVal StyleAttr where
  toJSVal Horizontal   = str "Horizontal"
  toJSVal Normal       = str "Normal"
  toJSVal Small_       = str "Small"
  toJSVal Large_       = str "Large"
  toJSVal Inverse      = str "Inverse"
  toJSVal SmallInverse = str "SmallInverse"
  toJSVal LargeInverse = str "LargeInverse"

data ProgressViewStyle = Default_ | Bar_
  deriving (Show, Generic)
instance ToJSVal ProgressViewStyle where
  toJSVal Default_ = str "default"
  toJSVal Bar_     = str "bar"

data RefreshControlSize = Default__ | Large__
  deriving (Show, Generic)
instance ToJSVal RefreshControlSize where
  toJSVal Default__ = int 1
  toJSVal Large__   = int 0

data KeyboardShouldPersistTaps = Always | Never | Handled
  deriving (Show, Generic)
instance ToJSVal KeyboardShouldPersistTaps where
  toJSVal Always  = str "always"
  toJSVal Never   = str "never"
  toJSVal Handled = str "handled"

data OverScrollMode = Auto_ | Always_ | Never_
  deriving (Show, Generic)
instance ToJSVal OverScrollMode where
  toJSVal Auto_   = str "auto"
  toJSVal Always_ = str "always"
  toJSVal Never_  = str "never"

data ContentInsetAdjustmentBehavior = Automatic | ScrollableAxes | Never__ | Always__
  deriving (Show, Generic)
instance ToJSVal ContentInsetAdjustmentBehavior where
  toJSVal Automatic      = str "automatic"
  toJSVal ScrollableAxes = str "scrollableAxes"
  toJSVal Never__        = str "never"
  toJSVal Always__       = str "always"

data ContentOffset = ContentOffset {
  x :: Natural,
  y :: Natural
} deriving (Show,Generic)
instance FromJSON ContentOffset
instance ToJSON ContentOffset
instance ToJSVal ContentOffset where
  toJSVal = toJSVal . toJSON

data DecelerationRate = Fast_ | Normal_ | DecelerationRate Double
  deriving (Show, Generic)
instance ToJSVal DecelerationRate where
  toJSVal Fast_                = str "fast"
  toJSVal Normal_              = str "normal"
  toJSVal (DecelerationRate n) = toJSVal n

data IndicatorStyle = Default___ | Black___ | White
  deriving (Show, Generic)
instance ToJSVal IndicatorStyle where
  toJSVal Default___ = str "default"
  toJSVal Black___   = str "black"
  toJSVal White      = str "white"

data SnapToAlignment = Start | Center_ | End
  deriving (Show, Generic)
instance ToJSVal SnapToAlignment where
  toJSVal Start   = str "start"
  toJSVal Center_ = str "center"
  toJSVal End     = str "end"

-- TODO:
newtype ListViewDataSourceRef = ListViewDataSourceRef JSVal
  deriving Generic
instance ToJSVal ListViewDataSourceRef

data ActivityIndicatorSize = Small___ | Large___ | Size Natural
  deriving (Show, Generic)
instance ToJSVal ActivityIndicatorSize where
  toJSVal Small___ = str "small"
  toJSVal Large___ = str "large"
  toJSVal (Size x) = toJSVal x

data StatusBarStyle = Default____ | LightContent | DarkContent
  deriving (Show, Generic)
instance ToJSVal StatusBarStyle where
  toJSVal Default____  = str "default"
  toJSVal LightContent = str "light-content"
  toJSVal DarkContent  = str "dark-content"

data ShowHideTransition = Fade_ | Slide_
  deriving (Show, Generic)
instance ToJSVal ShowHideTransition where
  toJSVal Fade_  = str "fade"
  toJSVal Slide_ = str "slide"

data ItemPositioning = Fill | Center__ | Auto__
  deriving (Show, Generic)
instance ToJSVal ItemPositioning where
  toJSVal Fill     = str "fill"
  toJSVal Center__ = str "center"
  toJSVal Auto__   = str "auto"

data TabBarSystemIcon = Bookmarks_
                      | Contacts
                      | Downloads
                      | Favorites
                      | Featured
                      | History
                      | More
                      | MostRecent
                      | MostViewed
                      | Recents
                      | Search_
                      | TopRated
  deriving (Show, Generic)
instance ToJSVal TabBarSystemIcon where
  toJSVal Bookmarks_ = str "bookmarks"
  toJSVal Contacts   = str "contacts"
  toJSVal Downloads  = str "downloads"
  toJSVal Favorites  = str "favorites"
  toJSVal Featured   = str "featured"
  toJSVal History    = str "history"
  toJSVal More       = str "more"
  toJSVal MostRecent = str "most-recent"
  toJSVal MostViewed = str "most-viewed"
  toJSVal Recents    = str "recents"
  toJSVal Search_    = str "search"
  toJSVal TopRated   = str "top-rated"

data EllipsizeMode = Head | Middle | Tail | Clip
  deriving (Show, Generic)
instance ToJSVal EllipsizeMode where
  toJSVal Head   = str "head"
  toJSVal Middle = str "middle"
  toJSVal Tail   = str "tail"
  toJSVal Clip   = str "clip"

data OnLayoutVals = OnLayoutVals {
    x      :: Natural,
    y      :: Natural,
    width  :: Natural,
    height :: Natural
} deriving (Show, Generic)
instance FromJSON OnLayoutVals

newtype OnLayout = OnLayout {
  layout :: OnLayoutVals
} deriving (Show, Generic)
instance FromJSON OnLayout
instance FromJSVal OnLayout where
  fromJSVal jsval = parseMaybe parseJSON <$> nativeEvent jsval

data TextBreakStrategy = Simple | HighQuality | Balanced
  deriving (Show, Generic)
instance ToJSVal TextBreakStrategy where
  toJSVal Simple      = str "simple"
  toJSVal HighQuality = str "highQuality"
  toJSVal Balanced    = str "balanced"

data KeyboardType = Default_____
                  | EmailAddress
                  | Numeric
                  | PhonePad
                  | AsciiCapable
                  | NumbersAndPunctuation
                  | Url
                  | NumberPad
                  | NamePhonePad
                  | DecimalPad
                  | Twitter
                  | WebSearch
                  | VisiblePassword
  deriving (Show, Generic)
instance ToJSVal KeyboardType where
  toJSVal Default_____          = str "default"
  toJSVal EmailAddress          = str "email-address"
  toJSVal Numeric               = str "numeric"
  toJSVal PhonePad              = str "phone-pad"
  toJSVal AsciiCapable          = str "ascii-capable"
  toJSVal NumbersAndPunctuation = str "numbers-and-punctuation"
  toJSVal Url                   = str "url"
  toJSVal NumberPad             = str "number-pad"
  toJSVal NamePhonePad          = str "name-phone-pad"
  toJSVal DecimalPad            = str "decimal-pad"
  toJSVal Twitter               = str "twitter"
  toJSVal WebSearch             = str "web-search"
  toJSVal VisiblePassword       = str "visible-password"

data ContentSize = ContentSize {
  width  :: Natural,
  height :: Natural
} deriving (Show, Generic)
instance FromJSON ContentSize
instance ToJSON ContentSize
instance ToJSVal ContentSize where
  toJSVal = toJSVal . toJSON

newtype OnContentSizeChange = OnContentSizeChange {
    contentSize :: ContentSize
} deriving (Show, Generic)
instance FromJSON OnContentSizeChange
instance FromJSVal OnContentSizeChange where fromJSVal = fromNativeJSON

newtype OnScroll = OnScroll {
    contentOffset :: ContentOffset
} deriving (Show, Generic)
instance FromJSON OnScroll
instance FromJSVal OnScroll where fromJSVal = fromNativeJSON

data Selection = Selection {
  start :: Natural,
  end   :: Natural
} deriving (Show, Generic)
instance FromJSON Selection
instance ToJSON Selection
instance ToJSVal Selection where
  toJSVal = toJSVal . toJSON
newtype OnSelectionChange = OnSelectionChange {
    selection :: Selection
} deriving (Show, Generic)
instance FromJSON OnSelectionChange
instance FromJSVal OnSelectionChange where fromJSVal = fromNativeJSON

newtype OnChange = OnChange {
    selectedSegmentIndex :: Natural
} deriving (Show, Generic)
instance FromJSON OnChange
instance FromJSVal OnChange where fromJSVal = fromNativeJSON

data AutoCapitalize = None__ | Sentences | Words | Characters
  deriving (Show, Generic)
instance ToJSVal AutoCapitalize where
  toJSVal None__     = str "none"
  toJSVal Sentences  = str "words"
  toJSVal Words      = str "sentences"
  toJSVal Characters = str "characters"

data ReturnKeyType = Done_
                   | Go
                   | Next
                   | Search__
                   | Send
                   | None___
                   | Previous
                   | Default______
                   | EmergencyCall
                   | Google
                   | Join
                   | Route_
                   | Yahoo
  deriving (Show, Generic)
instance ToJSVal ReturnKeyType where
  toJSVal Done_         = str "done"
  toJSVal Go            = str "go"
  toJSVal Next          = str "next"
  toJSVal Search__      = str "search"
  toJSVal Send          = str "send"
  toJSVal None___       = str "none"
  toJSVal Previous      = str "previous"
  toJSVal Default______ = str "default"
  toJSVal EmergencyCall = str "emergency-call"
  toJSVal Google        = str "google"
  toJSVal Join          = str "join"
  toJSVal Route_        = str "route"
  toJSVal Yahoo         = str "yahoo"

data ClearButtonMode = Never___ | WhileEditing | UnlessEditing | Always___
  deriving (Show, Generic)
instance ToJSVal ClearButtonMode where
  toJSVal Never___      = str "never"
  toJSVal WhileEditing  = str "while-editing"
  toJSVal UnlessEditing = str "unless-editing"
  toJSVal Always___     = str "always"

data DataDetectorType = PhoneNumber
                       | Link
                       | Address
                       | CalendarEvent
                       | None____
                       | All
  deriving (Show, Generic)
instance ToJSVal DataDetectorType where
  toJSVal PhoneNumber   = str "phoneNumber"
  toJSVal Link          = str "link"
  toJSVal Address       = str "address"
  toJSVal CalendarEvent = str "calendarEvent"
  toJSVal None____      = str "none"
  toJSVal All           = str "all"
data DataDetectorTypes = DataDetectorType DataDetectorType | DataDetectorTypes [DataDetectorType]
  deriving (Show, Generic)
instance ToJSVal DataDetectorTypes where
  toJSVal (DataDetectorType x)   = toJSVal x
  toJSVal (DataDetectorTypes xs) = toJSVal xs

data KeyboardAppearance = Default_______ | Light | Dark
  deriving (Show, Generic)
instance ToJSVal KeyboardAppearance where
  toJSVal Default_______ = str "default"
  toJSVal Light          = str "light"
  toJSVal Dark           = str "dark"

newtype OnKeyPress = OnKeyPress {
  key :: String
} deriving (Show, Generic)
instance FromJSON OnKeyPress
instance FromJSVal OnKeyPress where
  fromJSVal = fromNativeJSON

data ActionShow = Always____ | IfRoom | Never____
  deriving (Show,Generic)
instance ToJSVal ActionShow where
  toJSVal Always____ = str "always"
  toJSVal IfRoom     = str "ifRoom"
  toJSVal Never____  = str "never"

data Action = Action_ {
  title        :: String,
  icon         :: ImageSource,
  show         :: ActionShow,
  showWithText :: Bool
} deriving (Show,Generic)
instance ToJSVal Action where
  toJSVal (Action_ t i s w) = do
    obj@(OI.Object obj') <- OI.create
    toJSVal t >>= \x -> OI.setProp "title" x obj
    toJSVal i >>= \x -> OI.setProp "icon" x obj
    toJSVal s >>= \x -> OI.setProp "show" x obj
    toJSVal w >>= \x -> OI.setProp "showWithText" x obj
    pure obj'


-- TODO
data DocumentSelectionState
  deriving Generic
instance ToJSVal DocumentSelectionState

data TvParallaxProperties = TvParallaxProperties {
  enabled        :: Bool,
  shiftDistanceX :: Double,
  shiftDistanceY :: Double,
  magnification  :: Double
} deriving (Show,Generic)
instance ToJSON TvParallaxProperties
instance ToJSVal TvParallaxProperties where
  toJSVal = toJSVal . toJSON

data AccessibilityComponentTypes = None______ | Button | RadiobuttonChecked | RadiobuttonUnchecked
  deriving (Show, Generic)
instance ToJSVal AccessibilityComponentTypes where
  toJSVal None______           = str "none"
  toJSVal Button               = str "button"
  toJSVal RadiobuttonChecked   = str "radiobutton_checked"
  toJSVal RadiobuttonUnchecked = str "radiobutton_unchecked"

data AccessibilityTrait = None_______
                        | Button_
                        | Link_
                        | Header
                        | Search___
                        | Image
                        | Selected
                        | Plays
                        | Key
                        | Text
                        | Summary
                        | Disabled
                        | FrequentUpdates
                        | StartsMedia
                        | Adjustable
                        | AllowsDirectInteraction
                        | PageTurn
  deriving (Show, Generic)
instance ToJSVal AccessibilityTrait where
    toJSVal None_______             = str "none"
    toJSVal Button_                 = str "button"
    toJSVal Link_                   = str "link"
    toJSVal Header                  = str "header"
    toJSVal Search___               = str "search"
    toJSVal Image                   = str "image"
    toJSVal Selected                = str "selected"
    toJSVal Plays                   = str "plays"
    toJSVal Key                     = str "key"
    toJSVal Text                    = str "text"
    toJSVal Summary                 = str "summary"
    toJSVal Disabled                = str "disabled"
    toJSVal FrequentUpdates         = str "frequentUpdates"
    toJSVal StartsMedia             = str "startsMedia"
    toJSVal Adjustable              = str "adjustable"
    toJSVal AllowsDirectInteraction = str "allowsDirectInteraction"
    toJSVal PageTurn                = str "pageTurn"
data AccessibilityTraits =  AccessibilityTrait AccessibilityTrait |  AccessibilityTraits [AccessibilityTrait]
  deriving (Show, Generic)
instance ToJSVal AccessibilityTraits

-- copied from React.Flux.PropertiesAndEvents since parseTouch wasn't exported
instance FromJSVal Touch where
  fromJSVal o = pure $ Just Touch
      { touchIdentifier = o .: "identifier"
      , touchTarget = EventTarget $ js_getProp o "target"
      , touchScreenX = o .: "screenX"
      , touchScreenY = o .: "screenY"
      , touchClientX = o .: "clientX"
      , touchClientY = o .: "clientY"
      , touchPageX = o .: "pageX"
      , touchPageY = o .: "pageY"
      }
    where
      (.:) :: FromJSVal b => JSVal -> JSString -> b
      obj .: key = fromMaybe (error "Unable to decode event target") $ unsafePerformIO $  -- TODO: get rid of the unsafePerformIO here!
                    fromJSVal $ js_getProp obj key

data SyntheticTouchEvent = SyntheticTouchEvent {
  changedTouches :: [Touch],
  identifier     :: String,
  locationX      :: Int,
  locationY      :: Int,
  pageX          :: Natural,
  pageY          :: Natural,
  target         :: NodeID,
  timestamp      :: LocalTime, -- ?
  touches        :: [Touch]
}  deriving (Show, Generic)
instance FromJSVal SyntheticTouchEvent

data PointerEvents = BoxNone | None_____ | BoxOnly | Auto_____
  deriving (Show, Generic)
instance ToJSVal PointerEvents where
  toJSVal BoxNone   = str "box-none"
  toJSVal None_____ = str "none"
  toJSVal BoxOnly   = str "box-only"
  toJSVal Auto_____ = str "auto"

data AccessibilityLiveRegion = None________ | Polite | Assertive
  deriving (Show, Generic)
instance ToJSVal AccessibilityLiveRegion where
  toJSVal None________ = str "none"
  toJSVal Polite       = str "polite"
  toJSVal Assertive    = str "assertive"

data ImportantForAccessibility = Auto______ | Yes | No | NoHideDescendants
   deriving (Show, Generic)
instance ToJSVal ImportantForAccessibility where
  toJSVal Auto______        = str "auto"
  toJSVal Yes               = str "yes"
  toJSVal No                = str "no"
  toJSVal NoHideDescendants = str "no-hide-descendants"

data MixedContentMode = Never______ | Always______ | Compatibility
  deriving (Show, Generic)
instance ToJSVal MixedContentMode where
  toJSVal Never______   = str "never"
  toJSVal Always______  = str "always"
  toJSVal Compatibility = str "compatibility"

data AlignContent = FlexStart | FlexEnd | Center___ | Stretch_ | SpaceBetween | SpaceAround
  deriving (Show, Generic)
instance ToJSVal AlignContent where
  toJSVal FlexStart    = str "flex-start"
  toJSVal FlexEnd      = str "flex-end"
  toJSVal Center___    = str "center"
  toJSVal Stretch_     = str "stretch"
  toJSVal SpaceBetween = str "space-between"
  toJSVal SpaceAround  = str "space-around"

data AlignSelf = Auto_______ | FlexStart_ | FlexEnd_ | Center____ | Stretch__ | Baseline
  deriving (Show, Generic)
instance ToJSVal AlignSelf where
  toJSVal Auto_______ = str "auto"
  toJSVal FlexStart_  = str "flex-start"
  toJSVal FlexEnd_    = str "flex-end"
  toJSVal Center____  = str "center"
  toJSVal Stretch__   = str "strech"
  toJSVal Baseline    = str "baseline"

data Display = None_________ | Flex
  deriving (Show, Generic)
instance ToJSVal Display where
  toJSVal None_________ = str "none"
  toJSVal Flex          = str "flex"

data FlexDirection = Row | RowReverse | Column | ColumnReverse
  deriving (Show, Generic)
instance ToJSVal FlexDirection where
  toJSVal Row           = str "row"
  toJSVal RowReverse    = str "row-reverse"
  toJSVal Column        = str "column"
  toJSVal ColumnReverse = str "column-reverse"

data FlexWrap = Wrap | NoWrap
  deriving (Show, Generic)
instance ToJSVal FlexWrap where
  toJSVal Wrap   = str "wrap"
  toJSVal NoWrap = str "nowrap"

data JustifyContent = FlexStart__ | FlexEnd__ | Center_____ | SpaceBetween_ | SpaceAround_
  deriving (Show, Generic)
instance ToJSVal JustifyContent where
  toJSVal FlexStart__   = str "flex-start"
  toJSVal FlexEnd__     = str "flex-end"
  toJSVal Center_____   = str "center"
  toJSVal SpaceBetween_ = str "space-between"
  toJSVal SpaceAround_  = str "space-around"

data AlignItems = FlexStart___ | FlexEnd___ | Center______ | Stretch___ | Baseline_
  deriving (Show, Generic)
instance ToJSVal AlignItems where
  toJSVal FlexStart___ = str "flex-start"
  toJSVal FlexEnd___   = str "flex-end"
  toJSVal Center______ = str "center"
  toJSVal Stretch___   = str "stretch"
  toJSVal Baseline_    = str "baseline"

data Overflow = Visible_ | Hidden_ | Scroll
  deriving (Show, Generic)
instance ToJSVal Overflow where
  toJSVal Visible_ = str "visible"
  toJSVal Hidden_  = str "hidden"
  toJSVal Scroll   = str "scroll"

data Position = Absolute | Relative
  deriving (Show, Generic)
instance ToJSVal Position where
  toJSVal Absolute = str "absolute"
  toJSVal Relative = str "relative"

data Direction = Inherit | LtR | RtL
  deriving (Show, Generic)
instance ToJSVal Direction where
  toJSVal Inherit = str "inherit"
  toJSVal LtR     = str "ltr"
  toJSVal RtL     = str "rtl"

data FontStyle = Normal__ | Italic
  deriving (Show, Generic)
instance ToJSVal FontStyle where
  toJSVal Normal__ = str "normal"
  toJSVal Italic   = str "italic"

data FontWeight = Normal___ | Bold | W100 | W200 | W300 | W400 | W500 | W600 | W700 | W800 | W900
  deriving (Show, Generic)
instance ToJSVal FontWeight where
  toJSVal Normal___ = str "normal"
  toJSVal Bold      = str "bold"
  toJSVal W100      = str "100"
  toJSVal W200      = str "200"
  toJSVal W300      = str "300"
  toJSVal W400      = str "400"
  toJSVal W500      = str "500"
  toJSVal W600      = str "600"
  toJSVal W700      = str "700"
  toJSVal W800      = str "800"
  toJSVal W900      = str "900"

data TextAlign = Auto________ | Left_ | Right_ | Center_______ | Justify
  deriving (Show, Generic)
instance ToJSVal TextAlign where
  toJSVal Auto________  = str "normal"
  toJSVal Left_         = str "italic"
  toJSVal Right_        = str "italic"
  toJSVal Center_______ = str "italic"
  toJSVal Justify       = str "italic"

data TextDecorationLine = None__________ | Underline | LineThrough | UnderlineLineThrough
  deriving (Show, Generic)
instance ToJSVal TextDecorationLine where
  toJSVal None__________       = str "none"
  toJSVal Underline            = str "underline"
  toJSVal LineThrough          = str "line-through"
  toJSVal UnderlineLineThrough = str "underline line-through"

data TextAlignVertical = Auto_________ | Top | Bottom | Center________
  deriving (Show, Generic)
instance ToJSVal TextAlignVertical where
  toJSVal Auto_________  = str "auto"
  toJSVal Top            = str "top"
  toJSVal Bottom         = str "bottom"
  toJSVal Center________ = str "center"

data FontVariant = SmallCaps | OldStyleNums | LiningNums | TabularNums | ProportionalNums
  deriving (Show, Generic)
instance ToJSVal FontVariant where
  toJSVal SmallCaps        = str "small-caps"
  toJSVal OldStyleNums     = str "oldstyle-nums"
  toJSVal LiningNums       = str "lining-nums"
  toJSVal TabularNums      = str "tabular-nums"
  toJSVal ProportionalNums = str "proportional-nums"

data TextDecorationStyle = Solid | Double | Dotted | Dashed
  deriving (Show, Generic)
instance ToJSVal TextDecorationStyle where
  toJSVal Solid  = str "solid"
  toJSVal Double = str "double"
  toJSVal Dotted = str "dotted"
  toJSVal Dashed = str "dashed"

data WritingDirection = Auto__________ | LtR_ | RtL_
  deriving (Show, Generic)
instance ToJSVal WritingDirection where
  toJSVal Auto__________ = str "auto"
  toJSVal LtR_           = str "ltr"
  toJSVal RtL_           = str "rtl"


-- Transform:

data Angle = Deg Double | Rad Double
  deriving (Show, Generic)
instance ToJSON Angle where
  toJSON (Deg x) = toJSON $ P.show x ++ "deg"
  toJSON (Rad x) = toJSON $ P.show x ++ "rad"

data Transform = Perspective Int
               | Rotate Angle
               | RotateX Angle
               | RotateY Angle
               | RotateZ Angle
               | Scale_ Natural
               | ScaleX Natural
               | ScaleY Natural
               | TranslateX Int
               | TranslateY Int
               | SkewX Angle
               | SkewY Angle
  deriving (Show, Generic)

instance ToJSON Transform where
  toJSON (Perspective x) = object [ "perspective" .= x ]
  toJSON (Rotate x)      = object [ "rotate"      .= x ]
  toJSON (RotateX x)     = object [ "rotateX"     .= x ]
  toJSON (RotateY x)     = object [ "rotateY"     .= x ]
  toJSON (RotateZ x)     = object [ "rotateZ"     .= x ]
  toJSON (Scale_ x)      = object [ "scale"       .= x ]
  toJSON (ScaleX x)      = object [ "scaleX"      .= x ]
  toJSON (ScaleY x)      = object [ "scaleY"      .= x ]
  toJSON (TranslateX x)  = object [ "translateX"  .= x ]
  toJSON (TranslateY x)  = object [ "translateY"  .= x ]
  toJSON (SkewX x)       = object [ "skewX"       .= x ]
  toJSON (SkewY x)       = object [ "skewY"       .= x ]

instance ToJSVal Transform where
  toJSVal = toJSVal . toJSON

data BorderStyle = Solid_ | Dotted_ | Dashed_
  deriving (Show, Generic)
instance ToJSVal BorderStyle where
  toJSVal Solid_  = str "solid"
  toJSVal Dotted_ = str "dotted"
  toJSVal Dashed_ = str "dashed"

#ifdef __GHCJS__

foreign import javascript unsafe
  "require_FIXME_DOES_NOT_WORK($1)"
  js_require :: JSString -> IO JSVal

foreign import javascript unsafe
  "$1[$2]"
  js_getProp :: JSVal -> JSString -> JSVal

#else

js_require :: JSString -> IO JSVal
js_require _ = error "js_require only works with GHCJS"

js_getProp :: JSVal -> JSString -> JSVal
js_getProp _ = error "js_getProp only works with GHCJS"

#endif
