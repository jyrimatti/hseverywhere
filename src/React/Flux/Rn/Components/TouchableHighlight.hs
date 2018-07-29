{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.TouchableHighlight (
    module React.Flux.Rn.Components.TouchableHighlight,
    Color(..), TvParallaxProperties(TvParallaxProperties),
    UnitInterval,
    TouchableWithoutFeedbackProps.AccessibilityComponentTypes(..),
    TouchableWithoutFeedbackProps.AccessibilityTraits(..),
    TouchableWithoutFeedbackProps.Inset(Inset),
    TouchableWithoutFeedbackProps.OnLayout(OnLayout)
) where

import           Prelude                                           (Bool)
import           React.Flux.Rn.Components                          (Props,
                                                                    Styles,
                                                                    TouchableHighlight,
                                                                    View,
                                                                    nestedProp,
                                                                    prop)
import           React.Flux.Rn.Events                              (EventHandlerType,
                                                                    on0)
import qualified React.Flux.Rn.Props.TouchableWithoutFeedbackProps as TouchableWithoutFeedbackProps
import           React.Flux.Rn.Types                               (Color (..), TvParallaxProperties (TvParallaxProperties),
                                                                    UnitInterval)

activeOpacity :: UnitInterval -> Props TouchableHighlight handler
activeOpacity = prop "activeOpacity"

onHideUnderlay :: EventHandlerType handler -> Props TouchableHighlight handler
onHideUnderlay = on0 "onHideUnderlay"

onShowUnderlay :: EventHandlerType handler -> Props TouchableHighlight handler
onShowUnderlay = on0 "onShowUnderlay"

style :: [Styles View handler] -> Props TouchableHighlight handler
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
