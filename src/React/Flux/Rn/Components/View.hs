{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Views.View where

import           Prelude                  (Bool, String)
import           React.Flux
import           React.Flux.Rn.Components (Props, View, prop)
import           React.Flux.Rn.Events
import qualified React.Flux.Rn.Props.View as ViewProps
import           React.Flux.Rn.Types

-- ViewProps:

onStartShouldSetResponder        = ViewProps.onStartShouldSetResponder @View
accessibilityLabel               = ViewProps.accessibilityLabel @View
hitSlop                          = ViewProps.hitSlop @View
nativeID                         = ViewProps.nativeID @View
onAccessibilityTap               = ViewProps.onAccessibilityTap @View
onLayout                         = ViewProps.onLayout @View
onMagicTap                       = ViewProps.onMagicTap @View
onMoveShouldSetResponder         = ViewProps.onMoveShouldSetResponder @View
onMoveShouldSetResponderCapture  = ViewProps.onMoveShouldSetResponderCapture @View
onResponderGrant                 = ViewProps.onResponderGrant @View
onResponderMove                  = ViewProps.onResponderMove @View
onResponderReject                = ViewProps.onResponderReject @View
onResponderRelease               = ViewProps.onResponderRelease @View
onResponderTerminate             = ViewProps.onResponderTerminate @View
onResponderTerminationRequest    = ViewProps.onResponderTerminationRequest @View
accessible                       = ViewProps.accessible @View
onStartShouldSetResponderCapture = ViewProps.onStartShouldSetResponderCapture @View
pointerEvents                    = ViewProps.pointerEvents @View
removeClippedSubviews            = ViewProps.removeClippedSubviews @View
style                            = ViewProps.style @View
testID                           = ViewProps.testID @View
accessibilityComponentType       = ViewProps.accessibilityComponentType @View
accessibilityLiveRegion          = ViewProps.accessibilityLiveRegion @View
collapsable                      = ViewProps.collapsable @View
importantForAccessibility        = ViewProps.importantForAccessibility @View
needsOffscreenAlphaCompositing   = ViewProps.needsOffscreenAlphaCompositing @View
renderToHardwareTextureAndroid   = ViewProps.renderToHardwareTextureAndroid @View
accessibilityTraits              = ViewProps.accessibilityTraits @View
accessibilityViewIsModal         = ViewProps.accessibilityViewIsModal @View
shouldRasterizeIOS               = ViewProps.shouldRasterizeIOS @View
