{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.ProgressViewIOS where

import           React.Flux
import           React.Flux.Rn.Components      (ProgressViewIOS, Props, prop)
import qualified React.Flux.Rn.Props.ViewProps as ViewProps
import           React.Flux.Rn.Types

progress :: UnitInterval -> Props ProgressViewIOS handler
progress = prop "progress"

progressImage :: ImageSource -> Props ProgressViewIOS handler
progressImage = prop "progressImage"

progressTintColor :: Color -> Props ProgressViewIOS handler
progressTintColor = prop "progressTintColor"

progressViewStyle :: ProgressViewStyle -> Props ProgressViewIOS handler
progressViewStyle = prop "progressViewStyle"

trackImage :: ImageSource -> Props ProgressViewIOS handler
trackImage = prop "trackImage"

trackTintColor :: Color -> Props ProgressViewIOS handler
trackTintColor = prop "trackTintColor"

-- ViewProps:

onStartShouldSetResponder        = ViewProps.onStartShouldSetResponder @ProgressViewIOS
accessibilityLabel               = ViewProps.accessibilityLabel @ProgressViewIOS
hitSlop                          = ViewProps.hitSlop @ProgressViewIOS
nativeID                         = ViewProps.nativeID @ProgressViewIOS
onAccessibilityTap               = ViewProps.onAccessibilityTap @ProgressViewIOS
onLayout                         = ViewProps.onLayout @ProgressViewIOS
onMagicTap                       = ViewProps.onMagicTap @ProgressViewIOS
onMoveShouldSetResponder         = ViewProps.onMoveShouldSetResponder @ProgressViewIOS
onMoveShouldSetResponderCapture  = ViewProps.onMoveShouldSetResponderCapture @ProgressViewIOS
onResponderGrant                 = ViewProps.onResponderGrant @ProgressViewIOS
onResponderMove                  = ViewProps.onResponderMove @ProgressViewIOS
onResponderReject                = ViewProps.onResponderReject @ProgressViewIOS
onResponderRelease               = ViewProps.onResponderRelease @ProgressViewIOS
onResponderTerminate             = ViewProps.onResponderTerminate @ProgressViewIOS
onResponderTerminationRequest    = ViewProps.onResponderTerminationRequest @ProgressViewIOS
accessible                       = ViewProps.accessible @ProgressViewIOS
onStartShouldSetResponderCapture = ViewProps.onStartShouldSetResponderCapture @ProgressViewIOS
pointerEvents                    = ViewProps.pointerEvents @ProgressViewIOS
removeClippedSubviews            = ViewProps.removeClippedSubviews @ProgressViewIOS
style                            = ViewProps.style @ProgressViewIOS
testID                           = ViewProps.testID @ProgressViewIOS
accessibilityComponentType       = ViewProps.accessibilityComponentType @ProgressViewIOS
accessibilityLiveRegion          = ViewProps.accessibilityLiveRegion @ProgressViewIOS
collapsable                      = ViewProps.collapsable @ProgressViewIOS
importantForAccessibility        = ViewProps.importantForAccessibility @ProgressViewIOS
needsOffscreenAlphaCompositing   = ViewProps.needsOffscreenAlphaCompositing @ProgressViewIOS
renderToHardwareTextureAndroid   = ViewProps.renderToHardwareTextureAndroid @ProgressViewIOS
accessibilityTraits              = ViewProps.accessibilityTraits @ProgressViewIOS
accessibilityViewIsModal         = ViewProps.accessibilityViewIsModal @ProgressViewIOS
shouldRasterizeIOS               = ViewProps.shouldRasterizeIOS @ProgressViewIOS
