{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.ListView {-# DEPRECATED "Use FlatList or SectionList" #-} (
    module React.Flux.Rn.Components.ListView,
    ListViewDataSourceRef, ReactViewRef,
    ScrollViewProps.Color (..),
    ScrollViewProps.ContentInsetAdjustmentBehavior (..),
    ScrollViewProps.ContentOffset (ContentOffset),
    ScrollViewProps.DecelerationRate (..),
    ScrollViewProps.IndicatorStyle (..),
    ScrollViewProps.Inset (Inset),
    ScrollViewProps.KeyboardDismissMode (..),
    ScrollViewProps.KeyboardShouldPersistTaps (..),
    ScrollViewProps.OverScrollMode (..),
    ScrollViewProps.SnapToAlignment (..)
) where

import           Data.Typeable                       (Typeable)
import           GHCJS.Marshal                       (FromJSVal)
import           Numeric.Natural                     (Natural)
import           Prelude                             (Bool, IO)
import           React.Flux.Rn.Components            (ListView, Props, prop)
import           React.Flux.Rn.Events                (EventHandlerType, on1,
                                                      on2, view0, view1, view2,
                                                      view3, view4)
import qualified React.Flux.Rn.Props.ScrollViewProps as ScrollViewProps
import           React.Flux.Rn.Types                 (ListViewDataSourceRef,
                                                      ReactViewRef)

-- Required
dataSource :: ListViewDataSourceRef -> Props ListView handler
dataSource = prop "dataSource"

-- Required
initialListSize :: Natural -> Props ListView handler
initialListSize = prop "initialListSize"

-- Required
onEndReachedThreshold :: (Natural -> EventHandlerType handler) -> Props ListView handler
onEndReachedThreshold = on1 "onEndReachedThreshold"

-- Required
pageSize :: Natural -> Props ListView handler
pageSize = prop "pageSize"

-- Required
renderRow :: Typeable props => (rowdata -> sectionID -> rowID -> (sectionID -> rowID -> IO ()) -> ReactViewRef props) -> Props ListView handler
renderRow = view4 "renderRow"

-- Required
renderScrollComponent :: Typeable props => ([Props ListView handler] -> ReactViewRef props) -> Props ListView handler
renderScrollComponent = view1 "renderScrollComponent"

-- Required
scrollRenderAheadDistance :: Natural -> Props ListView handler
scrollRenderAheadDistance = prop "scrollRenderAheadDistance"

enableEmptySections :: Bool -> Props ListView handler
enableEmptySections = prop "enableEmptySections"

renderHeader ::  Typeable props => ReactViewRef props -> Props ListView handler
renderHeader = view0 "renderScrollComponent"

onEndReached :: FromJSVal nativeScrollEvent => (nativeScrollEvent -> EventHandlerType handler) -> Props ListView handler
onEndReached = on1 "onEndReached"

stickySectionHeadersEnabled :: Bool -> Props ListView handler
stickySectionHeadersEnabled = prop "stickySectionHeadersEnabled"

renderSectionHeader ::  Typeable props => (sectionData -> sectionID -> ReactViewRef props) -> Props ListView handler
renderSectionHeader = view2 "renderSectionHeader"

renderSeparator ::  Typeable props => (sectionId -> rowID -> Bool{-adjacentRowHighlighted-} -> ReactViewRef props) -> Props ListView handler
renderSeparator = view3 "renderSeparator"

onChangeVisibleRows :: (FromJSVal visibleRows, FromJSVal changedRows) => (visibleRows -> changedRows -> EventHandlerType handler) -> Props ListView handler
onChangeVisibleRows = on2 "onChangeVisibleRows"

renderFooter :: Typeable props => ReactViewRef props -> Props ListView handler
renderFooter = view0 "renderFooter"

-- ScrollViewProps:

alwaysBounceVertical             = ScrollViewProps.alwaysBounceVertical @ListView
contentContainerStyle            = ScrollViewProps.contentContainerStyle @ListView
keyboardDismissMode              = ScrollViewProps.keyboardDismissMode @ListView
keyboardShouldPersistTaps        = ScrollViewProps.keyboardShouldPersistTaps @ListView
onContentSizeChange              = ScrollViewProps.onContentSizeChange @ListView
onMomentumScrollBegin            = ScrollViewProps.onMomentumScrollBegin @ListView
onMomentumScrollEnd              = ScrollViewProps.onMomentumScrollEnd @ListView
onScroll                         = ScrollViewProps.onScroll @ListView
pagingEnabled                    = ScrollViewProps.pagingEnabled @ListView
refreshControl                   = ScrollViewProps.refreshControl @ListView
scrollEnabled                    = ScrollViewProps.scrollEnabled @ListView
showsHorizontalScrollIndicator   = ScrollViewProps.showsHorizontalScrollIndicator @ListView
showsVerticalScrollIndicator     = ScrollViewProps.showsVerticalScrollIndicator @ListView
stickyHeaderIndices              = ScrollViewProps.stickyHeaderIndices @ListView
endFillColor                     = ScrollViewProps.endFillColor @ListView
overScrollMode                   = ScrollViewProps.overScrollMode @ListView
scrollPerfTag                    = ScrollViewProps.scrollPerfTag @ListView
alwaysBounceHorizontal           = ScrollViewProps.alwaysBounceHorizontal @ListView
horizontal                       = ScrollViewProps.horizontal @ListView
automaticallyAdjustContentInsets = ScrollViewProps.automaticallyAdjustContentInsets @ListView
bounces                          = ScrollViewProps.bounces @ListView
bouncesZoom                      = ScrollViewProps.bouncesZoom @ListView
canCancelContentTouches          = ScrollViewProps.canCancelContentTouches @ListView
centerContent                    = ScrollViewProps.centerContent @ListView
contentInset                     = ScrollViewProps.contentInset @ListView
contentInsetAdjustmentBehavior   = ScrollViewProps.contentInsetAdjustmentBehavior @ListView
contentOffset                    = ScrollViewProps.contentOffset @ListView
decelerationRate                 = ScrollViewProps.decelerationRate @ListView
directionalLockEnabled           = ScrollViewProps.directionalLockEnabled @ListView
indicatorStyle                   = ScrollViewProps.indicatorStyle @ListView
maximumZoomScale                 = ScrollViewProps.maximumZoomScale @ListView
minimumZoomScale                 = ScrollViewProps.minimumZoomScale @ListView
pinchGestureEnabled              = ScrollViewProps.pinchGestureEnabled @ListView
scrollEventThrottle              = ScrollViewProps.scrollEventThrottle @ListView
scrollIndicatorInsets            = ScrollViewProps.scrollIndicatorInsets @ListView
scrollsToTop                     = ScrollViewProps.scrollsToTop @ListView
snapToAlignment                  = ScrollViewProps.snapToAlignment @ListView
snapToInterval                   = ScrollViewProps.snapToInterval @ListView
zoomScale                        = ScrollViewProps.zoomScale @ListView

-- TODO: methods
