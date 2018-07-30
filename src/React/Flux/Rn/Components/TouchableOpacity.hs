{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.TouchableOpacity (
    module React.Flux.Rn.Components.TouchableOpacity,
    TvParallaxProperties(TvParallaxProperties),
    UnitInterval,
    TouchableWithoutFeedbackProps.AccessibilityComponentTypes(..),
    TouchableWithoutFeedbackProps.AccessibilityTraits(..),
    TouchableWithoutFeedbackProps.Inset(Inset),
    TouchableWithoutFeedbackProps.OnLayout(OnLayout)
) where

import           Prelude                                           (Bool)
import           Prelude                                           (fmap)
import           Prelude                                           ((.))
import           React.Flux                                        (ReactElementM,
                                                                    foreign_)
import           React.Flux.Rn.Properties                          (Props, prop,
                                                                    props)
import qualified React.Flux.Rn.Props.TouchableWithoutFeedbackProps as TouchableWithoutFeedbackProps
import           React.Flux.Rn.Types                               (TvParallaxProperties (TvParallaxProperties),
                                                                    UnitInterval)

data TouchableOpacity
touchableOpacity :: [Props TouchableOpacity handler] -> ReactElementM handler a -> ReactElementM handler a
touchableOpacity = foreign_ "TouchableOpacity" . fmap props

activeOpacity :: UnitInterval -> Props TouchableOpacity handler
activeOpacity = prop "activeOpacity"

tvParallaxProperties :: TvParallaxProperties -> Props TouchableOpacity handler
tvParallaxProperties = prop "tvParallaxProperties"

-- Platform: IOS
hasTVPreferredFocus :: Bool -> Props TouchableOpacity handler
hasTVPreferredFocus = prop "hasTVPreferredFocus"


-- TouchableWithoutFeedbackProps:

hitSlop                    = TouchableWithoutFeedbackProps.hitSlop @TouchableOpacity
accessibilityComponentType = TouchableWithoutFeedbackProps.accessibilityComponentType @TouchableOpacity
accessible                 = TouchableWithoutFeedbackProps.accessible @TouchableOpacity
delayLongPress             = TouchableWithoutFeedbackProps.delayLongPress @TouchableOpacity
delayPressIn               = TouchableWithoutFeedbackProps.delayPressIn @TouchableOpacity
delayPressOut              = TouchableWithoutFeedbackProps.delayPressOut @TouchableOpacity
disabled                   = TouchableWithoutFeedbackProps.disabled @TouchableOpacity
accessibilityTraits        = TouchableWithoutFeedbackProps.accessibilityTraits @TouchableOpacity
onLayout                   = TouchableWithoutFeedbackProps.onLayout @TouchableOpacity
onLongPress                = TouchableWithoutFeedbackProps.onLongPress @TouchableOpacity
onPress                    = TouchableWithoutFeedbackProps.onPress @TouchableOpacity
onPressIn                  = TouchableWithoutFeedbackProps.onPressIn @TouchableOpacity
onPressOut                 = TouchableWithoutFeedbackProps.onPressOut @TouchableOpacity
pressRetentionOffset       = TouchableWithoutFeedbackProps.pressRetentionOffset @TouchableOpacity

-- TODO: methods
