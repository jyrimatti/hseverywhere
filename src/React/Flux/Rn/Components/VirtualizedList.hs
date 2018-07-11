{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.VirtualizedList where

import           Numeric.Natural
import           Prelude                        (Bool, String, const, pure, ($),
                                                 (.), (<$>))
import           React.Flux
import           React.Flux.Internal            (HandlerArg (..),
                                                 PropertyOrHandler_ (..))
import           React.Flux.PropertiesAndEvents (callback)
import           React.Flux.Rn.Events
import           React.Flux.Rn.Types

-- Required
last :: Natural -> PropertyOrHandler handler
last = (&=) "last"

-- Required
first :: Natural -> PropertyOrHandler handler
first = (&=) "first"

horizontal :: Bool -> PropertyOrHandler handler
horizontal = (&=) "horizontal"

initialNumToRender :: Natural -> PropertyOrHandler handler
initialNumToRender = (&=) "initialNumToRender"

keyExtractor :: (item -> Natural {-index-} -> String) -> PropertyOrHandler handler
keyExtractor = ret2 "keyExtractor"

disableVirtualization :: Bool -> PropertyOrHandler handler
disableVirtualization = (&=) "disableVirtualization"

maxToRenderPerBatch :: Natural -> PropertyOrHandler handler
maxToRenderPerBatch = (&=) "maxToRenderPerBatch"

onEndReachedThreshold :: (Natural -> EventHandlerType handler) -> PropertyOrHandler handler
onEndReachedThreshold = on1 "onEndReachedThreshold"

scrollEventThrottle :: Natural -> PropertyOrHandler handler
scrollEventThrottle = (&=) "scrollEventThrottle"

updateCellsBatchingPeriod :: Natural {- ? -} -> PropertyOrHandler handler
updateCellsBatchingPeriod = (&=) "updateCellsBatchingPeriod"

windowSize :: Natural {- ? -} -> PropertyOrHandler handler
windowSize = (&=) "windowSize"

-- TODO: Methods
