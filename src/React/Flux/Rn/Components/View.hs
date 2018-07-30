{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.View (
    module React.Flux.Rn.Components.View,
    ViewProps.View,
    ViewProps.AccessibilityComponentTypes(..),
    ViewProps.AccessibilityLiveRegion(..),
    ViewProps.AccessibilityTraits(..),
    ViewProps.ImportantForAccessibility(..),
    ViewProps.Inset(Inset),
    ViewProps.OnLayout(OnLayout),
    ViewProps.PointerEvents(..),
    ViewProps.SyntheticTouchEvent(SyntheticTouchEvent)
) where

import           Prelude                       (fmap)
import           Prelude                       ((.))
import           React.Flux                    (ReactElementM, foreign_)
import           React.Flux.Rn.Properties      (Props, props)
import           React.Flux.Rn.Props.ViewProps (View)
import qualified React.Flux.Rn.Props.ViewProps as ViewProps

view :: [Props View handler] -> ReactElementM handler a -> ReactElementM handler a
view = foreign_ "View" . fmap props

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
