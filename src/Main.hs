{-# LANGUAGE NoImplicitPrelude #-}
import           Prelude       (IO)
import           React.Flux    (registerInitialStore)
import           React.Flux.Rn.App (registerApp)
import           Store     (appStore)
import           Views     (app)

main :: IO ()
main = do
  registerInitialStore appStore
  registerApp "rnproject" app
