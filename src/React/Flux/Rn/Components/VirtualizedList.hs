{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.VirtualizedList where

import           Numeric.Natural
import           Prelude                             (Bool, String, const, pure,
                                                      ($), (.), (<$>))
import           React.Flux
import           React.Flux.Internal                 (HandlerArg (..),
                                                      PropertyOrHandler_ (..))
import           React.Flux.PropertiesAndEvents      (callback)
import           React.Flux.Rn.Components            (Props, VirtualizedList,
                                                      prop)
import           React.Flux.Rn.Events
import qualified React.Flux.Rn.Props.VirtualizedList as VirtualizedListProps
import           React.Flux.Rn.Types

-- VirtualizedListProps:

last                      = VirtualizedListProps.last @VirtualizedList
first                     = VirtualizedListProps.first @VirtualizedList
horizontal                = VirtualizedListProps.horizontal @VirtualizedList
initialNumToRender        = VirtualizedListProps.initialNumToRender @VirtualizedList
keyExtractor              = VirtualizedListProps.keyExtractor @VirtualizedList
disableVirtualization     = VirtualizedListProps.disableVirtualization @VirtualizedList
maxToRenderPerBatch       = VirtualizedListProps.maxToRenderPerBatch @VirtualizedList
onEndReachedThreshold     = VirtualizedListProps.onEndReachedThreshold @VirtualizedList
scrollEventThrottle       = VirtualizedListProps.scrollEventThrottle @VirtualizedList
updateCellsBatchingPeriod = VirtualizedListProps.updateCellsBatchingPeriod @VirtualizedList
windowSize                = VirtualizedListProps.windowSize @VirtualizedList

-- TODO: Methods
