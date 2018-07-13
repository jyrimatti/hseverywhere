{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.SafeAreaView where

import           React.Flux.Rn.Components (Props, SafeAreaView, prop)
import qualified React.Flux.Rn.Props.View as ViewProps

-- ViewProps:

onStartShouldSetResponder        = ViewProps.onStartShouldSetResponder @SafeAreaView
accessibilityLabel               = ViewProps.accessibilityLabel @SafeAreaView
hitSlop                          = ViewProps.hitSlop @SafeAreaView
nativeID                         = ViewProps.nativeID @SafeAreaView
onAccessibilityTap               = ViewProps.onAccessibilityTap @SafeAreaView
onLayout                         = ViewProps.onLayout @SafeAreaView
onMagicTap                       = ViewProps.onMagicTap @SafeAreaView
onMoveShouldSetResponder         = ViewProps.onMoveShouldSetResponder @SafeAreaView
onMoveShouldSetResponderCapture  = ViewProps.onMoveShouldSetResponderCapture @SafeAreaView
onResponderGrant                 = ViewProps.onResponderGrant @SafeAreaView
onResponderMove                  = ViewProps.onResponderMove @SafeAreaView
onResponderReject                = ViewProps.onResponderReject @SafeAreaView
onResponderRelease               = ViewProps.onResponderRelease @SafeAreaView
onResponderTerminate             = ViewProps.onResponderTerminate @SafeAreaView
onResponderTerminationRequest    = ViewProps.onResponderTerminationRequest @SafeAreaView
accessible                       = ViewProps.accessible @SafeAreaView
onStartShouldSetResponderCapture = ViewProps.onStartShouldSetResponderCapture @SafeAreaView
pointerEvents                    = ViewProps.pointerEvents @SafeAreaView
removeClippedSubviews            = ViewProps.removeClippedSubviews @SafeAreaView
style                            = ViewProps.style @SafeAreaView
testID                           = ViewProps.testID @SafeAreaView
accessibilityComponentType       = ViewProps.accessibilityComponentType @SafeAreaView
accessibilityLiveRegion          = ViewProps.accessibilityLiveRegion @SafeAreaView
collapsable                      = ViewProps.collapsable @SafeAreaView
importantForAccessibility        = ViewProps.importantForAccessibility @SafeAreaView
needsOffscreenAlphaCompositing   = ViewProps.needsOffscreenAlphaCompositing @SafeAreaView
renderToHardwareTextureAndroid   = ViewProps.renderToHardwareTextureAndroid @SafeAreaView
accessibilityTraits              = ViewProps.accessibilityTraits @SafeAreaView
accessibilityViewIsModal         = ViewProps.accessibilityViewIsModal @SafeAreaView
shouldRasterizeIOS               = ViewProps.shouldRasterizeIOS @SafeAreaView

