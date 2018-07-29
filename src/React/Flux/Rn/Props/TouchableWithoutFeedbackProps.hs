{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Props.TouchableWithoutFeedbackProps (
    module React.Flux.Rn.Props.TouchableWithoutFeedbackProps,
    AccessibilityComponentTypes(..),
    AccessibilityTraits(..), Inset(Inset), OnLayout(OnLayout)
) where

import           Numeric.Natural          (Natural)
import           Prelude                  (Bool)
import           React.Flux.Rn.Components (Props, prop)
import           React.Flux.Rn.Events     (EventHandlerType, on0, on1)
import           React.Flux.Rn.Types      (AccessibilityComponentTypes (..),
                                           AccessibilityTraits (..),
                                           Inset (Inset), OnLayout (OnLayout))

hitSlop :: Inset -> Props component handler
hitSlop = prop "hitSlop"

accessibilityComponentType :: AccessibilityComponentTypes -> Props component handler
accessibilityComponentType = prop "accessibilityComponentType"

accessible :: Bool -> Props component handler
accessible = prop "accessible"

delayLongPress :: Natural -> Props component handler
delayLongPress = prop "delayLongPress"

delayPressIn :: Natural -> Props component handler
delayPressIn = prop "delayPressIn"

delayPressOut :: Natural -> Props component handler
delayPressOut = prop "delayPressOut"

disabled :: Bool -> Props component handler
disabled = prop "disabled"

accessibilityTraits :: AccessibilityTraits -> Props component handler
accessibilityTraits = prop "accessibilityTraits"

onLayout :: forall component handler. (OnLayout -> EventHandlerType handler) -> Props component handler
onLayout = on1 "onLayout"

onLongPress :: forall component handler. EventHandlerType handler -> Props component handler
onLongPress = on0 "onLongPress"

onPress :: forall component handler. EventHandlerType handler -> Props component handler
onPress = on0 "onPress"

onPressIn :: forall component handler. EventHandlerType handler -> Props component handler
onPressIn = on0 "onPressIn"

onPressOut :: forall component handler. EventHandlerType handler -> Props component handler
onPressOut = on0 "onPressOut"

pressRetentionOffset :: Inset -> Props component handler
pressRetentionOffset = prop "pressRetentionOffset"
