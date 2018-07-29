{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Props.ViewProps (
    module React.Flux.Rn.Props.ViewProps,
    AccessibilityComponentTypes(..),
    AccessibilityLiveRegion(..),
    AccessibilityTraits(..),
    ImportantForAccessibility(..), Inset(Inset),
    OnLayout(OnLayout), PointerEvents(..),
    SyntheticTouchEvent(SyntheticTouchEvent)
) where

import           Prelude                  (Bool, String)
import           React.Flux.Rn.Components (Props, Styles, View, nestedProp,
                                           prop)
import           React.Flux.Rn.Events     (EventHandlerType, on0, on1, ret1)
import           React.Flux.Rn.Types      (AccessibilityComponentTypes (..),
                                           AccessibilityLiveRegion (..),
                                           AccessibilityTraits (..),
                                           ImportantForAccessibility (..),
                                           Inset (Inset), OnLayout (OnLayout),
                                           PointerEvents (..),
                                           SyntheticTouchEvent (SyntheticTouchEvent))

onStartShouldSetResponder :: (SyntheticTouchEvent -> Bool) -> Props component handler
onStartShouldSetResponder = ret1 "onStartShouldSetResponder"

accessibilityLabel :: String -> Props component handler
accessibilityLabel = prop "accessibilityLabel"

hitSlop :: Inset -> Props component handler
hitSlop = prop "hitSlop"

nativeID :: String -> Props component handler
nativeID = prop "nativeID"

onAccessibilityTap :: forall component handler. EventHandlerType handler -> Props component handler
onAccessibilityTap = on0 "onAccessibilityTap"

onLayout :: forall component handler. (OnLayout -> EventHandlerType handler) -> Props component handler
onLayout = on1 "onLayout"

onMagicTap :: forall component handler. EventHandlerType handler -> Props component handler
onMagicTap = on0 "onMagicTap"

onMoveShouldSetResponder :: (SyntheticTouchEvent -> Bool) -> Props component handler
onMoveShouldSetResponder = ret1 "onMoveShouldSetResponder"

onMoveShouldSetResponderCapture :: (SyntheticTouchEvent -> Bool) -> Props component handler
onMoveShouldSetResponderCapture = ret1 "onMoveShouldSetResponderCapture"

onResponderGrant :: forall component handler. (SyntheticTouchEvent -> EventHandlerType handler) -> Props component handler
onResponderGrant = on1 "onResponderGrant"

onResponderMove :: forall component handler. (SyntheticTouchEvent -> EventHandlerType handler) -> Props component handler
onResponderMove = on1 "onResponderMove"

onResponderReject :: forall component handler. (SyntheticTouchEvent -> EventHandlerType handler) -> Props component handler
onResponderReject = on1 "onResponderReject"

onResponderRelease :: forall component handler. (SyntheticTouchEvent -> EventHandlerType handler) -> Props component handler
onResponderRelease = on1 "onResponderRelease"

onResponderTerminate :: forall component handler. (SyntheticTouchEvent -> EventHandlerType handler) -> Props component handler
onResponderTerminate = on1 "onResponderTerminate"

onResponderTerminationRequest :: forall component handler. (SyntheticTouchEvent -> EventHandlerType handler) -> Props component handler
onResponderTerminationRequest = on1 "onResponderTerminationRequest"

accessible :: Bool -> Props component handler
accessible = prop "accessible"

onStartShouldSetResponderCapture :: (SyntheticTouchEvent -> Bool) -> Props component handler
onStartShouldSetResponderCapture = ret1 "onStartShouldSetResponderCapture"

pointerEvents :: PointerEvents -> Props component handler
pointerEvents = prop "pointerEvents"

removeClippedSubviews :: Bool -> Props component handler
removeClippedSubviews = prop "removeClippedSubviews"

style :: forall component handler. [Styles View handler] -> Props component handler
style = nestedProp "style"

testID :: String -> Props component handler
testID = prop "testID"

-- Platform: Android
accessibilityComponentType :: AccessibilityComponentTypes -> Props component handler
accessibilityComponentType = prop "accessibilityComponentType"

-- Platform: Android
accessibilityLiveRegion :: AccessibilityLiveRegion -> Props component handler
accessibilityLiveRegion = prop "accessibilityLiveRegion"

-- Platform: Android
collapsable :: Bool -> Props component handler
collapsable = prop "collapsable"

-- Platform: Android
importantForAccessibility :: ImportantForAccessibility -> Props component handler
importantForAccessibility = prop "importantForAccessibility"

-- Platform: Android
needsOffscreenAlphaCompositing :: Bool -> Props component handler
needsOffscreenAlphaCompositing = prop "needsOffscreenAlphaCompositing"

-- Platform: Android
renderToHardwareTextureAndroid :: Bool -> Props component handler
renderToHardwareTextureAndroid = prop "renderToHardwareTextureAndroid"

-- Platform: IOS
accessibilityTraits :: AccessibilityTraits -> Props component handler
accessibilityTraits = prop "accessibilityTraits"

-- Platform: IOS
accessibilityViewIsModal :: Bool -> Props component handler
accessibilityViewIsModal = prop "accessibilityViewIsModal"

-- Platform: IOS
shouldRasterizeIOS :: Bool -> Props component handler
shouldRasterizeIOS = prop "shouldRasterizeIOS"
