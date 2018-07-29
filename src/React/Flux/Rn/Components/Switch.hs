{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.Switch (
    module React.Flux.Rn.Components.Switch,
    Color(..),
    ViewProps.AccessibilityComponentTypes(..),
    ViewProps.AccessibilityLiveRegion(..),
    ViewProps.AccessibilityTraits(..),
    ViewProps.ImportantForAccessibility(..),
    ViewProps.Inset(Inset),
    ViewProps.OnLayout(OnLayout),
    ViewProps.PointerEvents(..),
    ViewProps.SyntheticTouchEvent(SyntheticTouchEvent)
) where

import           Prelude                       (Bool)
import           React.Flux.Rn.Components      (Props, Switch, prop)
import           React.Flux.Rn.Events          (EventHandlerType, on1)
import qualified React.Flux.Rn.Props.ViewProps as ViewProps
import           React.Flux.Rn.Types           (Color (..))

disabled :: Bool -> Props Switch handler
disabled = prop "disabled"

onTintColor :: Color -> Props Switch handler
onTintColor = prop "onTintColor"

onValueChange :: (Bool -> EventHandlerType handler) -> Props Switch handler
onValueChange = on1 "onValueChange"

thumbTintColor :: Color -> Props Switch handler
thumbTintColor = prop "thumbTintColor"

tintColor :: Color -> Props Switch handler
tintColor = prop "tintColor"

value :: Bool -> Props Switch handler
value = prop "value"

-- ViewProps:

onStartShouldSetResponder        = ViewProps.onStartShouldSetResponder @Switch
accessibilityLabel               = ViewProps.accessibilityLabel @Switch
hitSlop                          = ViewProps.hitSlop @Switch
nativeID                         = ViewProps.nativeID @Switch
onAccessibilityTap               = ViewProps.onAccessibilityTap @Switch
onLayout                         = ViewProps.onLayout @Switch
onMagicTap                       = ViewProps.onMagicTap @Switch
onMoveShouldSetResponder         = ViewProps.onMoveShouldSetResponder @Switch
onMoveShouldSetResponderCapture  = ViewProps.onMoveShouldSetResponderCapture @Switch
onResponderGrant                 = ViewProps.onResponderGrant @Switch
onResponderMove                  = ViewProps.onResponderMove @Switch
onResponderReject                = ViewProps.onResponderReject @Switch
onResponderRelease               = ViewProps.onResponderRelease @Switch
onResponderTerminate             = ViewProps.onResponderTerminate @Switch
onResponderTerminationRequest    = ViewProps.onResponderTerminationRequest @Switch
accessible                       = ViewProps.accessible @Switch
onStartShouldSetResponderCapture = ViewProps.onStartShouldSetResponderCapture @Switch
pointerEvents                    = ViewProps.pointerEvents @Switch
removeClippedSubviews            = ViewProps.removeClippedSubviews @Switch
style                            = ViewProps.style @Switch
testID                           = ViewProps.testID @Switch
accessibilityComponentType       = ViewProps.accessibilityComponentType @Switch
accessibilityLiveRegion          = ViewProps.accessibilityLiveRegion @Switch
collapsable                      = ViewProps.collapsable @Switch
importantForAccessibility        = ViewProps.importantForAccessibility @Switch
needsOffscreenAlphaCompositing   = ViewProps.needsOffscreenAlphaCompositing @Switch
renderToHardwareTextureAndroid   = ViewProps.renderToHardwareTextureAndroid @Switch
accessibilityTraits              = ViewProps.accessibilityTraits @Switch
accessibilityViewIsModal         = ViewProps.accessibilityViewIsModal @Switch
shouldRasterizeIOS               = ViewProps.shouldRasterizeIOS @Switch

