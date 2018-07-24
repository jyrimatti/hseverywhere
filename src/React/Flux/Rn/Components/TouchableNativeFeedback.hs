{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.TouchableNativeFeedback where

import           GHC.Generics
import           GHCJS.Marshal                                     (ToJSVal (..))
import           Numeric.Natural
import           Prelude                                           (Bool)
import           React.Flux
import           React.Flux.Rn.Components                          (Props, TouchableNativeFeedback,
                                                                    prop)
import qualified React.Flux.Rn.Props.TouchableWithoutFeedbackProps as TouchableWithoutFeedbackProps
import           React.Flux.Rn.Types

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
