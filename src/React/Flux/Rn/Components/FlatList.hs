{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.FlatList where

import           GHCJS.Marshal                            (FromJSVal)
import           Numeric.Natural
import           Prelude                                  (String)
import           React.Flux.Rn.Components                 (FlatList, Props,
                                                           prop)
import qualified React.Flux.Rn.Props.ScrollViewProps      as ScrollViewProps
import qualified React.Flux.Rn.Props.ViewProps            as ViewProps
import qualified React.Flux.Rn.Props.VirtualizedListProps as VirtualizedListProps
import           React.Flux.Rn.Types                      ()

numColumns :: Natural -> Props FlatList handler
numColumns = prop "numColumns"

-- VirtualizedListProps:

last                      = VirtualizedListProps.last @FlatList
first                     = VirtualizedListProps.first @FlatList
horizontal                = VirtualizedListProps.horizontal @FlatList
initialNumToRender        = VirtualizedListProps.initialNumToRender @FlatList
keyExtractor :: forall item handler. FromJSVal item => (item -> Natural {-index-} -> String) -> Props FlatList handler
keyExtractor              = VirtualizedListProps.keyExtractor @FlatList
disableVirtualization     = VirtualizedListProps.disableVirtualization @FlatList
maxToRenderPerBatch       = VirtualizedListProps.maxToRenderPerBatch @FlatList
onEndReachedThreshold     = VirtualizedListProps.onEndReachedThreshold @FlatList
scrollEventThrottle       = VirtualizedListProps.scrollEventThrottle @FlatList
updateCellsBatchingPeriod = VirtualizedListProps.updateCellsBatchingPeriod @FlatList
windowSize                = VirtualizedListProps.windowSize @FlatList

-- ScrollViewProps:

alwaysBounceVertical             = ScrollViewProps.alwaysBounceVertical @FlatList
contentContainerStyle            = ScrollViewProps.contentContainerStyle @FlatList
keyboardDismissMode              = ScrollViewProps.keyboardDismissMode @FlatList
keyboardShouldPersistTaps        = ScrollViewProps.keyboardShouldPersistTaps @FlatList
onContentSizeChange              = ScrollViewProps.onContentSizeChange @FlatList
onMomentumScrollBegin            = ScrollViewProps.onMomentumScrollBegin @FlatList
onMomentumScrollEnd              = ScrollViewProps.onMomentumScrollEnd @FlatList
onScroll                         = ScrollViewProps.onScroll @FlatList
pagingEnabled                    = ScrollViewProps.pagingEnabled @FlatList
refreshControl                   = ScrollViewProps.refreshControl @FlatList
scrollEnabled                    = ScrollViewProps.scrollEnabled @FlatList
showsHorizontalScrollIndicator   = ScrollViewProps.showsHorizontalScrollIndicator @FlatList
showsVerticalScrollIndicator     = ScrollViewProps.showsVerticalScrollIndicator @FlatList
stickyHeaderIndices              = ScrollViewProps.stickyHeaderIndices @FlatList
endFillColor                     = ScrollViewProps.endFillColor @FlatList
overScrollMode                   = ScrollViewProps.overScrollMode @FlatList
scrollPerfTag                    = ScrollViewProps.scrollPerfTag @FlatList
alwaysBounceHorizontal           = ScrollViewProps.alwaysBounceHorizontal @FlatList
automaticallyAdjustContentInsets = ScrollViewProps.automaticallyAdjustContentInsets @FlatList
bounces                          = ScrollViewProps.bounces @FlatList
bouncesZoom                      = ScrollViewProps.bouncesZoom @FlatList
canCancelContentTouches          = ScrollViewProps.canCancelContentTouches @FlatList
centerContent                    = ScrollViewProps.centerContent @FlatList
contentInset                     = ScrollViewProps.contentInset @FlatList
contentInsetAdjustmentBehavior   = ScrollViewProps.contentInsetAdjustmentBehavior @FlatList
contentOffset                    = ScrollViewProps.contentOffset @FlatList
decelerationRate                 = ScrollViewProps.decelerationRate @FlatList
directionalLockEnabled           = ScrollViewProps.directionalLockEnabled @FlatList
indicatorStyle                   = ScrollViewProps.indicatorStyle @FlatList
maximumZoomScale                 = ScrollViewProps.maximumZoomScale @FlatList
minimumZoomScale                 = ScrollViewProps.minimumZoomScale @FlatList
pinchGestureEnabled              = ScrollViewProps.pinchGestureEnabled @FlatList
scrollIndicatorInsets            = ScrollViewProps.scrollIndicatorInsets @FlatList
scrollsToTop                     = ScrollViewProps.scrollsToTop @FlatList
snapToAlignment                  = ScrollViewProps.snapToAlignment @FlatList
snapToInterval                   = ScrollViewProps.snapToInterval @FlatList
zoomScale                        = ScrollViewProps.zoomScale @FlatList

-- ViewProps:

onStartShouldSetResponder        = ViewProps.onStartShouldSetResponder @FlatList
accessibilityLabel               = ViewProps.accessibilityLabel @FlatList
hitSlop                          = ViewProps.hitSlop @FlatList
nativeID                         = ViewProps.nativeID @FlatList
onAccessibilityTap               = ViewProps.onAccessibilityTap @FlatList
onLayout                         = ViewProps.onLayout @FlatList
onMagicTap                       = ViewProps.onMagicTap @FlatList
onMoveShouldSetResponder         = ViewProps.onMoveShouldSetResponder @FlatList
onMoveShouldSetResponderCapture  = ViewProps.onMoveShouldSetResponderCapture @FlatList
onResponderGrant                 = ViewProps.onResponderGrant @FlatList
onResponderMove                  = ViewProps.onResponderMove @FlatList
onResponderReject                = ViewProps.onResponderReject @FlatList
onResponderRelease               = ViewProps.onResponderRelease @FlatList
onResponderTerminate             = ViewProps.onResponderTerminate @FlatList
onResponderTerminationRequest    = ViewProps.onResponderTerminationRequest @FlatList
accessible                       = ViewProps.accessible @FlatList
onStartShouldSetResponderCapture = ViewProps.onStartShouldSetResponderCapture @FlatList
pointerEvents                    = ViewProps.pointerEvents @FlatList
removeClippedSubviews            = ViewProps.removeClippedSubviews @FlatList
style                            = ViewProps.style @FlatList
testID                           = ViewProps.testID @FlatList
accessibilityComponentType       = ViewProps.accessibilityComponentType @FlatList
accessibilityLiveRegion          = ViewProps.accessibilityLiveRegion @FlatList
collapsable                      = ViewProps.collapsable @FlatList
importantForAccessibility        = ViewProps.importantForAccessibility @FlatList
needsOffscreenAlphaCompositing   = ViewProps.needsOffscreenAlphaCompositing @FlatList
renderToHardwareTextureAndroid   = ViewProps.renderToHardwareTextureAndroid @FlatList
accessibilityTraits              = ViewProps.accessibilityTraits @FlatList
accessibilityViewIsModal         = ViewProps.accessibilityViewIsModal @FlatList
shouldRasterizeIOS               = ViewProps.shouldRasterizeIOS @FlatList

-- TODO: methods
