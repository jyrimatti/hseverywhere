{-# LANGUAGE OverloadedStrings, DeriveGeneric, DeriveAnyClass #-}
module React.Flux.Rn.Style where

import Prelude hiding (Left, Right)
import Numeric.Natural (Natural)
import Data.Word (Word8)
import Data.Aeson (ToJSON(..),(.=),object)
import Data.String (IsString(..))

import React.Flux (PropertyOrHandler, nestedProperty, (@=), ($=))



style :: [PropertyOrHandler handler] -> PropertyOrHandler handler
style = nestedProperty "style"

type Number = Int

type Percentage = Natural

data Color = Color String
           | Rgb Word8 Word8 Word8
           | Rgba Word8 Word8 Word8 Double
           | Hsl Natural Percentage Percentage
           | Hsla Natural Percentage Percentage Double
           | Transparent

instance ToJSON Color where
    toJSON (Color s)      = toJSON $ s
    toJSON (Rgb r g b)    = toJSON $ "rgb("  ++ show r ++ "," ++ show g ++ "," ++ show b ++ ")"
    toJSON (Rgba r g b a) = toJSON $ "rgba(" ++ show r ++ "," ++ show g ++ "," ++ show b ++ "," ++ show a ++ ")"
    toJSON (Hsl h s l)    = toJSON $ "hsl("  ++ show h ++ "," ++ show s ++ "%," ++ show l ++ "%)"
    toJSON (Hsla h s l a) = toJSON $ "hsla(" ++ show h ++ "," ++ show s ++ "%," ++ show l ++ "%," ++ show a ++ ")"
    toJSON Transparent    = toJSON $ ("transparent" :: String)

instance IsString Color where
    fromString = Color


-- Flexbox

data AlignItemsEnum = IFlexStart | IFlexEnd | ICenter | IStretch
alignItems IFlexStart = "alignItems" $= "flex-start"
alignItems IFlexEnd   = "alignItems" $= "flex-end"
alignItems ICenter    = "alignItems" $= "center"
alignItems IStretch   = "alignItems" $= "stretch"

data AlignSelfEnum = SAuto | SFlexStart | SFlexEnd | SCenter | SStretch
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
bottom            n = "bottom"            @= (n :: Number)
flex              n = "flex"              @= (n :: Natural)

data FlexDirectionEnum = Row | Column
flexDirection Row    = "flexDirection" $= "row"
flexDirection Column = "flexDirection" $= "column"

data FlexWrapEnum = Wrap | Nowrap
flexWrap Wrap   = "flexWrap" $= "wrap"
flexWrap Nowrap = "flexWrap" $= "nowrap"

height n = "height" @= (n :: Natural)

data JustifyContentEnum = JFlexStart | JFlexEnd | JCenter | JSpaceBetween | JSpaceAround
justifyContent JFlexStart    = "justifyContent" $= "flex-start"
justifyContent JFlexEnd      = "justifyContent" $= "flex-end"
justifyContent JCenter       = "justifyContent" $= "center"
justifyContent JSpaceBetween = "justifyContent" $= "space-between"
justifyContent JSpaceAround  = "justifyContent" $= "space-around"

left              n = "left"              @= (n :: Number)
margin            n = "margin"            @= (n :: Number)
marginBottom      n = "marginBottom"      @= (n :: Number)
marginHorizontal  n = "marginHorizontal"  @= (n :: Number) 
marginLeft        n = "marginLeft"        @= (n :: Number) 
marginRight       n = "marginRight"       @= (n :: Number) 
marginTop         n = "marginTop"         @= (n :: Number) 
marginVertical    n = "marginVertical"    @= (n :: Number) 
padding           n = "padding"           @= (n :: Number) 
paddingBottom     n = "paddingBottom"     @= (n :: Number) 
paddingHorizontal n = "paddingHorizontal" @= (n :: Number) 
paddingLeft       n = "paddingLeft"       @= (n :: Number) 
paddingRight      n = "paddingRight"      @= (n :: Number) 
paddingTop        n = "paddingTop"        @= (n :: Number) 
paddingVertical   n = "paddingVertical"   @= (n :: Number) 

data PositionEnum = Absolute | Relative
position Absolute = "position" $= "absolute"
position Relative = "position" $= "relative"

right n = "right" @= (n :: Number) 
top   n = "top"   @= (n :: Number) 
width n = "width" @= (n :: Natural) 


-- ShadowPropTypesIOS

shadowColor c = "shadowColor" @= (c :: Color) 
shadowOffset width height = nestedProperty "shadowOffset" ["width" @= (width :: Natural), "height" @= (height :: Natural)]
shadowOpacity n = "shadowOpacity" @= (n :: Double)
shadowRadius  n = "shadowRadius"  @= (n :: Natural)



-- Transforms

data Transform = Perspective Number
               | Rotate String
               | RotateX String
               | RotateY String
               | RotateZ String
               | Scale Natural
               | ScaleX Natural
               | ScaleY Natural
               | TranslateX Number
               | TranslateY Number
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

instance ToJSON Natural where
  toJSON = toJSON . toInteger

transform :: [Transform] -> PropertyOrHandler handler
transform ts = "transform" @= ts

-- ?
--transformMatrix TransformMatrixPropType 



-- View

data VisibilityEnum = Visible | Hidden

backfaceVisibility Visible = "backfaceVisibility" $= "visible"
backfaceVisibility Hidden  = "backfaceVisibility" $= "hidden"

backgroundColor         c = "backgroundColor"         @= (c :: Color)
borderBottomColor       c = "borderBottomColor"       @= (c :: Color)
borderBottomLeftRadius  n = "borderBottomLeftRadius"  @= (n :: Natural)
borderBottomRightRadius n = "borderBottomRightRadius" @= (n :: Natural)
borderColor             c = "borderColor"             @= (c :: Color)
borderLeftColor         c = "borderLeftColor"         @= (c :: Color)
borderRadius            n = "borderRadius"            @= (n :: Natural)
borderRightColor        c = "borderRightColor"        @= (c :: Color)

data BorderStyleEnum = Solid | Dotted | Dashed
borderStyle Solid  = "borderStyle" $= "solid"
borderStyle Dotted = "borderStyle" $= "dotted"
borderStyle Dashed = "borderStyle" $= "dashed"

borderTopColor       c = "borderTopColor"       @= (c :: Color)
borderTopLeftRadius  n = "borderTopLeftRadius"  @= (n :: Natural)
borderTopRightRadius n = "borderTopRightRadius" @= (n :: Natural)
opacity              n = "opacity"              @= (n :: Double)

overflow Visible = "overflow" $= "visible"
overflow Hidden  = "overflow" $= "hidden"

androidElevation n = "elevation" @= (n :: Number)



-- Image

-- ?
--resizeMode Object.keys(ImageResizeMode)

androidOverlayColor s = "overlayColor" $= s
iosTintColor        c = "tintColor"    @= (c :: Color)



-- Text

color      c = "color"      @= (c :: Color)
fontFamily s = "fontFamily" $= s
fontSize   n = "fontSize"   @= (n :: Natural)

data FontStyleEnum = Normal | Italic
fontStyle Normal = "fontStyle" $= "normal"
fontStyle Italic = "fontStyle" $= "italic"

data FontWeightEnum = WNormal | WBold | W100 | W200 | W300 | W400 | W500 | W600 | W700 | W800 | W900
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

data TextAlignEnum = Auto | Left | Right | Center | Justify
textAlign Auto    = "textAlign" $= "auto"
textAlign Left    = "textAlign" $= "left"
textAlign Right   = "textAlign" $= "right"
textAlign Center  = "textAlign" $= "center"
textAlign Justify = "textAlign" $= "justify"

data TextDecorationLineEnum = None | Underline | LineThrough | UnderLineAndLineThrough
textDecorationLine None                    = "textDecorationLine" $= "none"
textDecorationLine Underline               = "textDecorationLine" $= "underline"
textDecorationLine LineThrough             = "textDecorationLine" $= "line-through"
textDecorationLine UnderLineAndLineThrough = "textDecorationLine" $= "underline line-through"

textShadowColor c = "textShadowColor" @= (c :: Color)
textShadowOffset width height = nestedProperty "textShadowOffset" ["width" @= (width :: Natural), "height" @= (height :: Natural)]
textShadowRadius n = "textShadowRadius" @= (n :: Natural)

data TextAlignVerticalEnum = AAuto | ATop | ABottom | ACenter
androidTextAlignVertical AAuto   = "textAlignVertical" $= "auto"
androidTextAlignVertical ATop    = "textAlignVertical" $= "top"
androidTextAlignVertical ABottom = "textAlignVertical" $= "bottom"
androidTextAlignVertical ACenter = "textAlignVertical" $= "center"

iosLetterSpacing       n = "letterSpacing" @= (n :: Natural)
iosTextDecorationColor c = "textDecorationColor" @= (c :: Color)

data TextDecorationStyleEnum = DSolid | DDouble | DDotted | DDashed
iosTextDecorationStyle DSolid  = "textDecorationStyle" $= "solid"
iosTextDecorationStyle DDouble = "textDecorationStyle" $= "double"
iosTextDecorationStyle DDotted = "textDecorationStyle" $= "dotted"
iosTextDecorationStyle DDashed = "textDecorationStyle" $= "dashed"

data WritingDirectionEnum = WAuto | WLtr | WRtl
iosWritingDirection WAuto = "writingDirection" $= "auto"
iosWritingDirection WLtr  = "writingDirection" $= "ltr"
iosWritingDirection WRtl  = "writingDirection" $= "rtl"
