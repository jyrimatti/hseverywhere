{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.SectionList where

import           Prelude                             (Bool)
import           React.Flux
import           React.Flux.Rn.Components            (Props, SectionList, prop)
import qualified React.Flux.Rn.Props.ScrollView      as ScrollViewProps
import qualified React.Flux.Rn.Props.VirtualizedList as VirtualizedListProps

-- Platform: IOS
stickySectionHeadersEnabled :: Bool -> Props SectionList handler
stickySectionHeadersEnabled = prop "stickySectionHeadersEnabled"

-- VirtualizedListProps:

last                      = VirtualizedListProps.last @SectionList
first                     = VirtualizedListProps.first @SectionList
horizontal                = VirtualizedListProps.horizontal @SectionList
initialNumToRender        = VirtualizedListProps.initialNumToRender @SectionList
keyExtractor              = VirtualizedListProps.keyExtractor @SectionList
disableVirtualization     = VirtualizedListProps.disableVirtualization @SectionList
maxToRenderPerBatch       = VirtualizedListProps.maxToRenderPerBatch @SectionList
onEndReachedThreshold     = VirtualizedListProps.onEndReachedThreshold @SectionList
scrollEventThrottle       = VirtualizedListProps.scrollEventThrottle @SectionList
updateCellsBatchingPeriod = VirtualizedListProps.updateCellsBatchingPeriod @SectionList
windowSize                = VirtualizedListProps.windowSize @SectionList

-- ScrollViewProps:

alwaysBounceVertical             = ScrollViewProps.alwaysBounceVertical @SectionList
contentContainerStyle            = ScrollViewProps.contentContainerStyle @SectionList
keyboardDismissMode              = ScrollViewProps.keyboardDismissMode @SectionList
keyboardShouldPersistTaps        = ScrollViewProps.keyboardShouldPersistTaps @SectionList
onContentSizeChange              = ScrollViewProps.onContentSizeChange @SectionList
onMomentumScrollBegin            = ScrollViewProps.onMomentumScrollBegin @SectionList
onMomentumScrollEnd              = ScrollViewProps.onMomentumScrollEnd @SectionList
onScroll                         = ScrollViewProps.onScroll @SectionList
pagingEnabled                    = ScrollViewProps.pagingEnabled @SectionList
refreshControl                   = ScrollViewProps.refreshControl @SectionList
removeClippedSubviews            = ScrollViewProps.removeClippedSubviews @SectionList
scrollEnabled                    = ScrollViewProps.scrollEnabled @SectionList
showsHorizontalScrollIndicator   = ScrollViewProps.showsHorizontalScrollIndicator @SectionList
showsVerticalScrollIndicator     = ScrollViewProps.showsVerticalScrollIndicator @SectionList
stickyHeaderIndices              = ScrollViewProps.stickyHeaderIndices @SectionList
endFillColor                     = ScrollViewProps.endFillColor @SectionList
overScrollMode                   = ScrollViewProps.overScrollMode @SectionList
scrollPerfTag                    = ScrollViewProps.scrollPerfTag @SectionList
alwaysBounceHorizontal           = ScrollViewProps.alwaysBounceHorizontal @SectionList
horizontal                       = ScrollViewProps.horizontal @SectionList
automaticallyAdjustContentInsets = ScrollViewProps.automaticallyAdjustContentInsets @SectionList
bounces                          = ScrollViewProps.bounces @SectionList
bouncesZoom                      = ScrollViewProps.bouncesZoom @SectionList
canCancelContentTouches          = ScrollViewProps.canCancelContentTouches @SectionList
centerContent                    = ScrollViewProps.centerContent @SectionList
contentInset                     = ScrollViewProps.contentInset @SectionList
contentInsetAdjustmentBehavior   = ScrollViewProps.contentInsetAdjustmentBehavior @SectionList
contentOffset                    = ScrollViewProps.contentOffset @SectionList
decelerationRate                 = ScrollViewProps.decelerationRate @SectionList
directionalLockEnabled           = ScrollViewProps.directionalLockEnabled @SectionList
indicatorStyle                   = ScrollViewProps.indicatorStyle @SectionList
maximumZoomScale                 = ScrollViewProps.maximumZoomScale @SectionList
minimumZoomScale                 = ScrollViewProps.minimumZoomScale @SectionList
pinchGestureEnabled              = ScrollViewProps.pinchGestureEnabled @SectionList
scrollEventThrottle              = ScrollViewProps.scrollEventThrottle @SectionList
scrollIndicatorInsets            = ScrollViewProps.scrollIndicatorInsets @SectionList
scrollsToTop                     = ScrollViewProps.scrollsToTop @SectionList
snapToAlignment                  = ScrollViewProps.snapToAlignment @SectionList
snapToInterval                   = ScrollViewProps.snapToInterval @SectionList
zoomScale                        = ScrollViewProps.zoomScale @SectionList

-- TODO: methods
