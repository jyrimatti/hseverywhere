{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.StyleProps.ImageStyleProps where

import           Numeric.Natural
import           Prelude                  (Bool, Double, String, const, pure,
                                           ($), (.), (<$>))
import           React.Flux.Rn.Components (Styles, style)
import           React.Flux.Rn.Types

borderTopRightRadius :: Natural -> Styles component handler
borderTopRightRadius = style "borderTopRightRadius"

backfaceVisibility :: Visibility -> Styles component handler
backfaceVisibility = style "backfaceVisibility"

borderBottomLeftRadius :: Natural -> Styles component handler
borderBottomLeftRadius = style "borderBottomLeftRadius"

borderBottomRightRadius :: Natural -> Styles component handler
borderBottomRightRadius = style "borderBottomRightRadius"

borderColor :: Color -> Styles component handler
borderColor = style "borderColor"

borderRadius :: Natural -> Styles component handler
borderRadius = style "borderRadius"

borderTopLeftRadius :: Natural -> Styles component handler
borderTopLeftRadius = style "borderTopLeftRadius"

backgroundColor :: Color -> Styles component handler
backgroundColor = style "backgroundColor"

borderWidth :: Natural -> Styles component handler
borderWidth = style "borderWidth"

opacity :: UnitInterval -> Styles component handler
opacity = style "opacity"

overflow :: Visibility -> Styles component handler
overflow = style "overflow"

resizeMode :: ResizeMode -> Styles component handler
resizeMode = style "resizeMode"

tintColor :: Color -> Styles component handler
tintColor = style "tintColor"

overlayColor :: Color -> Styles component handler
overlayColor = style "overlayColor"

