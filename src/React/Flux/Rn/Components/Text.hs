{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.Text (
    module React.Flux.Rn.Components.Text,
    Color(..), EllipsizeMode(..), Inset(Inset),
    OnLayout (OnLayout), OnLayoutVals(OnLayoutVals),
    TextBreakStrategy(..)
) where

import           Numeric.Natural          (Natural)
import           Prelude                  (Bool, Double, String, ($))
import           React.Flux.Rn.Components (Props, Styles, Text, nestedProp,
                                           prop)
import           React.Flux.Rn.Events     (EventHandlerType, on0, on1)
import           React.Flux.Rn.Types      (Color (..), EllipsizeMode (..),
                                           Inset (Inset), OnLayout (OnLayout),
                                           OnLayoutVals (OnLayoutVals),
                                           TextBreakStrategy (..))

selectable :: Bool -> Props Text handler
selectable = prop "selectable"

accessible :: Bool -> Props Text handler
accessible = prop "accessible"

ellipsizeMode :: EllipsizeMode -> Props Text handler
ellipsizeMode = prop "ellipsizeMode"

nativeID :: String -> Props Text handler
nativeID = prop "nativeID"

numberOfLines :: Natural -> Props Text handler
numberOfLines = prop "numberOfLines"

onLayout :: (OnLayoutVals -> EventHandlerType handler) -> Props Text handler
onLayout f = on1 "onLayout" $ \(OnLayout x) -> f x

onLongPress :: EventHandlerType handler -> Props Text handler
onLongPress = on0 "onLongPress"

onPress :: EventHandlerType handler -> Props Text handler
onPress = on0 "onPress"

pressRetentionOffset :: Inset -> Props Text handler
pressRetentionOffset = prop "pressRetentionOffset"

allowFontScaling :: Bool -> Props Text handler
allowFontScaling = prop "allowFontScaling"

style :: [Styles Text handler] -> Props Text handler
style = nestedProp "style"

testID :: String -> Props Text handler
testID = prop "testID"

-- Platform: Android
disabled :: Bool -> Props Text handler
disabled = prop "disabled"

-- Platform: Android
selectionColor :: Color -> Props Text handler
selectionColor = prop "selectionColor"

-- Platform: Android
textBreakStrategy :: TextBreakStrategy -> Props Text handler
textBreakStrategy = prop "textBreakStrategy"

-- Platform: IOS
adjustsFontSizeToFit :: Bool -> Props Text handler
adjustsFontSizeToFit = prop "adjustsFontSizeToFit"

-- Platform: IOS
minimumFontScale :: Double -> Props Text handler
minimumFontScale = prop "minimumFontScale"

-- Platform: IOS
suppressHighlighting :: Bool -> Props Text handler
suppressHighlighting = prop "suppressHighlighting"
