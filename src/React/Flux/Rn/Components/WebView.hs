{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.WebView where

import           Numeric.Natural
import           Prelude                        (Bool, String, const, pure, ($),
                                                 (.), (<$>))
import           React.Flux
import           React.Flux.Internal            (HandlerArg (..),
                                                 PropertyOrHandler_ (..))
import           React.Flux.PropertiesAndEvents (callback)
import           React.Flux.Rn.Events
import           React.Flux.Rn.Types

source :: Source -> PropertyOrHandler handler
source = (&=) "source"

automaticallyAdjustContentInsets :: Bool -> PropertyOrHandler handler
automaticallyAdjustContentInsets = (&=) "automaticallyAdjustContentInsets"

injectJavaScript :: (JavaScript -> EventHandlerType handler) -> PropertyOrHandler handler
injectJavaScript = on1 "injectJavaScript"

injectedJavaScript :: JavaScript -> PropertyOrHandler handler
injectedJavaScript = (&=) "injectedJavaScript"

mediaPlaybackRequiresUserAction :: Bool -> PropertyOrHandler handler
mediaPlaybackRequiresUserAction = (&=) "mediaPlaybackRequiresUserAction"

-- TODO: ?
--nativeConfig :: NativeConfig -> PropertyOrHandler handler
--nativeConfig = (&=) "nativeConfig"

onError :: EventHandlerType handler -> PropertyOrHandler handler
onError = on0 "onError"

onLoad :: EventHandlerType handler -> PropertyOrHandler handler
onLoad = on0 "onLoad"

onLoadEnd :: EventHandlerType handler -> PropertyOrHandler handler
onLoadEnd = on0 "onLoadEnd"

onLoadStart :: EventHandlerType handler -> PropertyOrHandler handler
onLoadStart = on0 "onLoadStart"

onMessage :: (OnMessage -> EventHandlerType handler) -> PropertyOrHandler handler
onMessage = on1 "onMessage"

onNavigationStateChange :: EventHandlerType handler -> PropertyOrHandler handler
onNavigationStateChange = on0 "onNavigationStateChange"

renderError :: Typeable props => ReactViewRef props -> PropertyOrHandler handler
renderError = view0 "renderError"

renderLoading :: Typeable props => ReactViewRef props -> PropertyOrHandler handler
renderLoading = view0 "renderLoading"

scalesPageToFit :: Bool -> PropertyOrHandler handler
scalesPageToFit = (&=) "scalesPageToFit"

-- Platform: IOS
onShouldStartLoadWithRequest :: (() -> Bool) -> PropertyOrHandler handler
onShouldStartLoadWithRequest = ret1 "onShouldStartLoadWithRequest"

startInLoadingState :: Bool -> PropertyOrHandler handler
startInLoadingState = (&=) "startInLoadingState"

style :: ViewStyleProps -> PropertyOrHandler handler
style = nestedProperty "style"

-- Platform: IOS
decelerationRate :: DecelerationRate -> PropertyOrHandler handler
decelerationRate = (&=) "decelerationRate"

-- Platform: Android
domStorageEnabled :: Bool -> PropertyOrHandler handler
domStorageEnabled = (&=) "domStorageEnabled"

-- Platform: Android
javaScriptEnabled :: Bool -> PropertyOrHandler handler
javaScriptEnabled = (&=) "javaScriptEnabled"

-- Platform: Android
mixedContentMode :: MixedContentMode -> PropertyOrHandler handler
mixedContentMode = (&=) "mixedContentMode"

-- Platform: Android
thirdPartyCookiesEnabled :: Bool -> PropertyOrHandler handler
thirdPartyCookiesEnabled = (&=) "thirdPartyCookiesEnabled"

-- Platform: Android
userAgent :: String -> PropertyOrHandler handler
userAgent = (&=) "userAgent"

-- Platform: IOS
allowsInlineMediaPlayback :: Bool -> PropertyOrHandler handler
allowsInlineMediaPlayback = (&=) "allowsInlineMediaPlayback"

-- Platform: IOS
bounces :: Bool -> PropertyOrHandler handler
bounces = (&=) "bounces"

-- Platform: IOS
contentInset :: Inset -> PropertyOrHandler handler
contentInset = (&=) "contentInset"

-- Platform: IOS
dataDetectorTypes :: DataDetectorTypes -> PropertyOrHandler handler
dataDetectorTypes = (&=) "dataDetectorTypes"

-- Platform: IOS
scrollEnabled :: Bool -> PropertyOrHandler handler
scrollEnabled = (&=) "scrollEnabled"

-- TODO: ViewProps

-- TODO: Methods
