{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.MaskedViewIOS (
    module React.Flux.Rn.Components.MaskedViewIOS,
    ReactViewRef,
    ViewProps.AccessibilityComponentTypes(..),
    ViewProps.AccessibilityLiveRegion(..),
    ViewProps.AccessibilityTraits(..),
    ViewProps.ImportantForAccessibility(..),
    ViewProps.Inset(Inset),
    ViewProps.OnLayout(OnLayout),
    ViewProps.PointerEvents(..),
    ViewProps.SyntheticTouchEvent(SyntheticTouchEvent)
) where

import           Data.Typeable                 (Typeable)
import           Prelude                       (fmap)
import           Prelude                       ((.))
import           React.Flux                    (ReactElementM, foreign_)
import           React.Flux.Rn.Events          (view0)
import           React.Flux.Rn.Properties      (Props, props)
import qualified React.Flux.Rn.Props.ViewProps as ViewProps
import           React.Flux.Rn.Types           (ReactViewRef)

data MaskedViewIOS
maskedViewIOS :: [Props MaskedViewIOS handler] -> ReactElementM handler a -> ReactElementM handler a
maskedViewIOS = foreign_ "MaskedViewIOS" . fmap props

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

