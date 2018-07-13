{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.Picker where

import           GHCJS.Marshal            (FromJSVal, ToJSVal)
import           Numeric.Natural
import           Prelude                  (Bool, String)
import           React.Flux
import           React.Flux.Rn.Components (Picker, Props, prop)
import           React.Flux.Rn.Events
import qualified React.Flux.Rn.Props.View as ViewProps
import           React.Flux.Rn.Types

onValueChange :: FromJSVal value => (value -> Natural -> EventHandlerType handler) -> Props Picker handler
onValueChange = on2 "onValueChange"

selectedValue :: ToJSVal value => value -> Props Picker handler
selectedValue = prop "selectedValue"

style :: PickerStyleProps -> Props Picker handler
style = nestedProp "style"

testID :: String -> Props Picker handler
testID = prop "testID"

-- Platform: Android
enabled :: Bool -> Props Picker handler
enabled = prop "enabled"

-- Platform: Android
mode :: PickerMode -> Props Picker handler
mode = prop "mode"

-- Platform: Android
prompt :: String -> Props Picker handler
prompt = prop "prompt"

-- Platform: IOS
itemStyle :: TextStyleProps -> Props Picker handler
itemStyle = nestedProp "itemStyle"

-- ViewProps:

onStartShouldSetResponder        = ViewProps.onStartShouldSetResponder @Picker
accessibilityLabel               = ViewProps.accessibilityLabel @Picker
hitSlop                          = ViewProps.hitSlop @Picker
nativeID                         = ViewProps.nativeID @Picker
onAccessibilityTap               = ViewProps.onAccessibilityTap @Picker
onLayout                         = ViewProps.onLayout @Picker
onMagicTap                       = ViewProps.onMagicTap @Picker
onMoveShouldSetResponder         = ViewProps.onMoveShouldSetResponder @Picker
onMoveShouldSetResponderCapture  = ViewProps.onMoveShouldSetResponderCapture @Picker
onResponderGrant                 = ViewProps.onResponderGrant @Picker
onResponderMove                  = ViewProps.onResponderMove @Picker
onResponderReject                = ViewProps.onResponderReject @Picker
onResponderRelease               = ViewProps.onResponderRelease @Picker
onResponderTerminate             = ViewProps.onResponderTerminate @Picker
onResponderTerminationRequest    = ViewProps.onResponderTerminationRequest @Picker
accessible                       = ViewProps.accessible @Picker
onStartShouldSetResponderCapture = ViewProps.onStartShouldSetResponderCapture @Picker
pointerEvents                    = ViewProps.pointerEvents @Picker
removeClippedSubviews            = ViewProps.removeClippedSubviews @Picker
style                            = ViewProps.style @Picker
testID                           = ViewProps.testID @Picker
accessibilityComponentType       = ViewProps.accessibilityComponentType @Picker
accessibilityLiveRegion          = ViewProps.accessibilityLiveRegion @Picker
collapsable                      = ViewProps.collapsable @Picker
importantForAccessibility        = ViewProps.importantForAccessibility @Picker
needsOffscreenAlphaCompositing   = ViewProps.needsOffscreenAlphaCompositing @Picker
renderToHardwareTextureAndroid   = ViewProps.renderToHardwareTextureAndroid @Picker
accessibilityTraits              = ViewProps.accessibilityTraits @Picker
accessibilityViewIsModal         = ViewProps.accessibilityViewIsModal @Picker
shouldRasterizeIOS               = ViewProps.shouldRasterizeIOS @Picker


-- TODO: methods
