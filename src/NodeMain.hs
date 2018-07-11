{-# LANGUAGE NoImplicitPrelude #-}
import qualified Data.Text.IO as T
import           React.Flux
import           TodoViews

main :: IO ()
main = reactRenderToString True todoApp () >>= T.putStrLn
