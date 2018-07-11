{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.Components.ProgressBarAndroid where

import           Prelude             (Bool, String)
import           React.Flux
import           React.Flux.Rn.Types

animating :: Bool -> PropertyOrHandler handler
animating = (&=) "animating"

color :: Color -> PropertyOrHandler handler
color = (&=) "color"

indeterminate :: Bool -> PropertyOrHandler handler
indeterminate = (&=) "indeterminate"

progress :: Between0and1 -> PropertyOrHandler handler
progress = (&=) "progress"

styleAttr :: StyleAttr -> PropertyOrHandler handler
styleAttr = (&=) "styleAttr"

testID :: String -> PropertyOrHandler handler
testID = (&=) "testID"

-- TODO: ViewProps
