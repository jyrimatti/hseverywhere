{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.WebView (
    module React.Flux.Rn.Components.WebView,
    DataDetectorTypes(..),
    DecelerationRate(..), Inset(Inset),
    JavaScript, MixedContentMode(..),
    OnMessage(OnMessage), Source(..),
    ViewProps.AccessibilityComponentTypes(..),
    ViewProps.AccessibilityLiveRegion(..),
    ViewProps.AccessibilityTraits(..),
    ViewProps.ImportantForAccessibility(..),
    ViewProps.OnLayout(OnLayout),
    ViewProps.PointerEvents(..),
    ViewProps.SyntheticTouchEvent(SyntheticTouchEvent)
) where

import           Data.Typeable                 (Typeable)
import           Prelude                       (Bool, String)
import           React.Flux.Rn.Components      (Props, WebView, prop)
import           React.Flux.Rn.Events          (EventHandlerType, on0, on1,
                                                ret1, view0)
import qualified React.Flux.Rn.Props.ViewProps as ViewProps
import           React.Flux.Rn.Types           (DataDetectorTypes (..),
                                                DecelerationRate (..),
                                                Inset (Inset), JavaScript,
                                                MixedContentMode (..),
                                                OnMessage (OnMessage),
                                                ReactViewRef, Source (..))

source :: Source -> Props WebView handler
source = prop "source"

automaticallyAdjustContentInsets :: Bool -> Props WebView handler
automaticallyAdjustContentInsets = prop "automaticallyAdjustContentInsets"

injectJavaScript :: (JavaScript -> EventHandlerType handler) -> Props WebView handler
injectJavaScript = on1 "injectJavaScript"

injectedJavaScript :: JavaScript -> Props WebView handler
injectedJavaScript = prop "injectedJavaScript"

mediaPlaybackRequiresUserAction :: Bool -> Props WebView handler
mediaPlaybackRequiresUserAction = prop "mediaPlaybackRequiresUserAction"

-- TODO: ?
--nativeConfig :: NativeConfig -> Props WebView handler
--nativeConfig = prop "nativeConfig"

onError :: EventHandlerType handler -> Props WebView handler
onError = on0 "onError"

onLoad :: EventHandlerType handler -> Props WebView handler
onLoad = on0 "onLoad"

onLoadEnd :: EventHandlerType handler -> Props WebView handler
onLoadEnd = on0 "onLoadEnd"

onLoadStart :: EventHandlerType handler -> Props WebView handler
onLoadStart = on0 "onLoadStart"

onMessage :: (OnMessage -> EventHandlerType handler) -> Props WebView handler
onMessage = on1 "onMessage"

onNavigationStateChange :: EventHandlerType handler -> Props WebView handler
onNavigationStateChange = on0 "onNavigationStateChange"

renderError :: Typeable props => ReactViewRef props -> Props WebView handler
renderError = view0 "renderError"

renderLoading :: Typeable props => ReactViewRef props -> Props WebView handler
renderLoading = view0 "renderLoading"

scalesPageToFit :: Bool -> Props WebView handler
scalesPageToFit = prop "scalesPageToFit"

-- Platform: IOS
onShouldStartLoadWithRequest :: (() -> Bool) -> Props WebView handler
onShouldStartLoadWithRequest = ret1 "onShouldStartLoadWithRequest"

startInLoadingState :: Bool -> Props WebView handler
startInLoadingState = prop "startInLoadingState"

-- Platform: IOS
decelerationRate :: DecelerationRate -> Props WebView handler
decelerationRate = prop "decelerationRate"

-- Platform: Android
domStorageEnabled :: Bool -> Props WebView handler
domStorageEnabled = prop "domStorageEnabled"

-- Platform: Android
javaScriptEnabled :: Bool -> Props WebView handler
javaScriptEnabled = prop "javaScriptEnabled"

-- Platform: Android
mixedContentMode :: MixedContentMode -> Props WebView handler
mixedContentMode = prop "mixedContentMode"

-- Platform: Android
thirdPartyCookiesEnabled :: Bool -> Props WebView handler
thirdPartyCookiesEnabled = prop "thirdPartyCookiesEnabled"

-- Platform: Android
userAgent :: String -> Props WebView handler
userAgent = prop "userAgent"

-- Platform: IOS
allowsInlineMediaPlayback :: Bool -> Props WebView handler
allowsInlineMediaPlayback = prop "allowsInlineMediaPlayback"

-- Platform: IOS
bounces :: Bool -> Props WebView handler
bounces = prop "bounces"

-- Platform: IOS
contentInset :: Inset -> Props WebView handler
contentInset = prop "contentInset"

-- Platform: IOS
dataDetectorTypes :: DataDetectorTypes -> Props WebView handler
dataDetectorTypes = prop "dataDetectorTypes"

-- Platform: IOS
scrollEnabled :: Bool -> Props WebView handler
scrollEnabled = prop "scrollEnabled"

-- ViewProps:

onStartShouldSetResponder        = ViewProps.onStartShouldSetResponder @WebView
accessibilityLabel               = ViewProps.accessibilityLabel @WebView
hitSlop                          = ViewProps.hitSlop @WebView
nativeID                         = ViewProps.nativeID @WebView
onAccessibilityTap               = ViewProps.onAccessibilityTap @WebView
onLayout                         = ViewProps.onLayout @WebView
onMagicTap                       = ViewProps.onMagicTap @WebView
onMoveShouldSetResponder         = ViewProps.onMoveShouldSetResponder @WebView
onMoveShouldSetResponderCapture  = ViewProps.onMoveShouldSetResponderCapture @WebView
onResponderGrant                 = ViewProps.onResponderGrant @WebView
onResponderMove                  = ViewProps.onResponderMove @WebView
onResponderReject                = ViewProps.onResponderReject @WebView
onResponderRelease               = ViewProps.onResponderRelease @WebView
onResponderTerminate             = ViewProps.onResponderTerminate @WebView
onResponderTerminationRequest    = ViewProps.onResponderTerminationRequest @WebView
accessible                       = ViewProps.accessible @WebView
onStartShouldSetResponderCapture = ViewProps.onStartShouldSetResponderCapture @WebView
pointerEvents                    = ViewProps.pointerEvents @WebView
removeClippedSubviews            = ViewProps.removeClippedSubviews @WebView
style                            = ViewProps.style @WebView
testID                           = ViewProps.testID @WebView
accessibilityComponentType       = ViewProps.accessibilityComponentType @WebView
accessibilityLiveRegion          = ViewProps.accessibilityLiveRegion @WebView
collapsable                      = ViewProps.collapsable @WebView
importantForAccessibility        = ViewProps.importantForAccessibility @WebView
needsOffscreenAlphaCompositing   = ViewProps.needsOffscreenAlphaCompositing @WebView
renderToHardwareTextureAndroid   = ViewProps.renderToHardwareTextureAndroid @WebView
accessibilityTraits              = ViewProps.accessibilityTraits @WebView
accessibilityViewIsModal         = ViewProps.accessibilityViewIsModal @WebView
shouldRasterizeIOS               = ViewProps.shouldRasterizeIOS @WebView


-- TODO: Methods
