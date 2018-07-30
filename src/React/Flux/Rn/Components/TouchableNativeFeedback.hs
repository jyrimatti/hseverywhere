{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.TouchableNativeFeedback (
    module React.Flux.Rn.Components.TouchableNativeFeedback,
    BackgroundPropType,
    TouchableWithoutFeedbackProps.AccessibilityComponentTypes(..),
    TouchableWithoutFeedbackProps.AccessibilityTraits(..),
    TouchableWithoutFeedbackProps.Inset(Inset),
    TouchableWithoutFeedbackProps.OnLayout(OnLayout)
) where

import           Prelude                                           (Bool)
import           Prelude                                           (fmap)
import           Prelude                       ((.))
import           React.Flux                                        (ReactElementM,
                                                                    foreign_)
import           React.Flux.Rn.Properties                          (Props, prop,
                                                                    props)
import qualified React.Flux.Rn.Props.TouchableWithoutFeedbackProps as TouchableWithoutFeedbackProps
import           React.Flux.Rn.Types                               (BackgroundPropType)

data TouchableNativeFeedback
touchableNativeFeedback :: [Props TouchableNativeFeedback handler] -> ReactElementM handler a -> ReactElementM handler a
touchableNativeFeedback = foreign_ "TouchableNativeFeedback" . fmap props

background :: BackgroundPropType -> Props TouchableNativeFeedback handler
background = prop "background"

useForeground :: Bool -> Props TouchableNativeFeedback handler
useForeground = prop "useForeground"



-- TouchableWithoutFeedbackProps:

hitSlop                    = TouchableWithoutFeedbackProps.hitSlop @TouchableNativeFeedback
accessibilityComponentType = TouchableWithoutFeedbackProps.accessibilityComponentType @TouchableNativeFeedback
accessible                 = TouchableWithoutFeedbackProps.accessible @TouchableNativeFeedback
delayLongPress             = TouchableWithoutFeedbackProps.delayLongPress @TouchableNativeFeedback
delayPressIn               = TouchableWithoutFeedbackProps.delayPressIn @TouchableNativeFeedback
delayPressOut              = TouchableWithoutFeedbackProps.delayPressOut @TouchableNativeFeedback
disabled                   = TouchableWithoutFeedbackProps.disabled @TouchableNativeFeedback
accessibilityTraits        = TouchableWithoutFeedbackProps.accessibilityTraits @TouchableNativeFeedback
onLayout                   = TouchableWithoutFeedbackProps.onLayout @TouchableNativeFeedback
onLongPress                = TouchableWithoutFeedbackProps.onLongPress @TouchableNativeFeedback
onPress                    = TouchableWithoutFeedbackProps.onPress @TouchableNativeFeedback
onPressIn                  = TouchableWithoutFeedbackProps.onPressIn @TouchableNativeFeedback
onPressOut                 = TouchableWithoutFeedbackProps.onPressOut @TouchableNativeFeedback
pressRetentionOffset       = TouchableWithoutFeedbackProps.pressRetentionOffset @TouchableNativeFeedback


-- TODO: methods
