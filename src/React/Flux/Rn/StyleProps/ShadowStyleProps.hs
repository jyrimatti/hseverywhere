{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.StyleProps.ShadowStyleProps (
    module React.Flux.Rn.StyleProps.ShadowStyleProps,
    Color(..), ContentSize(ContentSize), UnitInterval
) where

import           Numeric.Natural          (Natural)
import           React.Flux.Rn.Components (Styles, style)
import           React.Flux.Rn.Types      (Color (..),
                                           ContentSize (ContentSize),
                                           UnitInterval)

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
