{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.StyleProps.TransformsStyleProps (
    module React.Flux.Rn.StyleProps.TransformsStyleProps,
    Transform(..)
) where

import           React.Flux.Rn.Components (Styles, style)
import           React.Flux.Rn.Types      (Transform (..))

transform :: [Transform] -> Styles component handler
transform = style "transform"
