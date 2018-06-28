import           Data.JSString (pack)
import           GHCJS.Types   (JSString)
import           React.Flux    (View, registerInitialStore)
import           TodoStore     (todoStore)
import           TodoViews     (todoApp)

-- a foreign wrapper function for app registration
foreign import javascript unsafe
    "__registerComponent($1, $2)"
  js_registerComponent :: JSString -> View a -> IO ()

main :: IO ()
main = do
  registerInitialStore todoStore
  js_registerComponent (pack "hseverywhere") todoApp
