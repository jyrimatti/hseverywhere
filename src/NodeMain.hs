{-# LANGUAGE NoImplicitPrelude #-}
import  Data.Text.IO (putStrLn)
import           React.Flux (reactRenderToString)
import           Views (app)
import Prelude (Boolean(True), (>>=), IO)

main :: IO ()
main = reactRenderToString True app () >>= T.putStrLn
