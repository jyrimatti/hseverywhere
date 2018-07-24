{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.StyleProps.TransformsStyleProps where

import           Numeric.Natural
import           Prelude                  (Bool, String, const, pure, ($), (.),
                                           (<$>))
import           React.Flux.Rn.Components (Styles, style)
import           React.Flux.Rn.Types

transform :: [Transform] -> Styles component handler
transform = style "transform"
