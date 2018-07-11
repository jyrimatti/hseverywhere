{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.Components.MaskedViewIOS where

import           Data.Typeable
import           React.Flux
import           React.Flux.Internal  (ReactViewRef)
import           React.Flux.Rn.Events

-- Required
maskElement :: Typeable props => ReactViewRef props -> PropertyOrHandler handler
maskElement = view0 "maskElement"

-- TODO: ViewProps
