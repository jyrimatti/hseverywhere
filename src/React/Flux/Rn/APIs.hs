module React.Flux.Rn.APIs where

import GHCJS.Types (JSVal)
import GHCJS.Marshal (ToJSVal(..), FromJSVal(..))


alert :: String -> IO ()
alert msg = toJSVal msg >>= js_alert

foreign import javascript unsafe
    "Alert.alert($1)"
  js_alert :: JSVal -> IO ()