{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.View where

import           Prelude              (Bool, String)
import           React.Flux
import           React.Flux.Rn.Events
import           React.Flux.Rn.Types

onStartShouldSetResponder :: (SyntheticTouchEvent -> Bool) -> PropertyOrHandler handler
onStartShouldSetResponder = ret1 "onStartShouldSetResponder"

accessibilityLabel :: String -> PropertyOrHandler handler
accessibilityLabel = (&=) "accessibilityLabel"

hitSlop :: Inset -> PropertyOrHandler handler
hitSlop = (&=) "hitSlop"

nativeID :: String -> PropertyOrHandler handler
nativeID = (&=) "nativeID"

onAccessibilityTap :: EventHandlerType handler -> PropertyOrHandler handler
onAccessibilityTap = on0 "onAccessibilityTap"

onLayout :: (OnLayout -> EventHandlerType handler) -> PropertyOrHandler handler
onLayout = on1 "onLayout"

onMagicTap :: EventHandlerType handler -> PropertyOrHandler handler
onMagicTap = on0 "onMagicTap"

onMoveShouldSetResponder :: (SyntheticTouchEvent -> Bool) -> PropertyOrHandler handler
onMoveShouldSetResponder = ret1 "onMoveShouldSetResponder"

onMoveShouldSetResponderCapture :: (SyntheticTouchEvent -> Bool) -> PropertyOrHandler handler
onMoveShouldSetResponderCapture = ret1 "onMoveShouldSetResponderCapture"

onResponderGrant :: (SyntheticTouchEvent -> EventHandlerType handler) -> PropertyOrHandler handler
onResponderGrant = on1 "onResponderGrant"

onResponderMove :: (SyntheticTouchEvent -> EventHandlerType handler) -> PropertyOrHandler handler
onResponderMove = on1 "onResponderMove"

onResponderReject :: (SyntheticTouchEvent -> EventHandlerType handler) -> PropertyOrHandler handler
onResponderReject = on1 "onResponderReject"

onResponderRelease :: (SyntheticTouchEvent -> EventHandlerType handler) -> PropertyOrHandler handler
onResponderRelease = on1 "onResponderRelease"

onResponderTerminate :: (SyntheticTouchEvent -> EventHandlerType handler) -> PropertyOrHandler handler
onResponderTerminate = on1 "onResponderTerminate"

onResponderTerminationRequest :: (SyntheticTouchEvent -> EventHandlerType handler) -> PropertyOrHandler handler
onResponderTerminationRequest = on1 "onResponderTerminationRequest"

accessible :: Bool -> PropertyOrHandler handler
accessible = (&=) "accessible"

onStartShouldSetResponderCapture :: (SyntheticTouchEvent -> Bool) -> PropertyOrHandler handler
onStartShouldSetResponderCapture = ret1 "onStartShouldSetResponderCapture"

pointerEvents :: PointerEvents -> PropertyOrHandler handler
pointerEvents = (&=) "pointerEvents"

removeClippedSubviews :: Bool -> PropertyOrHandler handler
removeClippedSubviews = (&=) "removeClippedSubviews"

style :: ViewStyleProps -> PropertyOrHandler handler
style = nestedProperty "style"

testID :: String -> PropertyOrHandler handler
testID = (&=) "testID"

-- Platform: Android
accessibilityComponentType :: AccessibilityComponentTypes -> PropertyOrHandler handler
accessibilityComponentType = (&=) "accessibilityComponentType"

-- Platform: Android
accessibilityLiveRegion :: AccessibilityLiveRegion -> PropertyOrHandler handler
accessibilityLiveRegion = (&=) "accessibilityLiveRegion"

-- Platform: Android
collapsable :: Bool -> PropertyOrHandler handler
collapsable = (&=) "collapsable"

-- Platform: Android
importantForAccessibility :: ImportantForAccessibility -> PropertyOrHandler handler
importantForAccessibility = (&=) "importantForAccessibility"

-- Platform: Android
needsOffscreenAlphaCompositing :: Bool -> PropertyOrHandler handler
needsOffscreenAlphaCompositing = (&=) "needsOffscreenAlphaCompositing"

-- Platform: Android
renderToHardwareTextureAndroid :: Bool -> PropertyOrHandler handler
renderToHardwareTextureAndroid = (&=) "renderToHardwareTextureAndroid"

-- Platform: IOS
accessibilityTraits :: AccessibilityTraits -> PropertyOrHandler handler
accessibilityTraits = (&=) "accessibilityTraits"

-- Platform: IOS
accessibilityViewIsModal :: Bool -> PropertyOrHandler handler
accessibilityViewIsModal = (&=) "accessibilityViewIsModal"

-- Platform: IOS
shouldRasterizeIOS :: Bool -> PropertyOrHandler handler
shouldRasterizeIOS = (&=) "shouldRasterizeIOS"
