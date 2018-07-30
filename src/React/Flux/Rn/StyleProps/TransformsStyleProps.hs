{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.StyleProps.TransformsStyleProps (
    module React.Flux.Rn.StyleProps.TransformsStyleProps,
    Angle(..), Transform(..)
) where

import           React.Flux.Rn.Properties (Styles, style)
import           React.Flux.Rn.Types      (Angle (..), Transform (..))

transform :: [Transform] -> Styles component handler
transform = style "transform"
