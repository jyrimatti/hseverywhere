{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.StyleProps.ViewStyleProps (
    module React.Flux.Rn.StyleProps.ViewStyleProps,
    BorderStyle(..), Color(..), UnitInterval, Visibility(..)
) where

import           Numeric.Natural          (Natural)
import           React.Flux.Rn.Components (Styles, style)
import           React.Flux.Rn.Types      (BorderStyle (..), Color (..),
                                           UnitInterval, Visibility (..))

borderRightColor :: Color -> Styles component handler
borderRightColor = style "borderRightColor"

backfaceVisibility :: Visibility -> Styles component handler
backfaceVisibility = style "backfaceVisibility"

borderBottomColor :: Color -> Styles component handler
borderBottomColor = style "borderBottomColor"

borderBottomEndRadius :: Natural -> Styles component handler
borderBottomEndRadius = style "borderBottomEndRadius"

borderBottomLeftRadius :: Natural -> Styles component handler
borderBottomLeftRadius = style "borderBottomLeftRadius"

borderBottomRightRadius :: Natural -> Styles component handler
borderBottomRightRadius = style "borderBottomRightRadius"

borderBottomStartRadius :: Natural -> Styles component handler
borderBottomStartRadius = style "borderBottomStartRadius"

borderBottomWidth :: Natural -> Styles component handler
borderBottomWidth = style "borderBottomWidth"

borderColor :: Color -> Styles component handler
borderColor = style "borderColor"

borderEndColor :: Color -> Styles component handler
borderEndColor = style "borderEndColor"

borderLeftWidth :: Natural -> Styles component handler
borderLeftWidth = style "borderLeftWidth"

borderRadius :: Natural -> Styles component handler
borderRadius = style "borderRadius"

backgroundColor :: Color -> Styles component handler
backgroundColor = style "backgroundColor"

borderRightWidth :: Natural -> Styles component handler
borderRightWidth = style "borderRightWidth"

borderStartColor :: Color -> Styles component handler
borderStartColor = style "borderStartColor"

borderStyle :: BorderStyle -> Styles component handler
borderStyle = style "borderStyle"

borderTopColor :: Color -> Styles component handler
borderTopColor = style "borderTopColor"

borderTopEndRadius :: Natural -> Styles component handler
borderTopEndRadius = style "borderTopEndRadius"

borderTopLeftRadius :: Natural -> Styles component handler
borderTopLeftRadius = style "borderTopLeftRadius"

borderTopRightRadius :: Natural -> Styles component handler
borderTopRightRadius = style "borderTopRightRadius"

borderTopStartRadius :: Natural -> Styles component handler
borderTopStartRadius = style "borderTopStartRadius"

borderTopWidth :: Natural -> Styles component handler
borderTopWidth = style "borderTopWidth"

borderWidth :: Natural -> Styles component handler
borderWidth = style "borderWidth"

opacity :: UnitInterval -> Styles component handler
opacity = style "opacity"

elevation :: Natural -> Styles component handler
elevation = style "elevation"
