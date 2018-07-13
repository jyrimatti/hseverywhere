{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.SnapshotViewIOS where

import           Prelude                  (String)
import           React.Flux
import           React.Flux.Rn.Components (Props, SnapshotViewIOS, prop)
import           React.Flux.Rn.Events
import qualified React.Flux.Rn.Props.View as ViewProps

onSnapshotReady :: EventHandlerType handler -> Props SnapshotViewIOS handler
onSnapshotReady = on0 "onSnapshotReady"

testIdentifier :: String -> Props SnapshotViewIOS handler
testIdentifier = prop "testIdentifier"

-- ViewProps:

onStartShouldSetResponder        = ViewProps.onStartShouldSetResponder @SnapshotViewIOS
accessibilityLabel               = ViewProps.accessibilityLabel @SnapshotViewIOS
hitSlop                          = ViewProps.hitSlop @SnapshotViewIOS
nativeID                         = ViewProps.nativeID @SnapshotViewIOS
onAccessibilityTap               = ViewProps.onAccessibilityTap @SnapshotViewIOS
onLayout                         = ViewProps.onLayout @SnapshotViewIOS
onMagicTap                       = ViewProps.onMagicTap @SnapshotViewIOS
onMoveShouldSetResponder         = ViewProps.onMoveShouldSetResponder @SnapshotViewIOS
onMoveShouldSetResponderCapture  = ViewProps.onMoveShouldSetResponderCapture @SnapshotViewIOS
onResponderGrant                 = ViewProps.onResponderGrant @SnapshotViewIOS
onResponderMove                  = ViewProps.onResponderMove @SnapshotViewIOS
onResponderReject                = ViewProps.onResponderReject @SnapshotViewIOS
onResponderRelease               = ViewProps.onResponderRelease @SnapshotViewIOS
onResponderTerminate             = ViewProps.onResponderTerminate @SnapshotViewIOS
onResponderTerminationRequest    = ViewProps.onResponderTerminationRequest @SnapshotViewIOS
accessible                       = ViewProps.accessible @SnapshotViewIOS
onStartShouldSetResponderCapture = ViewProps.onStartShouldSetResponderCapture @SnapshotViewIOS
pointerEvents                    = ViewProps.pointerEvents @SnapshotViewIOS
removeClippedSubviews            = ViewProps.removeClippedSubviews @SnapshotViewIOS
style                            = ViewProps.style @SnapshotViewIOS
testID                           = ViewProps.testID @SnapshotViewIOS
accessibilityComponentType       = ViewProps.accessibilityComponentType @SnapshotViewIOS
accessibilityLiveRegion          = ViewProps.accessibilityLiveRegion @SnapshotViewIOS
collapsable                      = ViewProps.collapsable @SnapshotViewIOS
importantForAccessibility        = ViewProps.importantForAccessibility @SnapshotViewIOS
needsOffscreenAlphaCompositing   = ViewProps.needsOffscreenAlphaCompositing @SnapshotViewIOS
renderToHardwareTextureAndroid   = ViewProps.renderToHardwareTextureAndroid @SnapshotViewIOS
accessibilityTraits              = ViewProps.accessibilityTraits @SnapshotViewIOS
accessibilityViewIsModal         = ViewProps.accessibilityViewIsModal @SnapshotViewIOS
shouldRasterizeIOS               = ViewProps.shouldRasterizeIOS @SnapshotViewIOS

