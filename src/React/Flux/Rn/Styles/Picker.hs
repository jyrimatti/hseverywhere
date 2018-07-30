{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Styles.Picker (
    module React.Flux.Rn.Styles.Picker,
    ViewStyleProps.BorderStyle (..),
    ViewStyleProps.Color (..),
    ViewStyleProps.UnitInterval,
    ViewStyleProps.Visibility (..),
    LayoutStyleProps.AlignContent (..),
    LayoutStyleProps.AlignItems (..),
    LayoutStyleProps.AlignSelf (..),
    LayoutStyleProps.Direction (..),
    LayoutStyleProps.Display (..),
    LayoutStyleProps.FlexDirection (..),
    LayoutStyleProps.FlexWrap (..),
    LayoutStyleProps.JustifyContent (..),
    LayoutStyleProps.Length (..),
    LayoutStyleProps.Overflow (..),
    LayoutStyleProps.Position (..),
    ShadowStyleProps.ContentSize (ContentSize),
    TransformsStyleProps.Angle (..),
    TransformsStyleProps.Transform (..)
) where

import           React.Flux.Rn.Components.Picker               (Picker)
import           React.Flux.Rn.Properties                      (Styles, style)
import qualified React.Flux.Rn.StyleProps.LayoutStyleProps     as LayoutStyleProps
import qualified React.Flux.Rn.StyleProps.ShadowStyleProps     as ShadowStyleProps
import qualified React.Flux.Rn.StyleProps.TransformsStyleProps as TransformsStyleProps
import qualified React.Flux.Rn.StyleProps.ViewStyleProps       as ViewStyleProps
import           React.Flux.Rn.Types                           (Color)

color :: Color -> Styles Picker handler
color = style "color"

-- ViewStyleProps:

borderRightColor        = ViewStyleProps.borderRightColor @Picker
backfaceVisibility      = ViewStyleProps.backfaceVisibility @Picker
borderBottomColor       = ViewStyleProps.borderBottomColor @Picker
borderBottomEndRadius   = ViewStyleProps.borderBottomEndRadius @Picker
borderBottomLeftRadius  = ViewStyleProps.borderBottomLeftRadius @Picker
borderBottomRightRadius = ViewStyleProps.borderBottomRightRadius @Picker
borderBottomStartRadius = ViewStyleProps.borderBottomStartRadius @Picker
borderBottomWidth       = ViewStyleProps.borderBottomWidth @Picker
borderColor             = ViewStyleProps.borderColor @Picker
borderEndColor          = ViewStyleProps.borderEndColor @Picker
borderLeftWidth         = ViewStyleProps.borderLeftWidth @Picker
borderRadius            = ViewStyleProps.borderRadius @Picker
backgroundColor         = ViewStyleProps.backgroundColor @Picker
borderRightWidth        = ViewStyleProps.borderRightWidth @Picker
borderStartColor        = ViewStyleProps.borderStartColor @Picker
borderStyle             = ViewStyleProps.borderStyle @Picker
borderTopColor          = ViewStyleProps.borderTopColor @Picker
borderTopEndRadius      = ViewStyleProps.borderTopEndRadius @Picker
borderTopLeftRadius     = ViewStyleProps.borderTopLeftRadius @Picker
borderTopRightRadius    = ViewStyleProps.borderTopRightRadius @Picker
borderTopStartRadius    = ViewStyleProps.borderTopStartRadius @Picker
borderTopWidth          = ViewStyleProps.borderTopWidth @Picker
borderWidth             = ViewStyleProps.borderWidth @Picker
opacity                 = ViewStyleProps.opacity @Picker
elevation               = ViewStyleProps.elevation @Picker

-- LayoutStyleProps:

marginHorizontal  = LayoutStyleProps.marginHorizontal @Picker
alignContent      = LayoutStyleProps.alignContent @Picker
alignSelf         = LayoutStyleProps.alignSelf @Picker
aspectRatio       = LayoutStyleProps.aspectRatio @Picker
--borderBottomWidth = LayoutStyleProps.borderBottomWidth @Picker
borderEndWidth    = LayoutStyleProps.borderEndWidth @Picker
--borderLeftWidth   = LayoutStyleProps.borderLeftWidth @Picker
--borderRightWidth  = LayoutStyleProps.borderRightWidth @Picker
borderStartWidth  = LayoutStyleProps.borderStartWidth @Picker
--borderTopWidth    = LayoutStyleProps.borderTopWidth @Picker
--borderWidth       = LayoutStyleProps.borderWidth @Picker
bottom            = LayoutStyleProps.bottom @Picker
display           = LayoutStyleProps.display @Picker
end               = LayoutStyleProps.end @Picker
flex              = LayoutStyleProps.flex @Picker
flexBasis         = LayoutStyleProps.flexBasis @Picker
flexDirection     = LayoutStyleProps.flexDirection @Picker
flexGrow          = LayoutStyleProps.flexGrow @Picker
flexShrink        = LayoutStyleProps.flexShrink @Picker
flexWrap          = LayoutStyleProps.flexWrap @Picker
height            = LayoutStyleProps.height @Picker
justifyContent    = LayoutStyleProps.justifyContent @Picker
left              = LayoutStyleProps.left @Picker
margin            = LayoutStyleProps.margin @Picker
marginBottom      = LayoutStyleProps.marginBottom @Picker
marginEnd         = LayoutStyleProps.marginEnd @Picker
alignItems        = LayoutStyleProps.alignItems @Picker
marginLeft        = LayoutStyleProps.marginLeft @Picker
marginRight       = LayoutStyleProps.marginRight @Picker
marginStart       = LayoutStyleProps.marginStart @Picker
marginTop         = LayoutStyleProps.marginTop @Picker
marginVertical    = LayoutStyleProps.marginVertical @Picker
maxHeight         = LayoutStyleProps.maxHeight @Picker
maxWidth          = LayoutStyleProps.maxWidth @Picker
minHeight         = LayoutStyleProps.minHeight @Picker
minWidth          = LayoutStyleProps.minWidth @Picker
overflow          = LayoutStyleProps.overflow @Picker
padding           = LayoutStyleProps.padding @Picker
paddingBottom     = LayoutStyleProps.paddingBottom @Picker
paddingEnd        = LayoutStyleProps.paddingEnd @Picker
paddingHorizontal = LayoutStyleProps.paddingHorizontal @Picker
paddingLeft       = LayoutStyleProps.paddingLeft @Picker
paddingRight      = LayoutStyleProps.paddingRight @Picker
paddingStart      = LayoutStyleProps.paddingStart @Picker
paddingTop        = LayoutStyleProps.paddingTop @Picker
paddingVertical   = LayoutStyleProps.paddingVertical @Picker
position          = LayoutStyleProps.position @Picker
right             = LayoutStyleProps.right @Picker
start             = LayoutStyleProps.start @Picker
top               = LayoutStyleProps.top @Picker
width             = LayoutStyleProps.width @Picker
zIndex            = LayoutStyleProps.zIndex @Picker
direction         = LayoutStyleProps.direction @Picker

-- ShadowStyleProps:

shadowColor   = ShadowStyleProps.shadowColor @Picker
shadowOffset  = ShadowStyleProps.shadowOffset @Picker
shadowOpacity = ShadowStyleProps.shadowOpacity @Picker
shadowRadius  = ShadowStyleProps.shadowRadius @Picker

-- TransformsStyleProps:

transform = TransformsStyleProps.transform @Picker
