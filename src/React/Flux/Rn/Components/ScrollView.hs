{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.ScrollView where

import           Data.Typeable
import           Numeric.Natural
import           Prelude              (Bool, Double, String)
import           React.Flux
import           React.Flux.Internal  (ReactViewRef)
import           React.Flux.Rn.Events
import           React.Flux.Rn.Types

-- Platform: IOS
alwaysBounceVertical :: Bool -> PropertyOrHandler handler
alwaysBounceVertical = (&=) "alwaysBounceVertical"

contentContainerStyle :: ViewStyleProps -> PropertyOrHandler handler
contentContainerStyle = nestedProperty "contentContainerStyle"

keyboardDismissMode :: KeyboardDismissMode -> PropertyOrHandler handler
keyboardDismissMode = (&=) "keyboardDismissMode"

keyboardShouldPersistTaps :: KeyboardShouldPersistTaps -> PropertyOrHandler handler
keyboardShouldPersistTaps = (&=) "keyboardShouldPersistTaps"

onContentSizeChange :: (Natural -> Natural -> EventHandlerType handler) -> PropertyOrHandler handler
onContentSizeChange = on2 "onContentSizeChange"

onMomentumScrollBegin :: EventHandlerType handler -> PropertyOrHandler handler
onMomentumScrollBegin = on0 "onMomentumScrollBegin"

onMomentumScrollEnd :: EventHandlerType handler -> PropertyOrHandler handler
onMomentumScrollEnd = on0 "onMomentumScrollEnd"

onScroll :: EventHandlerType handler -> PropertyOrHandler handler
onScroll = on0 "onScroll"

pagingEnabled :: Bool -> PropertyOrHandler handler
pagingEnabled = (&=) "pagingEnabled"

refreshControl :: Typeable props => ReactViewRef props -> PropertyOrHandler handler
refreshControl = view0 "refreshControl"

removeClippedSubviews :: Bool -> PropertyOrHandler handler
removeClippedSubviews = (&=) "removeClippedSubviews"

scrollEnabled :: Bool -> PropertyOrHandler handler
scrollEnabled = (&=) "scrollEnabled"

showsHorizontalScrollIndicator :: Bool -> PropertyOrHandler handler
showsHorizontalScrollIndicator = (&=) "showsHorizontalScrollIndicator"

showsVerticalScrollIndicator :: Bool -> PropertyOrHandler handler
showsVerticalScrollIndicator = (&=) "showsVerticalScrollIndicator"

stickyHeaderIndices :: [Natural] -> PropertyOrHandler handler
stickyHeaderIndices = (&=) "stickyHeaderIndices"

-- Platform: Android
endFillColor :: Color -> PropertyOrHandler handler
endFillColor = (&=) "endFillColor"

-- Platform: Android
overScrollMode :: OverScrollMode -> PropertyOrHandler handler
overScrollMode = (&=) "overScrollMode"

-- Platform: Android
scrollPerfTag :: String -> PropertyOrHandler handler
scrollPerfTag = (&=) "scrollPerfTag"

-- Platform: IOS
alwaysBounceHorizontal :: Bool -> PropertyOrHandler handler
alwaysBounceHorizontal = (&=) "alwaysBounceHorizontal"

horizontal :: Bool -> PropertyOrHandler handler
horizontal = (&=) "horizontal"

-- Platform: IOS
automaticallyAdjustContentInsets :: Bool -> PropertyOrHandler handler
automaticallyAdjustContentInsets = (&=) "automaticallyAdjustContentInsets"

-- Platform: IOS
bounces :: Bool -> PropertyOrHandler handler
bounces = (&=) "bounces"

-- Platform: IOS
bouncesZoom :: Bool -> PropertyOrHandler handler
bouncesZoom = (&=) "bouncesZoom"

-- Platform: IOS
canCancelContentTouches :: Bool -> PropertyOrHandler handler
canCancelContentTouches = (&=) "canCancelContentTouches"

-- Platform: IOS
centerContent :: Bool -> PropertyOrHandler handler
centerContent = (&=) "centerContent"

-- Platform: IOS
contentInset :: Inset -> PropertyOrHandler handler
contentInset = (&=) "contentInset"

-- Platform: IOS
contentInsetAdjustmentBehavior :: ContentInsetAdjustmentBehavior -> PropertyOrHandler handler
contentInsetAdjustmentBehavior = (&=) "contentInsetAdjustmentBehavior"

-- Platform: IOS
contentOffset :: ContentOffset -> PropertyOrHandler handler
contentOffset = (&=) "contentOffset"

-- Platform: IOS
decelerationRate :: DecelerationRate -> PropertyOrHandler handler
decelerationRate = (&=) "decelerationRate"

-- Platform: IOS
directionalLockEnabled :: Bool -> PropertyOrHandler handler
directionalLockEnabled = (&=) "directionalLockEnabled"

-- Platform: IOS
indicatorStyle :: IndicatorStyle -> PropertyOrHandler handler
indicatorStyle = (&=) "indicatorStyle"

-- Platform: IOS
maximumZoomScale :: Double -> PropertyOrHandler handler
maximumZoomScale = (&=) "maximumZoomScale"

-- Platform: IOS
minimumZoomScale :: Double -> PropertyOrHandler handler
minimumZoomScale = (&=) "minimumZoomScale"

-- Platform: IOS
pinchGestureEnabled :: Bool -> PropertyOrHandler handler
pinchGestureEnabled = (&=) "pinchGestureEnabled"

-- Platform: IOS
scrollEventThrottle :: Natural -> PropertyOrHandler handler
scrollEventThrottle = (&=) "scrollEventThrottle"

-- Platform: IOS
scrollIndicatorInsets :: Inset -> PropertyOrHandler handler
scrollIndicatorInsets = (&=) "scrollIndicatorInsets"

-- Platform: IOS
scrollsToTop :: Bool -> PropertyOrHandler handler
scrollsToTop = (&=) "scrollsToTop"

-- Platform: IOS
snapToAlignment :: SnapToAlignment -> PropertyOrHandler handler
snapToAlignment = (&=) "snapToAlignment"

-- Platform: IOS
snapToInterval :: Natural -> PropertyOrHandler handler
snapToInterval = (&=) "snapToInterval"

-- Platform: IOS
zoomScale :: Double -> PropertyOrHandler handler
zoomScale = (&=) "zoomScale"

-- TODO: ViewProps

-- TODO: methods
