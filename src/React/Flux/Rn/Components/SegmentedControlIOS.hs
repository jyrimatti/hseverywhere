{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.SegmentedControlIOS where

import           GHCJS.Marshal                 (FromJSVal)
import           Numeric.Natural
import           Prelude                       (Bool, String)
import           React.Flux
import           React.Flux.Rn.Components      (Props, SegmentedControlIOS,
                                                prop)
import           React.Flux.Rn.Events
import qualified React.Flux.Rn.Props.ViewProps as ViewProps
import           React.Flux.Rn.Types

enabled :: Bool -> Props SegmentedControlIOS handler
enabled = prop "enabled"

momentary :: Bool -> Props SegmentedControlIOS handler
momentary = prop "momentary"

onChange :: (OnChange -> EventHandlerType handler) -> Props SegmentedControlIOS handler
onChange = on1 "onChange"

onValueChange :: FromJSVal value => (value -> EventHandlerType handler) -> Props SegmentedControlIOS handler
onValueChange = on1 "onValueChange"

selectedIndex :: Natural -> Props SegmentedControlIOS handler
selectedIndex = prop "selectedIndex"

tintColor :: Color -> Props SegmentedControlIOS handler
tintColor = prop "tintColor"

values :: [String] -> Props SegmentedControlIOS handler
values = prop "values"

-- ViewProps:

onStartShouldSetResponder        = ViewProps.onStartShouldSetResponder @SegmentedControlIOS
accessibilityLabel               = ViewProps.accessibilityLabel @SegmentedControlIOS
hitSlop                          = ViewProps.hitSlop @SegmentedControlIOS
nativeID                         = ViewProps.nativeID @SegmentedControlIOS
onAccessibilityTap               = ViewProps.onAccessibilityTap @SegmentedControlIOS
onLayout                         = ViewProps.onLayout @SegmentedControlIOS
onMagicTap                       = ViewProps.onMagicTap @SegmentedControlIOS
onMoveShouldSetResponder         = ViewProps.onMoveShouldSetResponder @SegmentedControlIOS
onMoveShouldSetResponderCapture  = ViewProps.onMoveShouldSetResponderCapture @SegmentedControlIOS
onResponderGrant                 = ViewProps.onResponderGrant @SegmentedControlIOS
onResponderMove                  = ViewProps.onResponderMove @SegmentedControlIOS
onResponderReject                = ViewProps.onResponderReject @SegmentedControlIOS
onResponderRelease               = ViewProps.onResponderRelease @SegmentedControlIOS
onResponderTerminate             = ViewProps.onResponderTerminate @SegmentedControlIOS
onResponderTerminationRequest    = ViewProps.onResponderTerminationRequest @SegmentedControlIOS
accessible                       = ViewProps.accessible @SegmentedControlIOS
onStartShouldSetResponderCapture = ViewProps.onStartShouldSetResponderCapture @SegmentedControlIOS
pointerEvents                    = ViewProps.pointerEvents @SegmentedControlIOS
removeClippedSubviews            = ViewProps.removeClippedSubviews @SegmentedControlIOS
style                            = ViewProps.style @SegmentedControlIOS
testID                           = ViewProps.testID @SegmentedControlIOS
accessibilityComponentType       = ViewProps.accessibilityComponentType @SegmentedControlIOS
accessibilityLiveRegion          = ViewProps.accessibilityLiveRegion @SegmentedControlIOS
collapsable                      = ViewProps.collapsable @SegmentedControlIOS
importantForAccessibility        = ViewProps.importantForAccessibility @SegmentedControlIOS
needsOffscreenAlphaCompositing   = ViewProps.needsOffscreenAlphaCompositing @SegmentedControlIOS
renderToHardwareTextureAndroid   = ViewProps.renderToHardwareTextureAndroid @SegmentedControlIOS
accessibilityTraits              = ViewProps.accessibilityTraits @SegmentedControlIOS
accessibilityViewIsModal         = ViewProps.accessibilityViewIsModal @SegmentedControlIOS
shouldRasterizeIOS               = ViewProps.shouldRasterizeIOS @SegmentedControlIOS


-- TODO: methods
