{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Styles.TextInput (
    module React.Flux.Rn.Styles.TextInput,
    TextStyleProps.Color (..),
    TextStyleProps.ContentSize (ContentSize),
    TextStyleProps.FontStyle (..),
    TextStyleProps.FontVariant (..),
    TextStyleProps.FontWeight (..),
    TextStyleProps.TextAlign (..),
    TextStyleProps.TextAlignVertical (..),
    TextStyleProps.TextDecorationLine (..),
    TextStyleProps.TextDecorationStyle (..),
    TextStyleProps.WritingDirection (..),
    ViewStyleProps.BorderStyle (..),
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
    TransformsStyleProps.Angle (..),
    TransformsStyleProps.Transform (..)
) where

import           React.Flux.Rn.Components.TextInput                      (TextInput)
import qualified React.Flux.Rn.StyleProps.LayoutStyleProps     as LayoutStyleProps
import qualified React.Flux.Rn.StyleProps.ShadowStyleProps     as ShadowStyleProps
import qualified React.Flux.Rn.StyleProps.TextStyleProps       as TextStyleProps
import qualified React.Flux.Rn.StyleProps.TransformsStyleProps as TransformsStyleProps
import qualified React.Flux.Rn.StyleProps.ViewStyleProps       as ViewStyleProps

-- TextStyleProps:

textShadowOffset    = TextStyleProps.textShadowOffset @TextInput
color               = TextStyleProps.color @TextInput
fontSize            = TextStyleProps.fontSize @TextInput
fontStyle           = TextStyleProps.fontStyle @TextInput
fontWeight          = TextStyleProps.fontWeight @TextInput
lineHeight          = TextStyleProps.lineHeight @TextInput
textAlign           = TextStyleProps.textAlign @TextInput
textDecorationLine  = TextStyleProps.textDecorationLine @TextInput
textShadowColor     = TextStyleProps.textShadowColor @TextInput
fontFamily          = TextStyleProps.fontFamily @TextInput
textShadowRadius    = TextStyleProps.textShadowRadius @TextInput
includeFontPadding  = TextStyleProps.includeFontPadding @TextInput
textAlignVertical   = TextStyleProps.textAlignVertical @TextInput
fontVariant         = TextStyleProps.fontVariant @TextInput
letterSpacing       = TextStyleProps.letterSpacing @TextInput
textDecorationColor = TextStyleProps.textDecorationColor @TextInput
textDecorationStyle = TextStyleProps.textDecorationStyle @TextInput
writingDirection    = TextStyleProps.writingDirection @TextInput

-- ViewStyleProps:

borderRightColor        = ViewStyleProps.borderRightColor @TextInput
backfaceVisibility      = ViewStyleProps.backfaceVisibility @TextInput
borderBottomColor       = ViewStyleProps.borderBottomColor @TextInput
borderBottomEndRadius   = ViewStyleProps.borderBottomEndRadius @TextInput
--borderBottomLeftRadius  = ViewStyleProps.borderBottomLeftRadius @TextInput
--borderBottomRightRadius = ViewStyleProps.borderBottomRightRadius @TextInput
borderBottomStartRadius = ViewStyleProps.borderBottomStartRadius @TextInput
--borderBottomWidth       = ViewStyleProps.borderBottomWidth @TextInput
borderColor             = ViewStyleProps.borderColor @TextInput
borderEndColor          = ViewStyleProps.borderEndColor @TextInput
--borderLeftWidth         = ViewStyleProps.borderLeftWidth @TextInput
borderRadius            = ViewStyleProps.borderRadius @TextInput
backgroundColor         = ViewStyleProps.backgroundColor @TextInput
--borderRightWidth        = ViewStyleProps.borderRightWidth @TextInput
borderStartColor        = ViewStyleProps.borderStartColor @TextInput
borderStyle             = ViewStyleProps.borderStyle @TextInput
borderTopColor          = ViewStyleProps.borderTopColor @TextInput
borderTopEndRadius      = ViewStyleProps.borderTopEndRadius @TextInput
--borderTopLeftRadius     = ViewStyleProps.borderTopLeftRadius @TextInput
--borderTopRightRadius    = ViewStyleProps.borderTopRightRadius @TextInput
borderTopStartRadius    = ViewStyleProps.borderTopStartRadius @TextInput
--borderTopWidth          = ViewStyleProps.borderTopWidth @TextInput
borderWidth             = ViewStyleProps.borderWidth @TextInput
opacity                 = ViewStyleProps.opacity @TextInput
elevation               = ViewStyleProps.elevation @TextInput

-- LayoutStyleProps:

marginHorizontal  = LayoutStyleProps.marginHorizontal @TextInput
alignContent      = LayoutStyleProps.alignContent @TextInput
alignSelf         = LayoutStyleProps.alignSelf @TextInput
aspectRatio       = LayoutStyleProps.aspectRatio @TextInput
borderBottomWidth = LayoutStyleProps.borderBottomWidth @TextInput
borderEndWidth    = LayoutStyleProps.borderEndWidth @TextInput
borderLeftWidth   = LayoutStyleProps.borderLeftWidth @TextInput
borderRightWidth  = LayoutStyleProps.borderRightWidth @TextInput
borderStartWidth  = LayoutStyleProps.borderStartWidth @TextInput
borderTopWidth    = LayoutStyleProps.borderTopWidth @TextInput
--borderWidth       = LayoutStyleProps.borderWidth @TextInput
bottom            = LayoutStyleProps.bottom @TextInput
display           = LayoutStyleProps.display @TextInput
end               = LayoutStyleProps.end @TextInput
flex              = LayoutStyleProps.flex @TextInput
flexBasis         = LayoutStyleProps.flexBasis @TextInput
flexDirection     = LayoutStyleProps.flexDirection @TextInput
flexGrow          = LayoutStyleProps.flexGrow @TextInput
flexShrink        = LayoutStyleProps.flexShrink @TextInput
flexWrap          = LayoutStyleProps.flexWrap @TextInput
height            = LayoutStyleProps.height @TextInput
justifyContent    = LayoutStyleProps.justifyContent @TextInput
left              = LayoutStyleProps.left @TextInput
margin            = LayoutStyleProps.margin @TextInput
marginBottom      = LayoutStyleProps.marginBottom @TextInput
marginEnd         = LayoutStyleProps.marginEnd @TextInput
alignItems        = LayoutStyleProps.alignItems @TextInput
marginLeft        = LayoutStyleProps.marginLeft @TextInput
marginRight       = LayoutStyleProps.marginRight @TextInput
marginStart       = LayoutStyleProps.marginStart @TextInput
marginTop         = LayoutStyleProps.marginTop @TextInput
marginVertical    = LayoutStyleProps.marginVertical @TextInput
maxHeight         = LayoutStyleProps.maxHeight @TextInput
maxWidth          = LayoutStyleProps.maxWidth @TextInput
minHeight         = LayoutStyleProps.minHeight @TextInput
minWidth          = LayoutStyleProps.minWidth @TextInput
overflow          = LayoutStyleProps.overflow @TextInput
padding           = LayoutStyleProps.padding @TextInput
paddingBottom     = LayoutStyleProps.paddingBottom @TextInput
paddingEnd        = LayoutStyleProps.paddingEnd @TextInput
paddingHorizontal = LayoutStyleProps.paddingHorizontal @TextInput
paddingLeft       = LayoutStyleProps.paddingLeft @TextInput
paddingRight      = LayoutStyleProps.paddingRight @TextInput
paddingStart      = LayoutStyleProps.paddingStart @TextInput
paddingTop        = LayoutStyleProps.paddingTop @TextInput
paddingVertical   = LayoutStyleProps.paddingVertical @TextInput
position          = LayoutStyleProps.position @TextInput
right             = LayoutStyleProps.right @TextInput
start             = LayoutStyleProps.start @TextInput
top               = LayoutStyleProps.top @TextInput
width             = LayoutStyleProps.width @TextInput
zIndex            = LayoutStyleProps.zIndex @TextInput
direction         = LayoutStyleProps.direction @TextInput

-- ShadowStyleProps:

shadowColor   = ShadowStyleProps.shadowColor @TextInput
shadowOffset  = ShadowStyleProps.shadowOffset @TextInput
shadowOpacity = ShadowStyleProps.shadowOpacity @TextInput
shadowRadius  = ShadowStyleProps.shadowRadius @TextInput

-- TransformsStyleProps:

transform = TransformsStyleProps.transform @TextInput
