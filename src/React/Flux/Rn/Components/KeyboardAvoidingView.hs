{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.KeyboardAvoidingView (
    module React.Flux.Rn.Components.KeyboardAvoidingView,
    Behavior(..),
    ViewProps.AccessibilityComponentTypes(..),
    ViewProps.AccessibilityLiveRegion(..),
    ViewProps.AccessibilityTraits(..),
    ViewProps.ImportantForAccessibility(..),
    ViewProps.Inset(Inset),
    ViewProps.OnLayout(OnLayout),
    ViewProps.PointerEvents(..),
    ViewProps.SyntheticTouchEvent(SyntheticTouchEvent)
) where

import           Numeric.Natural               (Natural)
import           Prelude                       ((.))
import           Prelude                       (fmap)
import           React.Flux                    (ReactElementM, foreign_)
import           React.Flux.Rn.Components.View (View)
import           React.Flux.Rn.Properties      (Props, Styles, nestedProp, prop,
                                                props)
import qualified React.Flux.Rn.Props.ViewProps as ViewProps
import           React.Flux.Rn.Types           (Behavior (..))

data KeyboardAvoidingView
keyboardAvoidingView :: [Props KeyboardAvoidingView handler] -> ReactElementM handler a -> ReactElementM handler a
keyboardAvoidingView = foreign_ "KeyboardAvoidingView" . fmap props

-- Required
keyboardVerticalOffset :: Natural -> Props KeyboardAvoidingView handler
keyboardVerticalOffset = prop "keyboardVerticalOffset"

behavior :: Behavior -> Props KeyboardAvoidingView handler
behavior = prop "behavior"

contentContainerStyle :: [Styles View handler] -> Props KeyboardAvoidingView handler
contentContainerStyle = nestedProp "contentContainerStyle"

-- ViewProps:

onStartShouldSetResponder        = ViewProps.onStartShouldSetResponder @KeyboardAvoidingView
accessibilityLabel               = ViewProps.accessibilityLabel @KeyboardAvoidingView
hitSlop                          = ViewProps.hitSlop @KeyboardAvoidingView
nativeID                         = ViewProps.nativeID @KeyboardAvoidingView
onAccessibilityTap               = ViewProps.onAccessibilityTap @KeyboardAvoidingView
onLayout                         = ViewProps.onLayout @KeyboardAvoidingView
onMagicTap                       = ViewProps.onMagicTap @KeyboardAvoidingView
onMoveShouldSetResponder         = ViewProps.onMoveShouldSetResponder @KeyboardAvoidingView
onMoveShouldSetResponderCapture  = ViewProps.onMoveShouldSetResponderCapture @KeyboardAvoidingView
onResponderGrant                 = ViewProps.onResponderGrant @KeyboardAvoidingView
onResponderMove                  = ViewProps.onResponderMove @KeyboardAvoidingView
onResponderReject                = ViewProps.onResponderReject @KeyboardAvoidingView
onResponderRelease               = ViewProps.onResponderRelease @KeyboardAvoidingView
onResponderTerminate             = ViewProps.onResponderTerminate @KeyboardAvoidingView
onResponderTerminationRequest    = ViewProps.onResponderTerminationRequest @KeyboardAvoidingView
accessible                       = ViewProps.accessible @KeyboardAvoidingView
onStartShouldSetResponderCapture = ViewProps.onStartShouldSetResponderCapture @KeyboardAvoidingView
pointerEvents                    = ViewProps.pointerEvents @KeyboardAvoidingView
removeClippedSubviews            = ViewProps.removeClippedSubviews @KeyboardAvoidingView
style                            = ViewProps.style @KeyboardAvoidingView
testID                           = ViewProps.testID @KeyboardAvoidingView
accessibilityComponentType       = ViewProps.accessibilityComponentType @KeyboardAvoidingView
accessibilityLiveRegion          = ViewProps.accessibilityLiveRegion @KeyboardAvoidingView
collapsable                      = ViewProps.collapsable @KeyboardAvoidingView
importantForAccessibility        = ViewProps.importantForAccessibility @KeyboardAvoidingView
needsOffscreenAlphaCompositing   = ViewProps.needsOffscreenAlphaCompositing @KeyboardAvoidingView
renderToHardwareTextureAndroid   = ViewProps.renderToHardwareTextureAndroid @KeyboardAvoidingView
accessibilityTraits              = ViewProps.accessibilityTraits @KeyboardAvoidingView
accessibilityViewIsModal         = ViewProps.accessibilityViewIsModal @KeyboardAvoidingView
shouldRasterizeIOS               = ViewProps.shouldRasterizeIOS @KeyboardAvoidingView


-- TODO: methods
