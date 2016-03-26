import React.Flux (ReactView)
import TodoViews (todoApp)
import GHCJS.Types (JSString)
import Data.JSString (pack)

-- a foreign wrapper function for app registration
foreign import javascript unsafe
    "__registerComponent($1, $2)"
  js_registerComponent :: JSString -> ReactView () -> IO ()

main :: IO ()
main = js_registerComponent (pack "hsEverywhere") todoApp
