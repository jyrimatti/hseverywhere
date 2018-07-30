{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.StyleProps.LayoutStyleProps (
    module React.Flux.Rn.StyleProps.LayoutStyleProps,
    AlignContent(..), AlignItems(..), AlignSelf(..), Direction(..), Display(..), FlexDirection(..), FlexWrap(..), JustifyContent(..), Length(..), Overflow(..), Position(..)
) where

import           Numeric.Natural          (Natural)
import           Prelude                  (Int)
import           React.Flux.Rn.Properties (Styles, style)
import           React.Flux.Rn.Types      (AlignContent (..), AlignItems (..),
                                           AlignSelf (..), Direction (..),
                                           Display (..), FlexDirection (..),
                                           FlexWrap (..), JustifyContent (..),
                                           Length (..), Overflow (..),
                                           Position (..))

marginHorizontal :: Length -> Styles component handler
marginHorizontal = style "marginHorizontal"

alignContent :: AlignContent -> Styles component handler
alignContent = style "alignContent"

alignSelf :: AlignSelf -> Styles component handler
alignSelf = style "alignSelf"

aspectRatio :: Natural -> Styles component handler
aspectRatio = style "aspectRatio"

borderBottomWidth :: Natural -> Styles component handler
borderBottomWidth = style "borderBottomWidth"

borderEndWidth :: Natural -> Styles component handler
borderEndWidth = style "borderEndWidth"

borderLeftWidth :: Natural -> Styles component handler
borderLeftWidth = style "borderLeftWidth"

borderRightWidth :: Natural -> Styles component handler
borderRightWidth = style "borderRightWidth"

borderStartWidth :: Natural -> Styles component handler
borderStartWidth = style "borderStartWidth"

borderTopWidth :: Natural -> Styles component handler
borderTopWidth = style "borderTopWidth"

borderWidth :: Natural -> Styles component handler
borderWidth = style "borderWidth"

bottom :: Length -> Styles component handler
bottom = style "bottom"

display :: Display -> Styles component handler
display = style "display"

end :: Length -> Styles component handler
end = style "end"

flex :: Int -> Styles component handler
flex = style "flex"

flexBasis :: Length -> Styles component handler
flexBasis = style "flexBasis"

flexDirection :: FlexDirection -> Styles component handler
flexDirection = style "flexDirection"

flexGrow :: Natural -> Styles component handler
flexGrow = style "flexGrow"

flexShrink :: Natural -> Styles component handler
flexShrink = style "flexShrink"

flexWrap :: FlexWrap -> Styles component handler
flexWrap = style "flexWrap"

height :: Length -> Styles component handler
height = style "height"

justifyContent :: JustifyContent -> Styles component handler
justifyContent = style "justifyContent"

left :: Length -> Styles component handler
left = style "left"

margin :: Length -> Styles component handler
margin = style "margin"

marginBottom :: Length -> Styles component handler
marginBottom = style "marginBottom"

marginEnd :: Length -> Styles component handler
marginEnd = style "marginEnd"

alignItems :: AlignItems -> Styles component handler
alignItems = style "alignItems"

marginLeft :: Length -> Styles component handler
marginLeft = style "marginLeft"

marginRight :: Length -> Styles component handler
marginRight = style "marginRight"

marginStart :: Length -> Styles component handler
marginStart = style "marginStart"

marginTop :: Length -> Styles component handler
marginTop = style "marginTop"

marginVertical :: Length -> Styles component handler
marginVertical = style "marginVertical"

maxHeight :: Length -> Styles component handler
maxHeight = style "maxHeight"

maxWidth :: Length -> Styles component handler
maxWidth = style "maxWidth"

minHeight :: Length -> Styles component handler
minHeight = style "minHeight"

minWidth :: Length -> Styles component handler
minWidth = style "minWidth"

overflow :: Overflow -> Styles component handler
overflow = style "overflow"

padding :: Length -> Styles component handler
padding = style "padding"

paddingBottom :: Length -> Styles component handler
paddingBottom = style "paddingBottom"

paddingEnd :: Length -> Styles component handler
paddingEnd = style "paddingEnd"

paddingHorizontal :: Length -> Styles component handler
paddingHorizontal = style "paddingHorizontal"

paddingLeft :: Length -> Styles component handler
paddingLeft = style "paddingLeft"

paddingRight :: Length -> Styles component handler
paddingRight = style "paddingRight"

paddingStart :: Length -> Styles component handler
paddingStart = style "paddingStart"

paddingTop :: Length -> Styles component handler
paddingTop = style "paddingTop"

paddingVertical :: Length -> Styles component handler
paddingVertical = style "paddingVertical"

position :: Position -> Styles component handler
position = style "position"

right :: Length -> Styles component handler
right = style "right"

start :: Length -> Styles component handler
start = style "start"

top :: Length -> Styles component handler
top = style "top"

width :: Length -> Styles component handler
width = style "width"

zIndex :: Int -> Styles component handler
zIndex = style "zIndex"

-- Platform: IOS
direction :: Direction -> Styles component handler
direction = style "direction"
