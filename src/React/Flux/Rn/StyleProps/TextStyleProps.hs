{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.StyleProps.TextStyleProps (
    module React.Flux.Rn.StyleProps.TextStyleProps,
    Color (..), ContentSize (ContentSize), FontStyle (..), FontVariant (..), FontWeight (..), TextAlign (..), TextAlignVertical (..), TextDecorationLine (..), TextDecorationStyle (..), WritingDirection (..)
) where

import           Numeric.Natural          (Natural)
import           Prelude                  (Bool, Double, String)
import           React.Flux.Rn.Components (Styles, style)
import           React.Flux.Rn.Types      (Color (..), ContentSize (ContentSize),
                                           FontStyle (..), FontVariant (..),
                                           FontWeight (..), TextAlign (..),
                                           TextAlignVertical (..),
                                           TextDecorationLine (..),
                                           TextDecorationStyle (..),
                                           WritingDirection (..))

textShadowOffset :: ContentSize -> Styles component handler
textShadowOffset = style "textShadowOffset"

color :: Color -> Styles component handler
color = style "color"

fontSize :: Natural -> Styles component handler
fontSize = style "fontSize"

fontStyle :: FontStyle -> Styles component handler
fontStyle = style "fontStyle"

fontWeight :: FontWeight -> Styles component handler
fontWeight = style "fontWeight"

lineHeight :: Double -> Styles component handler
lineHeight = style "lineHeight"

textAlign :: TextAlign -> Styles component handler
textAlign = style "textAlign"

textDecorationLine :: TextDecorationLine -> Styles component handler
textDecorationLine = style "textDecorationLine"

textShadowColor :: Color -> Styles component handler
textShadowColor = style "textShadowColor"

fontFamily :: String -> Styles component handler
fontFamily = style "fontFamily"

textShadowRadius :: Natural -> Styles component handler
textShadowRadius = style "textShadowRadius"

-- Platform: Android
includeFontPadding :: Bool -> Styles component handler
includeFontPadding = style "includeFontPadding"

-- Platform: Android
textAlignVertical :: TextAlignVertical -> Styles component handler
textAlignVertical = style "textAlignVertical"

-- Platform: IOS
fontVariant :: FontVariant -> Styles component handler
fontVariant = style "fontVariant"

-- Platform: IOS
letterSpacing :: Natural -> Styles component handler
letterSpacing = style "letterSpacing"

-- Platform: IOS
textDecorationColor :: Color -> Styles component handler
textDecorationColor = style "textDecorationColor"

-- Platform: IOS
textDecorationStyle :: TextDecorationStyle -> Styles component handler
textDecorationStyle = style "textDecorationStyle"

-- Platform: IOS
writingDirection :: WritingDirection -> Styles component handler
writingDirection = style "writingDirection"
