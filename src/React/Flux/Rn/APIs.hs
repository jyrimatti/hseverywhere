module React.Flux.Rn.APIs where

import System.IO.Unsafe (unsafePerformIO)
import GHCJS.Types (JSVal)
import GHCJS.Marshal (ToJSVal(..),FromJSVal(..))



-- Platform

data Platform = IOS | Android | MacOS | Web | Windows | Other String
  deriving Show

platform :: Platform
platform = case platformOS of
             "ios" -> IOS
             "android" -> Android
             "macos" -> MacOS
             "web" -> Web
             "windows" -> Windows
             p -> Other p

platformOS :: String
platformOS = unsafePerformIO $ js_platform_os >>= fromJSValUnchecked

platformVersion :: String
platformVersion = unsafePerformIO $ js_platform_version >>= fromJSValUnchecked

#ifdef __GHCJS__
foreign import javascript unsafe
    "Platform.OS"
  js_platform_os :: IO JSVal
#else
  js_platform_os :: IO JSVal
  js_platform_os = undefined
#endif

#ifdef __GHCJS__
foreign import javascript unsafe
    "Platform.Version"
  js_platform_version :: IO JSVal
#else
  js_platform_version :: IO JSVal
  js_platform_version = undefined
#endif


-- Alert

alert :: String -> Maybe String -> IO ()
alert title msg = toJSVal title >>= \t -> (case msg of
                                            Just m -> toJSVal m
                                            Nothing -> toJSVal " ") >>= \m -> js_alert t m

#ifdef __GHCJS__
foreign import javascript unsafe
    "Alert.alert($1,$2)"
  js_alert :: JSVal -> JSVal -> IO ()
#else
  js_alert :: JSVal -> JSVal -> IO ()
  js_alert = undefined
#endif


-- Linking

openURL :: String -> IO ()
openURL url = toJSVal url >>= js_openURL

#ifdef __GHCJS__
foreign import javascript unsafe
    "Linking.openURL($1)"
  js_openURL :: JSVal -> IO ()
#else
  js_openURL :: JSVal -> IO ()
  js_openURL = undefined
#endif


-- AppState

currentState :: IO String
currentState = js_currentState >>= fromJSValUnchecked

#ifdef __GHCJS__
foreign import javascript unsafe
    "AppState.currentState"
  js_currentState :: IO JSVal
#else
  js_currentState :: IO JSVal
  js_currentState = undefined
#endif
