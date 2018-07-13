{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.TouchableHighlight where

import           Numeric.Natural
import           Prelude                                      (Bool, Double)
import           React.Flux
import           React.Flux.Rn.Components                     (Props, TouchableHighlight,
                                                               nestedProp, prop)
import           React.Flux.Rn.Events
import qualified React.Flux.Rn.Props.TouchableWithoutFeedback as TouchableWithoutFeedbackProps
import           React.Flux.Rn.Types

activeOpacity :: Double -> Props TouchableHighlight handler
activeOpacity = prop "activeOpacity"

onHideUnderlay :: EventHandlerType handler -> Props TouchableHighlight handler
onHideUnderlay = on0 "onHideUnderlay"

onShowUnderlay :: EventHandlerType handler -> Props TouchableHighlight handler
onShowUnderlay = on0 "onShowUnderlay"

style :: ViewStyleProps -> Props TouchableHighlight handler
style = nestedProp "style"

underlayColor :: Color -> Props TouchableHighlight handler
underlayColor = prop "underlayColor"

-- Platform: IOS
hasTVPreferredFocus :: Bool -> Props TouchableHighlight handler
hasTVPreferredFocus = prop "hasTVPreferredFocus"

-- Platform: IOS
tvParallaxProperties :: TvParallaxProperties -> Props TouchableHighlight handler
tvParallaxProperties = prop "tvParallaxProperties"


-- TouchableWithoutFeedbackProps:

hitSlop                    = TouchableWithoutFeedbackProps.hitSlop @TouchableHighlight
accessibilityComponentType = TouchableWithoutFeedbackProps.accessibilityComponentType @TouchableHighlight
accessible                 = TouchableWithoutFeedbackProps.accessible @TouchableHighlight
delayLongPress             = TouchableWithoutFeedbackProps.delayLongPress @TouchableHighlight
delayPressIn               = TouchableWithoutFeedbackProps.delayPressIn @TouchableHighlight
delayPressOut              = TouchableWithoutFeedbackProps.delayPressOut @TouchableHighlight
disabled                   = TouchableWithoutFeedbackProps.disabled @TouchableHighlight
accessibilityTraits        = TouchableWithoutFeedbackProps.accessibilityTraits @TouchableHighlight
onLayout                   = TouchableWithoutFeedbackProps.onLayout @TouchableHighlight
onLongPress                = TouchableWithoutFeedbackProps.onLongPress @TouchableHighlight
onPress                    = TouchableWithoutFeedbackProps.onPress @TouchableHighlight
onPressIn                  = TouchableWithoutFeedbackProps.onPressIn @TouchableHighlight
onPressOut                 = TouchableWithoutFeedbackProps.onPressOut @TouchableHighlight
pressRetentionOffset       = TouchableWithoutFeedbackProps.pressRetentionOffset @TouchableHighlight
