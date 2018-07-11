{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.Components.ProgressViewIOS where

import           React.Flux
import           React.Flux.Rn.Types

progress :: Between0and1 -> PropertyOrHandler handler
progress = (&=) "progress"

progressImage :: ImageSource -> PropertyOrHandler handler
progressImage = (&=) "progressImage"

progressTintColor :: Color -> PropertyOrHandler handler
progressTintColor = (&=) "progressTintColor"

progressViewStyle :: ProgressViewStyle -> PropertyOrHandler handler
progressViewStyle = (&=) "progressViewStyle"

trackImage :: ImageSource -> PropertyOrHandler handler
trackImage = (&=) "trackImage"

trackTintColor :: Color -> PropertyOrHandler handler
trackTintColor = (&=) "trackTintColor"

-- TODO: ViewProps
