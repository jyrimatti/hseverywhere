{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.TouchableNativeFeedback where

import           GHC.Generics
import           GHCJS.Marshal                                     (ToJSVal (..))
import           Numeric.Natural
import           Prelude                                           (Bool)
import           React.Flux
import qualified React.Flux.Rn.Components.TouchableWithoutFeedback as TWF
import           React.Flux.Rn.Types

background :: BackgroundPropType -> PropertyOrHandler handler
background = (&=) "background"

useForeground :: Bool -> PropertyOrHandler handler
useForeground = (&=) "useForeground"



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
