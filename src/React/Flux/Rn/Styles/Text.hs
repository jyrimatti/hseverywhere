{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Styles.Text where

import           Numeric.Natural
import           Prelude                                       (Bool, Double,
                                                                String, const,
                                                                pure, ($), (.),
                                                                (<$>))
import           React.Flux.Rn.Components                      (Styles, Text,
                                                                style)
import qualified React.Flux.Rn.StyleProps.LayoutStyleProps     as LayoutStyleProps
import qualified React.Flux.Rn.StyleProps.ShadowStyleProps     as ShadowStyleProps
import qualified React.Flux.Rn.StyleProps.TextStyleProps       as TextStyleProps
import qualified React.Flux.Rn.StyleProps.TransformsStyleProps as TransformsStyleProps
import qualified React.Flux.Rn.StyleProps.ViewStyleProps       as ViewStyleProps
import           React.Flux.Rn.Types

-- TextStyleProps:

textShadowOffset    = TextStyleProps.textShadowOffset @Text
color               = TextStyleProps.color @Text
fontSize            = TextStyleProps.fontSize @Text
fontStyle           = TextStyleProps.fontStyle @Text
fontWeight          = TextStyleProps.fontWeight @Text
lineHeight          = TextStyleProps.lineHeight @Text
textAlign           = TextStyleProps.textAlign @Text
textDecorationLine  = TextStyleProps.textDecorationLine @Text
textShadowColor     = TextStyleProps.textShadowColor @Text
fontFamily          = TextStyleProps.fontFamily @Text
textShadowRadius    = TextStyleProps.textShadowRadius @Text
includeFontPadding  = TextStyleProps.includeFontPadding @Text
textAlignVertical   = TextStyleProps.textAlignVertical @Text
fontVariant         = TextStyleProps.fontVariant @Text
letterSpacing       = TextStyleProps.letterSpacing @Text
textDecorationColor = TextStyleProps.textDecorationColor @Text
textDecorationStyle = TextStyleProps.textDecorationStyle @Text
writingDirection    = TextStyleProps.writingDirection @Text

-- ViewStyleProps:

borderRightColor        = ViewStyleProps.borderRightColor @Text
backfaceVisibility      = ViewStyleProps.backfaceVisibility @Text
borderBottomColor       = ViewStyleProps.borderBottomColor @Text
borderBottomEndRadius   = ViewStyleProps.borderBottomEndRadius @Text
borderBottomLeftRadius  = ViewStyleProps.borderBottomLeftRadius @Text
borderBottomRightRadius = ViewStyleProps.borderBottomRightRadius @Text
borderBottomStartRadius = ViewStyleProps.borderBottomStartRadius @Text
borderBottomWidth       = ViewStyleProps.borderBottomWidth @Text
borderColor             = ViewStyleProps.borderColor @Text
borderEndColor          = ViewStyleProps.borderEndColor @Text
borderLeftWidth         = ViewStyleProps.borderLeftWidth @Text
borderRadius            = ViewStyleProps.borderRadius @Text
backgroundColor         = ViewStyleProps.backgroundColor @Text
borderRightWidth        = ViewStyleProps.borderRightWidth @Text
borderStartColor        = ViewStyleProps.borderStartColor @Text
borderStyle             = ViewStyleProps.borderStyle @Text
borderTopColor          = ViewStyleProps.borderTopColor @Text
borderTopEndRadius      = ViewStyleProps.borderTopEndRadius @Text
borderTopLeftRadius     = ViewStyleProps.borderTopLeftRadius @Text
borderTopRightRadius    = ViewStyleProps.borderTopRightRadius @Text
borderTopStartRadius    = ViewStyleProps.borderTopStartRadius @Text
borderTopWidth          = ViewStyleProps.borderTopWidth @Text
borderWidth             = ViewStyleProps.borderWidth @Text
opacity                 = ViewStyleProps.opacity @Text
elevation               = ViewStyleProps.elevation @Text

-- LayoutStyleProps:

marginHorizontal  = LayoutStyleProps.marginHorizontal @Text
alignContent      = LayoutStyleProps.alignContent @Text
alignSelf         = LayoutStyleProps.alignSelf @Text
aspectRatio       = LayoutStyleProps.aspectRatio @Text
--borderBottomWidth = LayoutStyleProps.borderBottomWidth @Text
borderEndWidth    = LayoutStyleProps.borderEndWidth @Text
--borderLeftWidth   = LayoutStyleProps.borderLeftWidth @Text
--borderRightWidth  = LayoutStyleProps.borderRightWidth @Text
borderStartWidth  = LayoutStyleProps.borderStartWidth @Text
--borderTopWidth    = LayoutStyleProps.borderTopWidth @Text
--borderWidth       = LayoutStyleProps.borderWidth @Text
bottom            = LayoutStyleProps.bottom @Text
display           = LayoutStyleProps.display @Text
end               = LayoutStyleProps.end @Text
flex              = LayoutStyleProps.flex @Text
flexBasis         = LayoutStyleProps.flexBasis @Text
flexDirection     = LayoutStyleProps.flexDirection @Text
flexGrow          = LayoutStyleProps.flexGrow @Text
flexShrink        = LayoutStyleProps.flexShrink @Text
flexWrap          = LayoutStyleProps.flexWrap @Text
height            = LayoutStyleProps.height @Text
justifyContent    = LayoutStyleProps.justifyContent @Text
left              = LayoutStyleProps.left @Text
margin            = LayoutStyleProps.margin @Text
marginBottom      = LayoutStyleProps.marginBottom @Text
marginEnd         = LayoutStyleProps.marginEnd @Text
alignItems        = LayoutStyleProps.alignItems @Text
marginLeft        = LayoutStyleProps.marginLeft @Text
marginRight       = LayoutStyleProps.marginRight @Text
marginStart       = LayoutStyleProps.marginStart @Text
marginTop         = LayoutStyleProps.marginTop @Text
marginVertical    = LayoutStyleProps.marginVertical @Text
maxHeight         = LayoutStyleProps.maxHeight @Text
maxWidth          = LayoutStyleProps.maxWidth @Text
minHeight         = LayoutStyleProps.minHeight @Text
minWidth          = LayoutStyleProps.minWidth @Text
overflow          = LayoutStyleProps.overflow @Text
padding           = LayoutStyleProps.padding @Text
paddingBottom     = LayoutStyleProps.paddingBottom @Text
paddingEnd        = LayoutStyleProps.paddingEnd @Text
paddingHorizontal = LayoutStyleProps.paddingHorizontal @Text
paddingLeft       = LayoutStyleProps.paddingLeft @Text
paddingRight      = LayoutStyleProps.paddingRight @Text
paddingStart      = LayoutStyleProps.paddingStart @Text
paddingTop        = LayoutStyleProps.paddingTop @Text
paddingVertical   = LayoutStyleProps.paddingVertical @Text
position          = LayoutStyleProps.position @Text
right             = LayoutStyleProps.right @Text
start             = LayoutStyleProps.start @Text
top               = LayoutStyleProps.top @Text
width             = LayoutStyleProps.width @Text
zIndex            = LayoutStyleProps.zIndex @Text
direction         = LayoutStyleProps.direction @Text

-- ShadowStyleProps:

shadowColor   = ShadowStyleProps.shadowColor @Text
shadowOffset  = ShadowStyleProps.shadowOffset @Text
shadowOpacity = ShadowStyleProps.shadowOpacity @Text
shadowRadius  = ShadowStyleProps.shadowRadius @Text

-- TransformsStyleProps:

transform = TransformsStyleProps.transform @Text
