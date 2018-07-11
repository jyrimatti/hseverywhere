{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.Text where

import           Numeric.Natural
import           Prelude              (Bool, Double, String, ($))
import           React.Flux
import           React.Flux.Rn.Events
import           React.Flux.Rn.Types

selectable :: Bool -> PropertyOrHandler handler
selectable = (&=) "selectable"

accessible :: Bool -> PropertyOrHandler handler
accessible = (&=) "accessible"

ellipsizeMode :: EllipsizeMode -> PropertyOrHandler handler
ellipsizeMode = (&=) "ellipsizeMode"

nativeID :: String -> PropertyOrHandler handler
nativeID = (&=) "nativeID"

numberOfLines :: Natural -> PropertyOrHandler handler
numberOfLines = (&=) "numberOfLines"

onLayout :: (OnLayoutVals -> EventHandlerType handler) -> PropertyOrHandler handler
onLayout f = on1 "onLayout" $ \(OnLayout x) -> f x

onLongPress :: EventHandlerType handler -> PropertyOrHandler handler
onLongPress = on0 "onLongPress"

onPress :: EventHandlerType handler -> PropertyOrHandler handler
onPress = on0 "onPress"

pressRetentionOffset :: Inset -> PropertyOrHandler handler
pressRetentionOffset = (&=) "pressRetentionOffset"

allowFontScaling :: Bool -> PropertyOrHandler handler
allowFontScaling = (&=) "allowFontScaling"

style :: TextComponentStyleProps -> PropertyOrHandler handler
style = nestedProperty "style"

testID :: String -> PropertyOrHandler handler
testID = (&=) "testID"

-- Platform: Android
disabled :: Bool -> PropertyOrHandler handler
disabled = (&=) "disabled"

-- Platform: Android
selectionColor :: Color -> PropertyOrHandler handler
selectionColor = (&=) "selectionColor"

-- Platform: Android
textBreakStrategy :: TextBreakStrategy -> PropertyOrHandler handler
textBreakStrategy = (&=) "textBreakStrategy"

-- Platform: IOS
adjustsFontSizeToFit :: Bool -> PropertyOrHandler handler
adjustsFontSizeToFit = (&=) "adjustsFontSizeToFit"

-- Platform: IOS
minimumFontScale :: Double -> PropertyOrHandler handler
minimumFontScale = (&=) "minimumFontScale"

-- Platform: IOS
suppressHighlighting :: Bool -> PropertyOrHandler handler
suppressHighlighting = (&=) "suppressHighlighting"
