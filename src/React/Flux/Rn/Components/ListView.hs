{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.Components.ListView {-# DEPRECATED "Use FlatList or SectionList" #-} where

import           Data.Typeable
import           GHCJS.Marshal        (FromJSVal)
import           Numeric.Natural
import           Prelude              (Bool, IO)
import           React.Flux
import           React.Flux.Internal  (ReactViewRef)
import           React.Flux.Rn.Events
import           React.Flux.Rn.Types

-- Required
dataSource :: ListViewDataSourceRef -> PropertyOrHandler handler
dataSource = (&=) "dataSource"

-- Required
initialListSize :: Natural -> PropertyOrHandler handler
initialListSize = (&=) "initialListSize"

-- Required
onEndReachedThreshold :: (Natural -> EventHandlerType handler) -> PropertyOrHandler handler
onEndReachedThreshold = on1 "onEndReachedThreshold"

-- Required
pageSize :: Natural -> PropertyOrHandler handler
pageSize = (&=) "pageSize"

-- Required
renderRow :: Typeable props => (rowdata -> sectionID -> rowID -> (sectionID -> rowID -> IO ()) -> ReactViewRef props) -> PropertyOrHandler handler
renderRow = view4 "renderRow"

-- Required
renderScrollComponent :: Typeable props => ([PropertyOrHandler handler] -> ReactViewRef props) -> PropertyOrHandler handler
renderScrollComponent = view1 "renderScrollComponent"

-- Required
scrollRenderAheadDistance :: Natural -> PropertyOrHandler handler
scrollRenderAheadDistance = (&=) "scrollRenderAheadDistance"

-- Required
stickyHeaderIndices :: [Natural] -> PropertyOrHandler handler
stickyHeaderIndices = (&=) "stickyHeaderIndices"

enableEmptySections :: Bool -> PropertyOrHandler handler
enableEmptySections = (&=) "enableEmptySections"

renderHeader ::  Typeable props => ReactViewRef props -> PropertyOrHandler handler
renderHeader = view0 "renderScrollComponent"

onEndReached :: FromJSVal nativeScrollEvent => (nativeScrollEvent -> EventHandlerType handler) -> PropertyOrHandler handler
onEndReached = on1 "onEndReached"

stickySectionHeadersEnabled :: Bool -> PropertyOrHandler handler
stickySectionHeadersEnabled = (&=) "stickySectionHeadersEnabled"

renderSectionHeader ::  Typeable props => (sectionData -> sectionID -> ReactViewRef props) -> PropertyOrHandler handler
renderSectionHeader = view2 "renderSectionHeader"

renderSeparator ::  Typeable props => (sectionId -> rowID -> Bool{-adjacentRowHighlighted-} -> ReactViewRef props) -> PropertyOrHandler handler
renderSeparator = view3 "renderSeparator"

onChangeVisibleRows :: (FromJSVal visibleRows, FromJSVal changedRows) => (visibleRows -> changedRows -> EventHandlerType handler) -> PropertyOrHandler handler
onChangeVisibleRows = on2 "onChangeVisibleRows"

removeClippedSubviews :: Bool -> PropertyOrHandler handler
removeClippedSubviews = (&=) "removeClippedSubviews"

renderFooter :: Typeable props => ReactViewRef props -> PropertyOrHandler handler
renderFooter = view0 "renderFooter"

-- TODO: ScrollViewProps

-- TODO: methods
