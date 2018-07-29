{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Props.VirtualizedListProps (
    module React.Flux.Rn.Props.VirtualizedListProps,
    Index
) where

import           GHCJS.Marshal            (FromJSVal)
import           Numeric.Natural          (Natural)
import           Prelude                  (Bool, String)
import           React.Flux.Rn.Components (Props, prop)
import           React.Flux.Rn.Events     (EventHandlerType, on1, ret2)
import           React.Flux.Rn.Types      (Index)

-- Required
last :: Natural -> Props component handler
last = prop "last"

-- Required
first :: Natural -> Props component handler
first = prop "first"

horizontal :: Bool -> Props component handler
horizontal = prop "horizontal"

initialNumToRender :: Natural -> Props component handler
initialNumToRender = prop "initialNumToRender"

keyExtractor :: forall component item handler. FromJSVal item => (item -> Index -> String) -> Props component handler
keyExtractor = ret2 "keyExtractor"

disableVirtualization :: Bool -> Props component handler
disableVirtualization = prop "disableVirtualization"

maxToRenderPerBatch :: Natural -> Props component handler
maxToRenderPerBatch = prop "maxToRenderPerBatch"

onEndReachedThreshold :: forall component handler. (Natural -> EventHandlerType handler) -> Props component handler
onEndReachedThreshold = on1 "onEndReachedThreshold"

scrollEventThrottle :: Natural -> Props component handler
scrollEventThrottle = prop "scrollEventThrottle"

updateCellsBatchingPeriod :: Natural {- ? -} -> Props component handler
updateCellsBatchingPeriod = prop "updateCellsBatchingPeriod"

windowSize :: Natural {- ? -} -> Props component handler
windowSize = prop "windowSize"

