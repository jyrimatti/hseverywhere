{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.StyleProps.ShadowStyleProps where

import           Numeric.Natural
import           Prelude                  (Bool, Double, String, const, pure,
                                           ($), (.), (<$>))
import           React.Flux.Rn.Components (Styles, style)
import           React.Flux.Rn.Types

-- Platform: IOS
shadowColor :: Color -> Styles component handler
shadowColor = style "shadowColor"

-- Platform: IOS
shadowOffset :: ContentSize -> Styles component handler
shadowOffset = style "shadowOffset"

-- Platform: IOS
shadowOpacity :: UnitInterval -> Styles component handler
shadowOpacity = style "shadowOpacity"

-- Platform: IOS
shadowRadius :: Natural -> Styles component handler
shadowRadius = style "shadowRadius"
