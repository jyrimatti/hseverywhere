{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.Slider (
    module React.Flux.Rn.Components.Slider,
    Color(..), ImageSource(..),
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
import           Prelude                       (Bool, Int)
import           React.Flux.Rn.Components      (Props, Slider, prop)
import           React.Flux.Rn.Events          (EventHandlerType, on1)
import qualified React.Flux.Rn.Props.ViewProps as ViewProps
import           React.Flux.Rn.Types           (Color (..), ImageSource (..))

disabled :: Bool -> Props Slider handler
disabled = prop "disabled"

maximumValue :: Int -> Props Slider handler
maximumValue = prop "maximumValue"

minimumTrackTintColor :: Color -> Props Slider handler
minimumTrackTintColor = prop "minimumTrackTintColor"

minimumValue :: Int -> Props Slider handler
minimumValue = prop "minimumValue"

onSlidingComplete :: (Int -> EventHandlerType handler) -> Props Slider handler
onSlidingComplete = on1 "onSlidingComplete"

onValueChange :: (Int -> EventHandlerType handler) -> Props Slider handler
onValueChange = on1 "onValueChange"

step :: Natural -> Props Slider handler
step = prop "step"

maximumTrackTintColor :: Color -> Props Slider handler
maximumTrackTintColor = prop "maximumTrackTintColor"

value :: Int -> Props Slider handler
value = prop "value"

-- Platform: Android
thumbTintColor :: Color -> Props Slider handler
thumbTintColor = prop "thumbTintColor"

-- Platform: IOS
maximumTrackImage :: ImageSource -> Props Slider handler
maximumTrackImage = prop "maximumTrackImage"

-- Platform: IOS
minimumTrackImage :: ImageSource -> Props Slider handler
minimumTrackImage = prop "minimumTrackImage"

-- Platform: IOS
thumbImage :: ImageSource -> Props Slider handler
thumbImage = prop "thumbImage"

trackImage :: ImageSource -> Props Slider handler
trackImage = prop "trackImage"

-- ViewProps:

onStartShouldSetResponder        = ViewProps.onStartShouldSetResponder @Slider
accessibilityLabel               = ViewProps.accessibilityLabel @Slider
hitSlop                          = ViewProps.hitSlop @Slider
nativeID                         = ViewProps.nativeID @Slider
onAccessibilityTap               = ViewProps.onAccessibilityTap @Slider
onLayout                         = ViewProps.onLayout @Slider
onMagicTap                       = ViewProps.onMagicTap @Slider
onMoveShouldSetResponder         = ViewProps.onMoveShouldSetResponder @Slider
onMoveShouldSetResponderCapture  = ViewProps.onMoveShouldSetResponderCapture @Slider
onResponderGrant                 = ViewProps.onResponderGrant @Slider
onResponderMove                  = ViewProps.onResponderMove @Slider
onResponderReject                = ViewProps.onResponderReject @Slider
onResponderRelease               = ViewProps.onResponderRelease @Slider
onResponderTerminate             = ViewProps.onResponderTerminate @Slider
onResponderTerminationRequest    = ViewProps.onResponderTerminationRequest @Slider
accessible                       = ViewProps.accessible @Slider
onStartShouldSetResponderCapture = ViewProps.onStartShouldSetResponderCapture @Slider
pointerEvents                    = ViewProps.pointerEvents @Slider
removeClippedSubviews            = ViewProps.removeClippedSubviews @Slider
style                            = ViewProps.style @Slider
testID                           = ViewProps.testID @Slider
accessibilityComponentType       = ViewProps.accessibilityComponentType @Slider
accessibilityLiveRegion          = ViewProps.accessibilityLiveRegion @Slider
collapsable                      = ViewProps.collapsable @Slider
importantForAccessibility        = ViewProps.importantForAccessibility @Slider
needsOffscreenAlphaCompositing   = ViewProps.needsOffscreenAlphaCompositing @Slider
renderToHardwareTextureAndroid   = ViewProps.renderToHardwareTextureAndroid @Slider
accessibilityTraits              = ViewProps.accessibilityTraits @Slider
accessibilityViewIsModal         = ViewProps.accessibilityViewIsModal @Slider
shouldRasterizeIOS               = ViewProps.shouldRasterizeIOS @Slider

