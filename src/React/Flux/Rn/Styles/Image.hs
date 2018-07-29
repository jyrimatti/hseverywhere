{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Styles.Image (
    module React.Flux.Rn.Styles.Image,
    ImageStyleProps.Color (..),
    ImageStyleProps.ResizeMode (..),
    ImageStyleProps.UnitInterval,
    ImageStyleProps.Visibility (..),
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
    TransformsStyleProps.Transform (..)
) where

import           React.Flux.Rn.Components                      (Image)
import qualified React.Flux.Rn.StyleProps.ImageStyleProps      as ImageStyleProps
import qualified React.Flux.Rn.StyleProps.LayoutStyleProps     as LayoutStyleProps
import qualified React.Flux.Rn.StyleProps.ShadowStyleProps     as ShadowStyleProps
import qualified React.Flux.Rn.StyleProps.TransformsStyleProps as TransformsStyleProps

-- ImageStyleProps:

borderTopRightRadius    = ImageStyleProps.borderTopRightRadius @Image
backfaceVisibility      = ImageStyleProps.backfaceVisibility @Image
borderBottomLeftRadius  = ImageStyleProps.borderBottomLeftRadius @Image
borderBottomRightRadius = ImageStyleProps.borderBottomRightRadius @Image
borderColor             = ImageStyleProps.borderColor @Image
borderRadius            = ImageStyleProps.borderRadius @Image
borderTopLeftRadius     = ImageStyleProps.borderTopLeftRadius @Image
backgroundColor         = ImageStyleProps.backgroundColor @Image
borderWidth             = ImageStyleProps.borderWidth @Image
opacity                 = ImageStyleProps.opacity @Image
overflow                = ImageStyleProps.overflow @Image
resizeMode              = ImageStyleProps.resizeMode @Image
tintColor               = ImageStyleProps.tintColor @Image
overlayColor            = ImageStyleProps.overlayColor @Image

-- LayoutStyleProps:

marginHorizontal  = LayoutStyleProps.marginHorizontal @Image
alignContent      = LayoutStyleProps.alignContent @Image
alignSelf         = LayoutStyleProps.alignSelf @Image
aspectRatio       = LayoutStyleProps.aspectRatio @Image
borderBottomWidth = LayoutStyleProps.borderBottomWidth @Image
borderEndWidth    = LayoutStyleProps.borderEndWidth @Image
borderLeftWidth   = LayoutStyleProps.borderLeftWidth @Image
borderRightWidth  = LayoutStyleProps.borderRightWidth @Image
borderStartWidth  = LayoutStyleProps.borderStartWidth @Image
borderTopWidth    = LayoutStyleProps.borderTopWidth @Image
--borderWidth       = LayoutStyleProps.borderWidth @Image
bottom            = LayoutStyleProps.bottom @Image
display           = LayoutStyleProps.display @Image
end               = LayoutStyleProps.end @Image
flex              = LayoutStyleProps.flex @Image
flexBasis         = LayoutStyleProps.flexBasis @Image
flexDirection     = LayoutStyleProps.flexDirection @Image
flexGrow          = LayoutStyleProps.flexGrow @Image
flexShrink        = LayoutStyleProps.flexShrink @Image
flexWrap          = LayoutStyleProps.flexWrap @Image
height            = LayoutStyleProps.height @Image
justifyContent    = LayoutStyleProps.justifyContent @Image
left              = LayoutStyleProps.left @Image
margin            = LayoutStyleProps.margin @Image
marginBottom      = LayoutStyleProps.marginBottom @Image
marginEnd         = LayoutStyleProps.marginEnd @Image
alignItems        = LayoutStyleProps.alignItems @Image
marginLeft        = LayoutStyleProps.marginLeft @Image
marginRight       = LayoutStyleProps.marginRight @Image
marginStart       = LayoutStyleProps.marginStart @Image
marginTop         = LayoutStyleProps.marginTop @Image
marginVertical    = LayoutStyleProps.marginVertical @Image
maxHeight         = LayoutStyleProps.maxHeight @Image
maxWidth          = LayoutStyleProps.maxWidth @Image
minHeight         = LayoutStyleProps.minHeight @Image
minWidth          = LayoutStyleProps.minWidth @Image
--overflow          = LayoutStyleProps.overflow @Image
padding           = LayoutStyleProps.padding @Image
paddingBottom     = LayoutStyleProps.paddingBottom @Image
paddingEnd        = LayoutStyleProps.paddingEnd @Image
paddingHorizontal = LayoutStyleProps.paddingHorizontal @Image
paddingLeft       = LayoutStyleProps.paddingLeft @Image
paddingRight      = LayoutStyleProps.paddingRight @Image
paddingStart      = LayoutStyleProps.paddingStart @Image
paddingTop        = LayoutStyleProps.paddingTop @Image
paddingVertical   = LayoutStyleProps.paddingVertical @Image
position          = LayoutStyleProps.position @Image
right             = LayoutStyleProps.right @Image
start             = LayoutStyleProps.start @Image
top               = LayoutStyleProps.top @Image
width             = LayoutStyleProps.width @Image
zIndex            = LayoutStyleProps.zIndex @Image
direction         = LayoutStyleProps.direction @Image

-- ShadowStyleProps:

shadowColor   = ShadowStyleProps.shadowColor @Image
shadowOffset  = ShadowStyleProps.shadowOffset @Image
shadowOpacity = ShadowStyleProps.shadowOpacity @Image
shadowRadius  = ShadowStyleProps.shadowRadius @Image

-- TransformsStyleProps:

transform = TransformsStyleProps.transform @Image
