{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.Components.FlatList where

import           Numeric.Natural
import           React.Flux
import           React.Flux.Rn.Types ()

numColumns :: Natural -> PropertyOrHandler handler
numColumns = (&=) "numColumns"

-- TODO: VirtualizedListProps

-- TODO: ScrollViewProps

-- TODO: methods
