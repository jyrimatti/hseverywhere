{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.ActivityIndicator where

import           Prelude                       (Bool)
import           React.Flux.Rn.Components      (ActivityIndicator, Props, prop)
import qualified React.Flux.Rn.Props.ViewProps as ViewProps
import           React.Flux.Rn.Types

animating :: Bool -> Props ActivityIndicator handler
animating = prop "animating"

color :: Color -> Props ActivityIndicator handler
color = prop "color"

size :: ActivityIndicatorSize -> Props ActivityIndicator handler
size = prop "size"

hidesWhenStopped :: Bool -> Props ActivityIndicator handler
hidesWhenStopped = prop "hidesWhenStopped"

-- ViewProps:

onStartShouldSetResponder        = ViewProps.onStartShouldSetResponder @ActivityIndicator
accessibilityLabel               = ViewProps.accessibilityLabel @ActivityIndicator
hitSlop                          = ViewProps.hitSlop @ActivityIndicator
nativeID                         = ViewProps.nativeID @ActivityIndicator
onAccessibilityTap               = ViewProps.onAccessibilityTap @ActivityIndicator
onLayout                         = ViewProps.onLayout @ActivityIndicator
onMagicTap                       = ViewProps.onMagicTap @ActivityIndicator
onMoveShouldSetResponder         = ViewProps.onMoveShouldSetResponder @ActivityIndicator
onMoveShouldSetResponderCapture  = ViewProps.onMoveShouldSetResponderCapture @ActivityIndicator
onResponderGrant                 = ViewProps.onResponderGrant @ActivityIndicator
onResponderMove                  = ViewProps.onResponderMove @ActivityIndicator
onResponderReject                = ViewProps.onResponderReject @ActivityIndicator
onResponderRelease               = ViewProps.onResponderRelease @ActivityIndicator
onResponderTerminate             = ViewProps.onResponderTerminate @ActivityIndicator
onResponderTerminationRequest    = ViewProps.onResponderTerminationRequest @ActivityIndicator
accessible                       = ViewProps.accessible @ActivityIndicator
onStartShouldSetResponderCapture = ViewProps.onStartShouldSetResponderCapture @ActivityIndicator
pointerEvents                    = ViewProps.pointerEvents @ActivityIndicator
removeClippedSubviews            = ViewProps.removeClippedSubviews @ActivityIndicator
style                            = ViewProps.style @ActivityIndicator
testID                           = ViewProps.testID @ActivityIndicator
accessibilityComponentType       = ViewProps.accessibilityComponentType @ActivityIndicator
accessibilityLiveRegion          = ViewProps.accessibilityLiveRegion @ActivityIndicator
collapsable                      = ViewProps.collapsable @ActivityIndicator
importantForAccessibility        = ViewProps.importantForAccessibility @ActivityIndicator
needsOffscreenAlphaCompositing   = ViewProps.needsOffscreenAlphaCompositing @ActivityIndicator
renderToHardwareTextureAndroid   = ViewProps.renderToHardwareTextureAndroid @ActivityIndicator
accessibilityTraits              = ViewProps.accessibilityTraits @ActivityIndicator
accessibilityViewIsModal         = ViewProps.accessibilityViewIsModal @ActivityIndicator
shouldRasterizeIOS               = ViewProps.shouldRasterizeIOS @ActivityIndicator

