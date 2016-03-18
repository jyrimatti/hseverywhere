import React.Flux
import TodoViews
import qualified Data.Text.IO as T

main :: IO ()
main = reactRenderToString True todoApp () >>= T.putStrLn
