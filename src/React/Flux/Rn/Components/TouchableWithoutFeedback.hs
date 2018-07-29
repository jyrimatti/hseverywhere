{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.TouchableWithoutFeedback (
    module React.Flux.Rn.Components.TouchableWithoutFeedback,
    TouchableWithoutFeedbackProps.AccessibilityComponentTypes(..),
    TouchableWithoutFeedbackProps.AccessibilityTraits(..),
    TouchableWithoutFeedbackProps.Inset(Inset),
    TouchableWithoutFeedbackProps.OnLayout(OnLayout)
) where

import           React.Flux.Rn.Components                          (TouchableWithoutFeedback)
import qualified React.Flux.Rn.Props.TouchableWithoutFeedbackProps as TouchableWithoutFeedbackProps

-- TouchableWithoutFeedbackProps:

hitSlop                    = TouchableWithoutFeedbackProps.hitSlop @TouchableWithoutFeedback
accessibilityComponentType = TouchableWithoutFeedbackProps.accessibilityComponentType @TouchableWithoutFeedback
accessible                 = TouchableWithoutFeedbackProps.accessible @TouchableWithoutFeedback
delayLongPress             = TouchableWithoutFeedbackProps.delayLongPress @TouchableWithoutFeedback
delayPressIn               = TouchableWithoutFeedbackProps.delayPressIn @TouchableWithoutFeedback
delayPressOut              = TouchableWithoutFeedbackProps.delayPressOut @TouchableWithoutFeedback
disabled                   = TouchableWithoutFeedbackProps.disabled @TouchableWithoutFeedback
accessibilityTraits        = TouchableWithoutFeedbackProps.accessibilityTraits @TouchableWithoutFeedback
onLayout                   = TouchableWithoutFeedbackProps.onLayout @TouchableWithoutFeedback
onLongPress                = TouchableWithoutFeedbackProps.onLongPress @TouchableWithoutFeedback
onPress                    = TouchableWithoutFeedbackProps.onPress @TouchableWithoutFeedback
onPressIn                  = TouchableWithoutFeedbackProps.onPressIn @TouchableWithoutFeedback
onPressOut                 = TouchableWithoutFeedbackProps.onPressOut @TouchableWithoutFeedback
pressRetentionOffset       = TouchableWithoutFeedbackProps.pressRetentionOffset @TouchableWithoutFeedback
