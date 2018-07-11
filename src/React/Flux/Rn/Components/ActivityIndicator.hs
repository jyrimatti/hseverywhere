{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.Components.ActivityIndicator where

import           Prelude             (Bool)
import           React.Flux
import           React.Flux.Rn.Style
import           React.Flux.Rn.Types

animating :: Bool -> PropertyOrHandler handler
animating = (&=) "animating"

color :: Color -> PropertyOrHandler handler
color = (&=) "color"

size :: ActivityIndicatorSize -> PropertyOrHandler handler
size = (&=) "size"

hidesWhenStopped :: Bool -> PropertyOrHandler handler
hidesWhenStopped = (&=) "hidesWhenStopped"

-- TODO: ViewProps
