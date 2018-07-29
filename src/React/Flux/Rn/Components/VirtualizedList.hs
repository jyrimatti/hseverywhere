{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.VirtualizedList (
    module React.Flux.Rn.Components.VirtualizedList,
    Index
) where

import           GHCJS.Marshal                            (FromJSVal)
import           Prelude                                  (String)
import           React.Flux.Rn.Components                 (Props,
                                                           VirtualizedList)
import qualified React.Flux.Rn.Props.VirtualizedListProps as VirtualizedListProps
import           React.Flux.Rn.Types                      (Index)

-- VirtualizedListProps:

last                      = VirtualizedListProps.last @VirtualizedList
first                     = VirtualizedListProps.first @VirtualizedList
horizontal                = VirtualizedListProps.horizontal @VirtualizedList
initialNumToRender        = VirtualizedListProps.initialNumToRender @VirtualizedList
keyExtractor :: forall item handler. FromJSVal item => (item -> Index -> String) -> Props VirtualizedList handler
keyExtractor              = VirtualizedListProps.keyExtractor @VirtualizedList
disableVirtualization     = VirtualizedListProps.disableVirtualization @VirtualizedList
maxToRenderPerBatch       = VirtualizedListProps.maxToRenderPerBatch @VirtualizedList
onEndReachedThreshold     = VirtualizedListProps.onEndReachedThreshold @VirtualizedList
scrollEventThrottle       = VirtualizedListProps.scrollEventThrottle @VirtualizedList
updateCellsBatchingPeriod = VirtualizedListProps.updateCellsBatchingPeriod @VirtualizedList
windowSize                = VirtualizedListProps.windowSize @VirtualizedList

-- TODO: Methods
