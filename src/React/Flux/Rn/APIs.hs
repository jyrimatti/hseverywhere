module React.Flux.Rn.APIs where

import GHCJS.Types (JSVal)
import GHCJS.Marshal (ToJSVal(..))

alert :: String -> Maybe String -> IO ()
alert title msg = toJSVal title >>= \t -> (case msg of
                                            Just m -> toJSVal m
                                            Nothing -> toJSVal " ") >>= \m -> js_alert t m

openURL :: String -> IO ()
openURL url = toJSVal url >>= js_openURL

foreign import javascript unsafe
    "Alert.alert($1,$2)"
  js_alert :: JSVal -> JSVal -> IO ()

foreign import javascript unsafe
    "Linking.openURL($1)"
  js_openURL :: JSVal -> IO ()
