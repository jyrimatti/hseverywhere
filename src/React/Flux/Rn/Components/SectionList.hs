{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.Components.SectionList where

import           Prelude    (Bool)
import           React.Flux

-- Platform: IOS
stickySectionHeadersEnabled :: Bool -> PropertyOrHandler handler
stickySectionHeadersEnabled = (&=) "stickySectionHeadersEnabled"

-- TODO: VirtualizedListProps

-- TODO: ScrollViewProps

-- TODO: methods
