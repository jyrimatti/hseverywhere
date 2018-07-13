{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.ProgressBarAndroid where

import           Prelude                  (Bool, String)
import           React.Flux
import           React.Flux.Rn.Components (ProgressBarAndroid, Props, prop)
import qualified React.Flux.Rn.Props.View as ViewProps
import           React.Flux.Rn.Types

animating :: Bool -> Props ProgressBarAndroid handler
animating = prop "animating"

color :: Color -> Props ProgressBarAndroid handler
color = prop "color"

indeterminate :: Bool -> Props ProgressBarAndroid handler
indeterminate = prop "indeterminate"

progress :: Between0and1 -> Props ProgressBarAndroid handler
progress = prop "progress"

styleAttr :: StyleAttr -> Props ProgressBarAndroid handler
styleAttr = prop "styleAttr"

testID :: String -> Props ProgressBarAndroid handler
testID = prop "testID"

-- ViewProps:

onStartShouldSetResponder        = ViewProps.onStartShouldSetResponder @ProgressBarAndroid
accessibilityLabel               = ViewProps.accessibilityLabel @ProgressBarAndroid
hitSlop                          = ViewProps.hitSlop @ProgressBarAndroid
nativeID                         = ViewProps.nativeID @ProgressBarAndroid
onAccessibilityTap               = ViewProps.onAccessibilityTap @ProgressBarAndroid
onLayout                         = ViewProps.onLayout @ProgressBarAndroid
onMagicTap                       = ViewProps.onMagicTap @ProgressBarAndroid
onMoveShouldSetResponder         = ViewProps.onMoveShouldSetResponder @ProgressBarAndroid
onMoveShouldSetResponderCapture  = ViewProps.onMoveShouldSetResponderCapture @ProgressBarAndroid
onResponderGrant                 = ViewProps.onResponderGrant @ProgressBarAndroid
onResponderMove                  = ViewProps.onResponderMove @ProgressBarAndroid
onResponderReject                = ViewProps.onResponderReject @ProgressBarAndroid
onResponderRelease               = ViewProps.onResponderRelease @ProgressBarAndroid
onResponderTerminate             = ViewProps.onResponderTerminate @ProgressBarAndroid
onResponderTerminationRequest    = ViewProps.onResponderTerminationRequest @ProgressBarAndroid
accessible                       = ViewProps.accessible @ProgressBarAndroid
onStartShouldSetResponderCapture = ViewProps.onStartShouldSetResponderCapture @ProgressBarAndroid
pointerEvents                    = ViewProps.pointerEvents @ProgressBarAndroid
removeClippedSubviews            = ViewProps.removeClippedSubviews @ProgressBarAndroid
style                            = ViewProps.style @ProgressBarAndroid
testID                           = ViewProps.testID @ProgressBarAndroid
accessibilityComponentType       = ViewProps.accessibilityComponentType @ProgressBarAndroid
accessibilityLiveRegion          = ViewProps.accessibilityLiveRegion @ProgressBarAndroid
collapsable                      = ViewProps.collapsable @ProgressBarAndroid
importantForAccessibility        = ViewProps.importantForAccessibility @ProgressBarAndroid
needsOffscreenAlphaCompositing   = ViewProps.needsOffscreenAlphaCompositing @ProgressBarAndroid
renderToHardwareTextureAndroid   = ViewProps.renderToHardwareTextureAndroid @ProgressBarAndroid
accessibilityTraits              = ViewProps.accessibilityTraits @ProgressBarAndroid
accessibilityViewIsModal         = ViewProps.accessibilityViewIsModal @ProgressBarAndroid
shouldRasterizeIOS               = ViewProps.shouldRasterizeIOS @ProgressBarAndroid

