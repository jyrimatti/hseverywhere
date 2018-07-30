{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
{-# LANGUAGE OverloadedStrings  #-}
module React.Flux.Rn.Components.VirtualizedList (
    module React.Flux.Rn.Components.VirtualizedList,
    Index
) where

import           GHCJS.Marshal                            (FromJSVal)
import           Prelude                                  (String)
import           Prelude                                  (fmap)
import           React.Flux                               (ReactElementM,
                                                           foreign_)
import           React.Flux.Rn.Properties                 (Props, props)
import qualified React.Flux.Rn.Props.VirtualizedListProps as VirtualizedListProps
import           React.Flux.Rn.Types                      (Index)
import           Prelude                       ((.))

data VirtualizedList
virtualizedList :: [Props VirtualizedList handler] -> ReactElementM handler a -> ReactElementM handler a
virtualizedList = foreign_ "VirtualizedList" . fmap props

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
