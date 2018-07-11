{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.TouchableHighlight where

import           Numeric.Natural
import           Prelude                                           (Bool,
                                                                    Double)
import           React.Flux
import qualified React.Flux.Rn.Components.TouchableWithoutFeedback as TWF
import           React.Flux.Rn.Events
import           React.Flux.Rn.Types

activeOpacity :: Double -> PropertyOrHandler handler
activeOpacity = (&=) "activeOpacity"

onHideUnderlay :: EventHandlerType handler -> PropertyOrHandler handler
onHideUnderlay = on0 "onHideUnderlay"

onShowUnderlay :: EventHandlerType handler -> PropertyOrHandler handler
onShowUnderlay = on0 "onShowUnderlay"

style :: ViewStyleProps -> PropertyOrHandler handler
style = nestedProperty "style"

underlayColor :: Color -> PropertyOrHandler handler
underlayColor = (&=) "underlayColor"

-- Platform: IOS
hasTVPreferredFocus :: Bool -> PropertyOrHandler handler
hasTVPreferredFocus = (&=) "hasTVPreferredFocus"

-- Platform: IOS
tvParallaxProperties :: TvParallaxProperties -> PropertyOrHandler handler
tvParallaxProperties = (&=) "tvParallaxProperties"



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
