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

foreign import javascript unsafe
    "Platform.OS"
  js_platform_os :: IO JSVal

foreign import javascript unsafe
    "Platform.Version"
  js_platform_version :: IO JSVal



-- Alert

alert :: String -> Maybe String -> IO ()
alert title msg = toJSVal title >>= \t -> (case msg of
                                            Just m -> toJSVal m
                                            Nothing -> toJSVal " ") >>= \m -> js_alert t m

foreign import javascript unsafe
    "Alert.alert($1,$2)"
  js_alert :: JSVal -> JSVal -> IO ()



-- Linking

openURL :: String -> IO ()
openURL url = toJSVal url >>= js_openURL

foreign import javascript unsafe
    "Linking.openURL($1)"
  js_openURL :: JSVal -> IO ()



-- AppState

currentState :: IO String
currentState = js_currentState >>= fromJSValUnchecked

foreign import javascript unsafe
    "AppState.currentState"
  js_currentState :: IO JSVal

