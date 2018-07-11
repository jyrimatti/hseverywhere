{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.TouchableOpacity where

import           Numeric.Natural
import           Prelude                                           (Bool,
                                                                    Double)
import           React.Flux
import qualified React.Flux.Rn.Components.TouchableWithoutFeedback as TWF
import           React.Flux.Rn.Types

activeOpacity :: Double -> PropertyOrHandler handler
activeOpacity = (&=) "activeOpacity"

tvParallaxProperties :: TvParallaxProperties -> PropertyOrHandler handler
tvParallaxProperties = (&=) "tvParallaxProperties"

-- Platform: IOS
hasTVPreferredFocus :: Bool -> PropertyOrHandler handler
hasTVPreferredFocus = (&=) "hasTVPreferredFocus"




-- TouchableWithoutFeedback props

hitSlop :: Inset -> PropertyOrHandler handler
hitSlop = TWF.hitSlop

accessibilityComponentType :: AccessibilityComponentTypes -> PropertyOrHandler handler
accessibilityComponentType = TWF.accessibilityComponentType

accessible :: Bool -> PropertyOrHandler handler
accessible = TWF.accessible

delayLongPress :: Natural -> PropertyOrHandler handler
delayLongPress = TWF.delayLongPress

delayPressIn :: Natural -> PropertyOrHandler handler
delayPressIn = TWF.delayPressIn

delayPressOut :: Natural -> PropertyOrHandler handler
delayPressOut = TWF.delayPressOut

disabled :: Bool -> PropertyOrHandler handler
disabled = TWF.disabled

accessibilityTraits :: AccessibilityTraits -> PropertyOrHandler handler
accessibilityTraits = TWF.accessibilityTraits

onLayout :: (OnLayout -> EventHandlerType handler) -> PropertyOrHandler handler
onLayout = TWF.onLayout

onLongPress :: EventHandlerType handler -> PropertyOrHandler handler
onLongPress = TWF.onLongPress

onPress :: EventHandlerType handler -> PropertyOrHandler handler
onPress = TWF.onPress

onPressIn :: EventHandlerType handler -> PropertyOrHandler handler
onPressIn = TWF.onPressIn

onPressOut :: EventHandlerType handler -> PropertyOrHandler handler
onPressOut = TWF.onPressOut

pressRetentionOffset :: Inset -> PropertyOrHandler handler
pressRetentionOffset = TWF.pressRetentionOffset

-- TODO: methods
