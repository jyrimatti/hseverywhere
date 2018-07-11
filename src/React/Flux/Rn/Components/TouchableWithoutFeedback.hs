{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.TouchableWithoutFeedback where

import           Numeric.Natural
import           Prelude              (Bool)
import           React.Flux
import           React.Flux.Rn.Events
import           React.Flux.Rn.Types

hitSlop :: Inset -> PropertyOrHandler handler
hitSlop = (&=) "hitSlop"

accessibilityComponentType :: AccessibilityComponentTypes -> PropertyOrHandler handler
accessibilityComponentType = (&=) "accessibilityComponentType"

accessible :: Bool -> PropertyOrHandler handler
accessible = (&=) "accessible"

delayLongPress :: Natural -> PropertyOrHandler handler
delayLongPress = (&=) "delayLongPress"

delayPressIn :: Natural -> PropertyOrHandler handler
delayPressIn = (&=) "delayPressIn"

delayPressOut :: Natural -> PropertyOrHandler handler
delayPressOut = (&=) "delayPressOut"

disabled :: Bool -> PropertyOrHandler handler
disabled = (&=) "disabled"

accessibilityTraits :: AccessibilityTraits -> PropertyOrHandler handler
accessibilityTraits = (&=) "accessibilityTraits"

onLayout :: (OnLayout -> EventHandlerType handler) -> PropertyOrHandler handler
onLayout = on1 "onLayout"

onLongPress :: EventHandlerType handler -> PropertyOrHandler handler
onLongPress = on0 "onLongPress"

onPress :: EventHandlerType handler -> PropertyOrHandler handler
onPress = on0 "onPress"

onPressIn :: EventHandlerType handler -> PropertyOrHandler handler
onPressIn = on0 "onPressIn"

onPressOut :: EventHandlerType handler -> PropertyOrHandler handler
onPressOut = on0 "onPressOut"

pressRetentionOffset :: Inset -> PropertyOrHandler handler
pressRetentionOffset = (&=) "pressRetentionOffset"
