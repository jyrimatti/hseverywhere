{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.Style (module React.Flux.Rn.Style, React.Flux.Rn.Types.Color(..)) where

import           Prelude             hiding (Left, Right)

import           Data.Aeson          (ToJSON (..), object, (.=))
import           Numeric.Natural     (Natural)
import           React.Flux
import           React.Flux.Rn.Types hiding (Auto, Center, Left, None, Right,
                                      Scale, StyleAttr (..))


data AlignItemsEnum = IFlexStart | IFlexEnd | ICenter | IStretch
data AlignSelfEnum = SAuto | SFlexStart | SFlexEnd | SCenter | SStretch

data FlexDirectionEnum = Row | Column
data FlexWrapEnum = Wrap | Nowrap

data JustifyContentEnum = JFlexStart | JFlexEnd | JCenter | JSpaceBetween | JSpaceAround

data PositionEnum = Absolute | Relative

data Transform = Perspective Int
               | Rotate String
               | RotateX String
               | RotateY String
               | RotateZ String
               | Scale Natural
               | ScaleX Natural
               | ScaleY Natural
               | TranslateX Int
               | TranslateY Int
               | SkewX String
               | SkewY String

instance ToJSON Transform where
  toJSON (Perspective x) = object [ "perspective" .= x ]
  toJSON (Rotate x)      = object [ "rotate"      .= x ]
  toJSON (RotateX x)     = object [ "rotateX"     .= x ]
  toJSON (RotateY x)     = object [ "rotateY"     .= x ]
  toJSON (RotateZ x)     = object [ "rotateZ"     .= x ]
  toJSON (Scale x)       = object [ "scale"       .= x ]
  toJSON (ScaleX x)      = object [ "scaleX"      .= x ]
  toJSON (ScaleY x)      = object [ "scaleY"      .= x ]
  toJSON (TranslateX x)  = object [ "translateX"  .= x ]
  toJSON (TranslateY x)  = object [ "translateY"  .= x ]
  toJSON (SkewX x)       = object [ "skewX"       .= x ]
  toJSON (SkewY x)       = object [ "skewY"       .= x ]

data BorderStyleEnum = Solid | Dotted | Dashed

data FontStyleEnum = Normal | Italic

data FontWeightEnum = WNormal | WBold | W100 | W200 | W300 | W400 | W500 | W600 | W700 | W800 | W900

data TextAlignEnum = Auto | Left | Right | Center | Justify
data TextDecorationLineEnum = None | Underline | LineThrough | UnderLineAndLineThrough

data TextAlignVerticalEnum = AAuto | ATop | ABottom | ACenter

data TextDecorationStyleEnum = DSolid | DDouble | DDotted | DDashed
data WritingDirectionEnum = WAuto | WLtr | WRtl

-- Flexbox

alignItems IFlexStart = "alignItems" $= "flex-start"
alignItems IFlexEnd   = "alignItems" $= "flex-end"
alignItems ICenter    = "alignItems" $= "center"
alignItems IStretch   = "alignItems" $= "stretch"

alignSelf SAuto      = "alignSelf" $= "auto"
alignSelf SFlexStart = "alignSelf" $= "flex-start"
alignSelf SFlexEnd   = "alignSelf" $= "flex-end"
alignSelf SCenter    = "alignSelf" $= "center"
alignSelf SStretch   = "alignSelf" $= "stretch"

borderBottomWidth n = "borderBottomWidth" @= (n :: Natural)
borderLeftWidth   n = "borderLeftWidth"   @= (n :: Natural)
borderRightWidth  n = "borderRightWidth"  @= (n :: Natural)
borderTopWidth    n = "borderTopWidth"    @= (n :: Natural)
borderWidth       n = "borderWidth"       @= (n :: Natural)
bottom            n = "bottom"            @= (n :: Int)
flex              n = "flex"              @= (n :: Natural)

flexDirection Row    = "flexDirection" $= "row"
flexDirection Column = "flexDirection" $= "column"

flexWrap Wrap   = "flexWrap" $= "wrap"
flexWrap Nowrap = "flexWrap" $= "nowrap"

height n = "height" @= (n :: Natural)

justifyContent JFlexStart    = "justifyContent" $= "flex-start"
justifyContent JFlexEnd      = "justifyContent" $= "flex-end"
justifyContent JCenter       = "justifyContent" $= "center"
justifyContent JSpaceBetween = "justifyContent" $= "space-between"
justifyContent JSpaceAround  = "justifyContent" $= "space-around"

left              n = "left"              @= (n :: Int)
margin            n = "margin"            @= (n :: Int)
marginBottom      n = "marginBottom"      @= (n :: Int)
marginHorizontal  n = "marginHorizontal"  @= (n :: Int)
marginLeft        n = "marginLeft"        @= (n :: Int)
marginRight       n = "marginRight"       @= (n :: Int)
marginTop         n = "marginTop"         @= (n :: Int)
marginVertical    n = "marginVertical"    @= (n :: Int)
padding           n = "padding"           @= (n :: Int)
paddingBottom     n = "paddingBottom"     @= (n :: Int)
paddingHorizontal n = "paddingHorizontal" @= (n :: Int)
paddingLeft       n = "paddingLeft"       @= (n :: Int)
paddingRight      n = "paddingRight"      @= (n :: Int)
paddingTop        n = "paddingTop"        @= (n :: Int)
paddingVertical   n = "paddingVertical"   @= (n :: Int)

position Absolute = "position" $= "absolute"
position Relative = "position" $= "relative"

right n = "right" @= (n :: Int)
top   n = "top"   @= (n :: Int)
width n = "width" @= (n :: Natural)


-- ShadowPropTypesIOS

shadowColor c = "shadowColor" &= (c :: Color)
shadowOffset width height = nestedProperty "shadowOffset" ["width" @= (width :: Natural), "height" @= (height :: Natural)]
shadowOpacity n = "shadowOpacity" &= (n :: Double)
shadowRadius  n = "shadowRadius"  &= (n :: Natural)



-- Transforms

transform :: [Transform] -> PropertyOrHandler handler
transform ts = "transform" @= ts

-- ?
--transformMatrix TransformMatrixPropType



-- View

backfaceVisibility Visible = "backfaceVisibility" $= "visible"
backfaceVisibility Hidden  = "backfaceVisibility" $= "hidden"

backgroundColor         c = "backgroundColor"         &= (c :: Color)
borderBottomColor       c = "borderBottomColor"       &= (c :: Color)
borderBottomLeftRadius  n = "borderBottomLeftRadius"  &= (n :: Natural)
borderBottomRightRadius n = "borderBottomRightRadius" &= (n :: Natural)
borderColor             c = "borderColor"             &= (c :: Color)
borderLeftColor         c = "borderLeftColor"         &= (c :: Color)
borderRadius            n = "borderRadius"            &= (n :: Natural)
borderRightColor        c = "borderRightColor"        &= (c :: Color)

borderStyle Solid  = "borderStyle" $= "solid"
borderStyle Dotted = "borderStyle" $= "dotted"
borderStyle Dashed = "borderStyle" $= "dashed"

borderTopColor       c = "borderTopColor"       &= (c :: Color)
borderTopLeftRadius  n = "borderTopLeftRadius"  &= (n :: Natural)
borderTopRightRadius n = "borderTopRightRadius" &= (n :: Natural)
opacity              n = "opacity"              &= (n :: Double)

overflow Visible = "overflow" $= "visible"
overflow Hidden  = "overflow" $= "hidden"

androidElevation n = "elevation" &= (n :: Int)



-- Image

-- ?
--resizeMode Object.keys(ImageResizeMode)

androidOverlayColor s = "overlayColor" $= s
iosTintColor        c = "tintColor"    &= (c :: Color)



-- Text

color      c = "color"      &= (c :: Color)
fontFamily s = "fontFamily" $= s
fontSize   n = "fontSize"   &= (n :: Natural)

fontStyle Normal = "fontStyle" $= "normal"
fontStyle Italic = "fontStyle" $= "italic"

fontWeight WNormal = "fontWeight" $= "normal"
fontWeight WBold   = "fontWeight" $= "bold"
fontWeight W100    = "fontWeight" $= "100"
fontWeight W200    = "fontWeight" $= "200"
fontWeight W300    = "fontWeight" $= "300"
fontWeight W400    = "fontWeight" $= "400"
fontWeight W500    = "fontWeight" $= "500"
fontWeight W600    = "fontWeight" $= "600"
fontWeight W700    = "fontWeight" $= "700"
fontWeight W800    = "fontWeight" $= "800"
fontWeight W900    = "fontWeight" $= "900"

lineHeight n = "lineHeight" @= (n :: Natural)

textAlign Auto    = "textAlign" $= "auto"
textAlign Left    = "textAlign" $= "left"
textAlign Right   = "textAlign" $= "right"
textAlign Center  = "textAlign" $= "center"
textAlign Justify = "textAlign" $= "justify"

textDecorationLine None                    = "textDecorationLine" $= "none"
textDecorationLine Underline               = "textDecorationLine" $= "underline"
textDecorationLine LineThrough             = "textDecorationLine" $= "line-through"
textDecorationLine UnderLineAndLineThrough = "textDecorationLine" $= "underline line-through"

textShadowColor c = "textShadowColor" &= (c :: Color)
textShadowOffset width height = nestedProperty "textShadowOffset" ["width" @= (width :: Natural), "height" @= (height :: Natural)]
textShadowRadius n = "textShadowRadius" &= (n :: Natural)

androidTextAlignVertical AAuto   = "textAlignVertical" $= "auto"
androidTextAlignVertical ATop    = "textAlignVertical" $= "top"
androidTextAlignVertical ABottom = "textAlignVertical" $= "bottom"
androidTextAlignVertical ACenter = "textAlignVertical" $= "center"

iosLetterSpacing       n = "letterSpacing" &= (n :: Natural)
iosTextDecorationColor c = "textDecorationColor" &= (c :: Color)

iosTextDecorationStyle DSolid  = "textDecorationStyle" $= "solid"
iosTextDecorationStyle DDouble = "textDecorationStyle" $= "double"
iosTextDecorationStyle DDotted = "textDecorationStyle" $= "dotted"
iosTextDecorationStyle DDashed = "textDecorationStyle" $= "dashed"

iosWritingDirection WAuto = "writingDirection" $= "auto"
iosWritingDirection WLtr  = "writingDirection" $= "ltr"
iosWritingDirection WRtl  = "writingDirection" $= "rtl"


