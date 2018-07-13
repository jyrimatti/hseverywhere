{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Props.ScrollView where

import           Data.Typeable
import           Numeric.Natural
import           Prelude                  (Bool, Double, String)
import           React.Flux
import           React.Flux.Internal      (ReactViewRef)
import           React.Flux.Rn.Components (Props, ScrollView, prop)
import           React.Flux.Rn.Events
import qualified React.Flux.Rn.Props.View as ViewProps
import           React.Flux.Rn.Types

-- Platform: IOS
alwaysBounceVertical :: Bool -> Props component handler
alwaysBounceVertical = prop "alwaysBounceVertical"

contentContainerStyle :: ViewStyleProps -> Props component handler
contentContainerStyle = nestedProp "contentContainerStyle"

keyboardDismissMode :: KeyboardDismissMode -> Props component handler
keyboardDismissMode = prop "keyboardDismissMode"

keyboardShouldPersistTaps :: KeyboardShouldPersistTaps -> Props component handler
keyboardShouldPersistTaps = prop "keyboardShouldPersistTaps"

onContentSizeChange :: forall component handler. (Natural -> Natural -> EventHandlerType handler) -> Props component handler
onContentSizeChange = on2 "onContentSizeChange"

onMomentumScrollBegin :: forall component handler. EventHandlerType handler -> Props component handler
onMomentumScrollBegin = on0 "onMomentumScrollBegin"

onMomentumScrollEnd :: forall component handler. EventHandlerType handler -> Props component handler
onMomentumScrollEnd = on0 "onMomentumScrollEnd"

onScroll :: forall component handler. EventHandlerType handler -> Props component handler
onScroll = on0 "onScroll"

pagingEnabled :: Bool -> Props component handler
pagingEnabled = prop "pagingEnabled"

refreshControl :: Typeable props => ReactViewRef props -> Props component handler
refreshControl = view0 "refreshControl"

scrollEnabled :: Bool -> Props component handler
scrollEnabled = prop "scrollEnabled"

showsHorizontalScrollIndicator :: Bool -> Props component handler
showsHorizontalScrollIndicator = prop "showsHorizontalScrollIndicator"

showsVerticalScrollIndicator :: Bool -> Props component handler
showsVerticalScrollIndicator = prop "showsVerticalScrollIndicator"

stickyHeaderIndices :: [Natural] -> Props component handler
stickyHeaderIndices = prop "stickyHeaderIndices"

-- Platform: Android
endFillColor :: Color -> Props component handler
endFillColor = prop "endFillColor"

-- Platform: Android
overScrollMode :: OverScrollMode -> Props component handler
overScrollMode = prop "overScrollMode"

-- Platform: Android
scrollPerfTag :: String -> Props component handler
scrollPerfTag = prop "scrollPerfTag"

-- Platform: IOS
alwaysBounceHorizontal :: Bool -> Props component handler
alwaysBounceHorizontal = prop "alwaysBounceHorizontal"

horizontal :: Bool -> Props component handler
horizontal = prop "horizontal"

-- Platform: IOS
automaticallyAdjustContentInsets :: Bool -> Props component handler
automaticallyAdjustContentInsets = prop "automaticallyAdjustContentInsets"

-- Platform: IOS
bounces :: Bool -> Props component handler
bounces = prop "bounces"

-- Platform: IOS
bouncesZoom :: Bool -> Props component handler
bouncesZoom = prop "bouncesZoom"

-- Platform: IOS
canCancelContentTouches :: Bool -> Props component handler
canCancelContentTouches = prop "canCancelContentTouches"

-- Platform: IOS
centerContent :: Bool -> Props component handler
centerContent = prop "centerContent"

-- Platform: IOS
contentInset :: Inset -> Props component handler
contentInset = prop "contentInset"

-- Platform: IOS
contentInsetAdjustmentBehavior :: ContentInsetAdjustmentBehavior -> Props component handler
contentInsetAdjustmentBehavior = prop "contentInsetAdjustmentBehavior"

-- Platform: IOS
contentOffset :: ContentOffset -> Props component handler
contentOffset = prop "contentOffset"

-- Platform: IOS
decelerationRate :: DecelerationRate -> Props component handler
decelerationRate = prop "decelerationRate"

-- Platform: IOS
directionalLockEnabled :: Bool -> Props component handler
directionalLockEnabled = prop "directionalLockEnabled"

-- Platform: IOS
indicatorStyle :: IndicatorStyle -> Props component handler
indicatorStyle = prop "indicatorStyle"

-- Platform: IOS
maximumZoomScale :: Double -> Props component handler
maximumZoomScale = prop "maximumZoomScale"

-- Platform: IOS
minimumZoomScale :: Double -> Props component handler
minimumZoomScale = prop "minimumZoomScale"

-- Platform: IOS
pinchGestureEnabled :: Bool -> Props component handler
pinchGestureEnabled = prop "pinchGestureEnabled"

-- Platform: IOS
scrollEventThrottle :: Natural -> Props component handler
scrollEventThrottle = prop "scrollEventThrottle"

-- Platform: IOS
scrollIndicatorInsets :: Inset -> Props component handler
scrollIndicatorInsets = prop "scrollIndicatorInsets"

-- Platform: IOS
scrollsToTop :: Bool -> Props component handler
scrollsToTop = prop "scrollsToTop"

-- Platform: IOS
snapToAlignment :: SnapToAlignment -> Props component handler
snapToAlignment = prop "snapToAlignment"

-- Platform: IOS
snapToInterval :: Natural -> Props component handler
snapToInterval = prop "snapToInterval"

-- Platform: IOS
zoomScale :: Double -> Props component handler
zoomScale = prop "zoomScale"

-- ViewProps:

onStartShouldSetResponder        = ViewProps.onStartShouldSetResponder @ScrollView
accessibilityLabel               = ViewProps.accessibilityLabel @ScrollView
hitSlop                          = ViewProps.hitSlop @ScrollView
nativeID                         = ViewProps.nativeID @ScrollView
onAccessibilityTap               = ViewProps.onAccessibilityTap @ScrollView
onLayout                         = ViewProps.onLayout @ScrollView
onMagicTap                       = ViewProps.onMagicTap @ScrollView
onMoveShouldSetResponder         = ViewProps.onMoveShouldSetResponder @ScrollView
onMoveShouldSetResponderCapture  = ViewProps.onMoveShouldSetResponderCapture @ScrollView
onResponderGrant                 = ViewProps.onResponderGrant @ScrollView
onResponderMove                  = ViewProps.onResponderMove @ScrollView
onResponderReject                = ViewProps.onResponderReject @ScrollView
onResponderRelease               = ViewProps.onResponderRelease @ScrollView
onResponderTerminate             = ViewProps.onResponderTerminate @ScrollView
onResponderTerminationRequest    = ViewProps.onResponderTerminationRequest @ScrollView
accessible                       = ViewProps.accessible @ScrollView
onStartShouldSetResponderCapture = ViewProps.onStartShouldSetResponderCapture @ScrollView
pointerEvents                    = ViewProps.pointerEvents @ScrollView
removeClippedSubviews            = ViewProps.removeClippedSubviews @ScrollView
style                            = ViewProps.style @ScrollView
testID                           = ViewProps.testID @ScrollView
accessibilityComponentType       = ViewProps.accessibilityComponentType @ScrollView
accessibilityLiveRegion          = ViewProps.accessibilityLiveRegion @ScrollView
collapsable                      = ViewProps.collapsable @ScrollView
importantForAccessibility        = ViewProps.importantForAccessibility @ScrollView
needsOffscreenAlphaCompositing   = ViewProps.needsOffscreenAlphaCompositing @ScrollView
renderToHardwareTextureAndroid   = ViewProps.renderToHardwareTextureAndroid @ScrollView
accessibilityTraits              = ViewProps.accessibilityTraits @ScrollView
accessibilityViewIsModal         = ViewProps.accessibilityViewIsModal @ScrollView
shouldRasterizeIOS               = ViewProps.shouldRasterizeIOS @ScrollView


-- TODO: methods
