{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Styles.View (
    module React.Flux.Rn.Styles.View,
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

import           React.Flux.Rn.Components.View                 (View)
import qualified React.Flux.Rn.StyleProps.LayoutStyleProps     as LayoutStyleProps
import qualified React.Flux.Rn.StyleProps.ShadowStyleProps     as ShadowStyleProps
import qualified React.Flux.Rn.StyleProps.TransformsStyleProps as TransformsStyleProps
import qualified React.Flux.Rn.StyleProps.ViewStyleProps       as ViewStyleProps

-- ViewStyleProps:

borderRightColor        = ViewStyleProps.borderRightColor @View
backfaceVisibility      = ViewStyleProps.backfaceVisibility @View
borderBottomColor       = ViewStyleProps.borderBottomColor @View
borderBottomEndRadius   = ViewStyleProps.borderBottomEndRadius @View
borderBottomLeftRadius  = ViewStyleProps.borderBottomLeftRadius @View
borderBottomRightRadius = ViewStyleProps.borderBottomRightRadius @View
borderBottomStartRadius = ViewStyleProps.borderBottomStartRadius @View
borderBottomWidth       = ViewStyleProps.borderBottomWidth @View
borderColor             = ViewStyleProps.borderColor @View
borderEndColor          = ViewStyleProps.borderEndColor @View
borderLeftWidth         = ViewStyleProps.borderLeftWidth @View
borderRadius            = ViewStyleProps.borderRadius @View
backgroundColor         = ViewStyleProps.backgroundColor @View
borderRightWidth        = ViewStyleProps.borderRightWidth @View
borderStartColor        = ViewStyleProps.borderStartColor @View
borderStyle             = ViewStyleProps.borderStyle @View
borderTopColor          = ViewStyleProps.borderTopColor @View
borderTopEndRadius      = ViewStyleProps.borderTopEndRadius @View
borderTopLeftRadius     = ViewStyleProps.borderTopLeftRadius @View
borderTopRightRadius    = ViewStyleProps.borderTopRightRadius @View
borderTopStartRadius    = ViewStyleProps.borderTopStartRadius @View
borderTopWidth          = ViewStyleProps.borderTopWidth @View
borderWidth             = ViewStyleProps.borderWidth @View
opacity                 = ViewStyleProps.opacity @View
elevation               = ViewStyleProps.elevation @View

-- LayoutStyleProps:

marginHorizontal  = LayoutStyleProps.marginHorizontal @View
alignContent      = LayoutStyleProps.alignContent @View
alignSelf         = LayoutStyleProps.alignSelf @View
aspectRatio       = LayoutStyleProps.aspectRatio @View
--borderBottomWidth = LayoutStyleProps.borderBottomWidth @View
borderEndWidth    = LayoutStyleProps.borderEndWidth @View
--borderLeftWidth   = LayoutStyleProps.borderLeftWidth @View
--borderRightWidth  = LayoutStyleProps.borderRightWidth @View
borderStartWidth  = LayoutStyleProps.borderStartWidth @View
--borderTopWidth    = LayoutStyleProps.borderTopWidth @View
--borderWidth       = LayoutStyleProps.borderWidth @View
bottom            = LayoutStyleProps.bottom @View
display           = LayoutStyleProps.display @View
end               = LayoutStyleProps.end @View
flex              = LayoutStyleProps.flex @View
flexBasis         = LayoutStyleProps.flexBasis @View
flexDirection     = LayoutStyleProps.flexDirection @View
flexGrow          = LayoutStyleProps.flexGrow @View
flexShrink        = LayoutStyleProps.flexShrink @View
flexWrap          = LayoutStyleProps.flexWrap @View
height            = LayoutStyleProps.height @View
justifyContent    = LayoutStyleProps.justifyContent @View
left              = LayoutStyleProps.left @View
margin            = LayoutStyleProps.margin @View
marginBottom      = LayoutStyleProps.marginBottom @View
marginEnd         = LayoutStyleProps.marginEnd @View
alignItems        = LayoutStyleProps.alignItems @View
marginLeft        = LayoutStyleProps.marginLeft @View
marginRight       = LayoutStyleProps.marginRight @View
marginStart       = LayoutStyleProps.marginStart @View
marginTop         = LayoutStyleProps.marginTop @View
marginVertical    = LayoutStyleProps.marginVertical @View
maxHeight         = LayoutStyleProps.maxHeight @View
maxWidth          = LayoutStyleProps.maxWidth @View
minHeight         = LayoutStyleProps.minHeight @View
minWidth          = LayoutStyleProps.minWidth @View
overflow          = LayoutStyleProps.overflow @View
padding           = LayoutStyleProps.padding @View
paddingBottom     = LayoutStyleProps.paddingBottom @View
paddingEnd        = LayoutStyleProps.paddingEnd @View
paddingHorizontal = LayoutStyleProps.paddingHorizontal @View
paddingLeft       = LayoutStyleProps.paddingLeft @View
paddingRight      = LayoutStyleProps.paddingRight @View
paddingStart      = LayoutStyleProps.paddingStart @View
paddingTop        = LayoutStyleProps.paddingTop @View
paddingVertical   = LayoutStyleProps.paddingVertical @View
position          = LayoutStyleProps.position @View
right             = LayoutStyleProps.right @View
start             = LayoutStyleProps.start @View
top               = LayoutStyleProps.top @View
width             = LayoutStyleProps.width @View
zIndex            = LayoutStyleProps.zIndex @View
direction         = LayoutStyleProps.direction @View

-- ShadowStyleProps:

shadowColor   = ShadowStyleProps.shadowColor @View
shadowOffset  = ShadowStyleProps.shadowOffset @View
shadowOpacity = ShadowStyleProps.shadowOpacity @View
shadowRadius  = ShadowStyleProps.shadowRadius @View

-- TransformsStyleProps:

transform = TransformsStyleProps.transform @View
