{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.FlatList where

import           Numeric.Natural
import           React.Flux
import           React.Flux.Rn.Components            (FlatList, Props, prop)
import qualified React.Flux.Rn.Props.ScrollView      as ScrollViewProps
import qualified React.Flux.Rn.Props.VirtualizedList as VirtualizedListProps
import           React.Flux.Rn.Types                 ()

numColumns :: Natural -> Props FlatList handler
numColumns = prop "numColumns"

-- VirtualizedListProps:

last                      = VirtualizedListProps.last @FlatList
first                     = VirtualizedListProps.first @FlatList
horizontal                = VirtualizedListProps.horizontal @FlatList
initialNumToRender        = VirtualizedListProps.initialNumToRender @FlatList
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
removeClippedSubviews            = ScrollViewProps.removeClippedSubviews @FlatList
scrollEnabled                    = ScrollViewProps.scrollEnabled @FlatList
showsHorizontalScrollIndicator   = ScrollViewProps.showsHorizontalScrollIndicator @FlatList
showsVerticalScrollIndicator     = ScrollViewProps.showsVerticalScrollIndicator @FlatList
stickyHeaderIndices              = ScrollViewProps.stickyHeaderIndices @FlatList
endFillColor                     = ScrollViewProps.endFillColor @FlatList
overScrollMode                   = ScrollViewProps.overScrollMode @FlatList
scrollPerfTag                    = ScrollViewProps.scrollPerfTag @FlatList
alwaysBounceHorizontal           = ScrollViewProps.alwaysBounceHorizontal @FlatList
horizontal                       = ScrollViewProps.horizontal @FlatList
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
scrollEventThrottle              = ScrollViewProps.scrollEventThrottle @FlatList
scrollIndicatorInsets            = ScrollViewProps.scrollIndicatorInsets @FlatList
scrollsToTop                     = ScrollViewProps.scrollsToTop @FlatList
snapToAlignment                  = ScrollViewProps.snapToAlignment @FlatList
snapToInterval                   = ScrollViewProps.snapToInterval @FlatList
zoomScale                        = ScrollViewProps.zoomScale @FlatList

-- TODO: methods
