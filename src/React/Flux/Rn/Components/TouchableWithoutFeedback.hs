{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.TouchableWithoutFeedback (
    module React.Flux.Rn.Components.TouchableWithoutFeedback,
    TouchableWithoutFeedbackProps.AccessibilityComponentTypes(..),
    TouchableWithoutFeedbackProps.AccessibilityTraits(..),
    TouchableWithoutFeedbackProps.Inset(Inset),
    TouchableWithoutFeedbackProps.OnLayout(OnLayout)
) where

import           Prelude                                           (fmap)
import           Prelude                                           ((.))
import           React.Flux                                        (ReactElementM,
                                                                    foreign_)
import           React.Flux.Rn.Properties                          (Props,
                                                                    props)
import qualified React.Flux.Rn.Props.TouchableWithoutFeedbackProps as TouchableWithoutFeedbackProps

data TouchableWithoutFeedback
touchableWithoutFeedback :: [Props TouchableWithoutFeedback handler] -> ReactElementM handler a -> ReactElementM handler a
touchableWithoutFeedback = foreign_ "TouchableWithoutFeedback" . fmap props

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
