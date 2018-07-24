{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.MaskedViewIOS where

import           Data.Typeable
import           React.Flux.Internal           (ReactViewRef)
import           React.Flux.Rn.Components      (MaskedViewIOS, Props)
import           React.Flux.Rn.Events
import qualified React.Flux.Rn.Props.ViewProps as ViewProps

-- Required
maskElement :: Typeable props => ReactViewRef props -> Props MaskedViewIOS handler
maskElement = view0 "maskElement"

-- ViewProps:

onStartShouldSetResponder        = ViewProps.onStartShouldSetResponder @MaskedViewIOS
accessibilityLabel               = ViewProps.accessibilityLabel @MaskedViewIOS
hitSlop                          = ViewProps.hitSlop @MaskedViewIOS
nativeID                         = ViewProps.nativeID @MaskedViewIOS
onAccessibilityTap               = ViewProps.onAccessibilityTap @MaskedViewIOS
onLayout                         = ViewProps.onLayout @MaskedViewIOS
onMagicTap                       = ViewProps.onMagicTap @MaskedViewIOS
onMoveShouldSetResponder         = ViewProps.onMoveShouldSetResponder @MaskedViewIOS
onMoveShouldSetResponderCapture  = ViewProps.onMoveShouldSetResponderCapture @MaskedViewIOS
onResponderGrant                 = ViewProps.onResponderGrant @MaskedViewIOS
onResponderMove                  = ViewProps.onResponderMove @MaskedViewIOS
onResponderReject                = ViewProps.onResponderReject @MaskedViewIOS
onResponderRelease               = ViewProps.onResponderRelease @MaskedViewIOS
onResponderTerminate             = ViewProps.onResponderTerminate @MaskedViewIOS
onResponderTerminationRequest    = ViewProps.onResponderTerminationRequest @MaskedViewIOS
accessible                       = ViewProps.accessible @MaskedViewIOS
onStartShouldSetResponderCapture = ViewProps.onStartShouldSetResponderCapture @MaskedViewIOS
pointerEvents                    = ViewProps.pointerEvents @MaskedViewIOS
removeClippedSubviews            = ViewProps.removeClippedSubviews @MaskedViewIOS
style                            = ViewProps.style @MaskedViewIOS
testID                           = ViewProps.testID @MaskedViewIOS
accessibilityComponentType       = ViewProps.accessibilityComponentType @MaskedViewIOS
accessibilityLiveRegion          = ViewProps.accessibilityLiveRegion @MaskedViewIOS
collapsable                      = ViewProps.collapsable @MaskedViewIOS
importantForAccessibility        = ViewProps.importantForAccessibility @MaskedViewIOS
needsOffscreenAlphaCompositing   = ViewProps.needsOffscreenAlphaCompositing @MaskedViewIOS
renderToHardwareTextureAndroid   = ViewProps.renderToHardwareTextureAndroid @MaskedViewIOS
accessibilityTraits              = ViewProps.accessibilityTraits @MaskedViewIOS
accessibilityViewIsModal         = ViewProps.accessibilityViewIsModal @MaskedViewIOS
shouldRasterizeIOS               = ViewProps.shouldRasterizeIOS @MaskedViewIOS

