{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.TextInput (
    module React.Flux.Rn.Components.TextInput,
    Color(..), KeyboardType(..),
    OnContentSizeChange(OnContentSizeChange), DataDetectorTypes(..), KeyboardAppearance(..), OnKeyPress(OnKeyPress), DocumentSelectionState,
    ReturnKeyType(..), Selection(Selection), TextBreakStrategy(..), ClearButtonMode(..), OnScroll(OnScroll), OnSelectionChange(OnSelectionChange), AutoCapitalize(..),
    ViewProps.AccessibilityComponentTypes(..),
    ViewProps.AccessibilityLiveRegion(..),
    ViewProps.AccessibilityTraits(..),
    ViewProps.ImportantForAccessibility(..),
    ViewProps.Inset(Inset),
    ViewProps.OnLayout(OnLayout),
    ViewProps.PointerEvents(..),
    ViewProps.SyntheticTouchEvent(SyntheticTouchEvent)
) where

import           Numeric.Natural               (Natural)
import           Prelude                       (Bool, Int, String)
import           Prelude                       (fmap)
import           Prelude                       ((.))
import           React.Flux                    (ReactElementM, foreign_)
import           React.Flux.Rn.Events          (EventHandlerType, on0, on1)
import           React.Flux.Rn.Properties      (Props, Styles, nestedProp, prop,
                                                props)
import qualified React.Flux.Rn.Props.ViewProps as ViewProps
import           React.Flux.Rn.Types           (AutoCapitalize (..),
                                                ClearButtonMode (..),
                                                Color (..),
                                                DataDetectorTypes (..),
                                                DocumentSelectionState,
                                                KeyboardAppearance (..),
                                                KeyboardType (..),
                                                OnContentSizeChange (OnContentSizeChange),
                                                OnKeyPress (OnKeyPress),
                                                OnScroll (OnScroll),
                                                OnSelectionChange (OnSelectionChange),
                                                ReturnKeyType (..),
                                                Selection (Selection),
                                                TextBreakStrategy (..))

data TextInput
textInput :: [Props TextInput handler] -> ReactElementM handler a -> ReactElementM handler a
textInput = foreign_ "TextInput" . fmap props

placeholderTextColor :: Color -> Props TextInput handler
placeholderTextColor = prop "placeholderTextColor"

allowFontScaling :: Bool -> Props TextInput handler
allowFontScaling = prop "allowFontScaling"

autoCorrect :: Bool -> Props TextInput handler
autoCorrect = prop "autoCorrect"

autoFocus :: Bool -> Props TextInput handler
autoFocus = prop "autoFocus"

blurOnSubmit :: Bool -> Props TextInput handler
blurOnSubmit = prop "blurOnSubmit"

caretHidden :: Bool -> Props TextInput handler
caretHidden = prop "caretHidden"

defaultValue :: String -> Props TextInput handler
defaultValue = prop "defaultValue"

editable :: Bool -> Props TextInput handler
editable = prop "editable"

keyboardType :: KeyboardType -> Props TextInput handler
keyboardType = prop "keyboardType"

maxHeight :: Natural -> Props TextInput handler
maxHeight = prop "maxHeight"

maxLength :: Natural -> Props TextInput handler
maxLength = prop "maxLength"

multiline :: Bool -> Props TextInput handler
multiline = prop "multiline"

onBlur :: EventHandlerType handler -> Props TextInput handler
onBlur = on0 "onBlur"

onChange :: EventHandlerType handler -> Props TextInput handler
onChange = on0 "onChange"

onChangeText :: (String -> EventHandlerType handler) -> Props TextInput handler
onChangeText = on1 "onChangeText"

onContentSizeChange :: (OnContentSizeChange -> EventHandlerType handler) -> Props TextInput handler
onContentSizeChange = on1 "onContentSizeChange"

onEndEditing :: EventHandlerType handler -> Props TextInput handler
onEndEditing = on0 "onEndEditing"

onFocus :: EventHandlerType handler -> Props TextInput handler
onFocus = on0 "onFocus"

onScroll :: (OnScroll -> EventHandlerType handler) -> Props TextInput handler
onScroll = on1 "onScroll"

onSelectionChange :: (OnSelectionChange -> EventHandlerType handler) -> Props TextInput handler
onSelectionChange = on1 "onSelectionChange"

onSubmitEditing :: EventHandlerType handler -> Props TextInput handler
onSubmitEditing = on0 "onSubmitEditing"

placeholder :: String -> Props TextInput handler
placeholder = prop "placeholder"

autoCapitalize :: AutoCapitalize -> Props TextInput handler
autoCapitalize = prop "autoCapitalize"

returnKeyType :: ReturnKeyType -> Props TextInput handler
returnKeyType = prop "returnKeyType"

secureTextEntry :: Bool -> Props TextInput handler
secureTextEntry = prop "secureTextEntry"

selectTextOnFocus :: Bool -> Props TextInput handler
selectTextOnFocus = prop "selectTextOnFocus"

selection :: Selection -> Props TextInput handler
selection = prop "selection"

selectionColor :: Color -> Props TextInput handler
selectionColor = prop "selectionColor"

style :: [Styles TextInput handler] -> Props TextInput handler
style = nestedProp "style"

value :: String -> Props TextInput handler
value = prop "value"

-- Platform: Android
autoGrow :: Bool -> Props TextInput handler
autoGrow = prop "autoGrow"

-- Platform: Android
disableFullscreenUI :: Bool -> Props TextInput handler
disableFullscreenUI = prop "disableFullscreenUI"

-- Platform: Android
inlineImageLeft :: String -> Props TextInput handler
inlineImageLeft = prop "inlineImageLeft"

-- Platform: Android
inlineImagePadding :: Int -> Props TextInput handler
inlineImagePadding = prop "inlineImagePadding"

-- Platform: Android
numberOfLines :: Natural -> Props TextInput handler
numberOfLines = prop "numberOfLines"

-- Platform: Android
returnKeyLabel :: String -> Props TextInput handler
returnKeyLabel = prop "returnKeyLabel"

-- Platform: Android
textBreakStrategy :: TextBreakStrategy -> Props TextInput handler
textBreakStrategy = prop "textBreakStrategy"

-- Platform: Android
underlineColorAndroid :: Color -> Props TextInput handler
underlineColorAndroid = prop "underlineColorAndroid"

-- Platform: IOS
clearButtonMode :: ClearButtonMode -> Props TextInput handler
clearButtonMode = prop "clearButtonMode"

-- Platform: IOS
clearTextOnFocus :: Bool -> Props TextInput handler
clearTextOnFocus = prop "clearTextOnFocus"

-- Platform: IOS
dataDetectorTypes :: DataDetectorTypes -> Props TextInput handler
dataDetectorTypes = prop "dataDetectorTypes"

-- Platform: IOS
enablesReturnKeyAutomatically :: Bool -> Props TextInput handler
enablesReturnKeyAutomatically = prop "enablesReturnKeyAutomatically"

-- Platform: IOS
keyboardAppearance :: KeyboardAppearance -> Props TextInput handler
keyboardAppearance = prop "keyboardAppearance"

-- Platform: IOS
onKeyPress :: (OnKeyPress -> EventHandlerType handler) -> Props TextInput handler
onKeyPress = on1 "onKeyPress"

-- Platform: IOS
selectionState :: DocumentSelectionState -> Props TextInput handler
selectionState = prop "selectionState"

-- Platform: IOS
spellCheck :: Bool -> Props TextInput handler
spellCheck = prop "spellCheck"

-- ViewProps:

onStartShouldSetResponder        = ViewProps.onStartShouldSetResponder @TextInput
accessibilityLabel               = ViewProps.accessibilityLabel @TextInput
hitSlop                          = ViewProps.hitSlop @TextInput
nativeID                         = ViewProps.nativeID @TextInput
onAccessibilityTap               = ViewProps.onAccessibilityTap @TextInput
onLayout                         = ViewProps.onLayout @TextInput
onMagicTap                       = ViewProps.onMagicTap @TextInput
onMoveShouldSetResponder         = ViewProps.onMoveShouldSetResponder @TextInput
onMoveShouldSetResponderCapture  = ViewProps.onMoveShouldSetResponderCapture @TextInput
onResponderGrant                 = ViewProps.onResponderGrant @TextInput
onResponderMove                  = ViewProps.onResponderMove @TextInput
onResponderReject                = ViewProps.onResponderReject @TextInput
onResponderRelease               = ViewProps.onResponderRelease @TextInput
onResponderTerminate             = ViewProps.onResponderTerminate @TextInput
onResponderTerminationRequest    = ViewProps.onResponderTerminationRequest @TextInput
accessible                       = ViewProps.accessible @TextInput
onStartShouldSetResponderCapture = ViewProps.onStartShouldSetResponderCapture @TextInput
pointerEvents                    = ViewProps.pointerEvents @TextInput
removeClippedSubviews            = ViewProps.removeClippedSubviews @TextInput
testID                           = ViewProps.testID @TextInput
accessibilityComponentType       = ViewProps.accessibilityComponentType @TextInput
accessibilityLiveRegion          = ViewProps.accessibilityLiveRegion @TextInput
collapsable                      = ViewProps.collapsable @TextInput
importantForAccessibility        = ViewProps.importantForAccessibility @TextInput
needsOffscreenAlphaCompositing   = ViewProps.needsOffscreenAlphaCompositing @TextInput
renderToHardwareTextureAndroid   = ViewProps.renderToHardwareTextureAndroid @TextInput
accessibilityTraits              = ViewProps.accessibilityTraits @TextInput
accessibilityViewIsModal         = ViewProps.accessibilityViewIsModal @TextInput
shouldRasterizeIOS               = ViewProps.shouldRasterizeIOS @TextInput


-- TODO: methods
