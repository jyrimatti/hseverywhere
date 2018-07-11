{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.Components.SegmentedControlIOS where

import           GHCJS.Marshal        (FromJSVal)
import           Numeric.Natural
import           Prelude              (Bool, String)
import           React.Flux
import           React.Flux.Rn.Events
import           React.Flux.Rn.Types

enabled :: Bool -> PropertyOrHandler handler
enabled = (&=) "enabled"

momentary :: Bool -> PropertyOrHandler handler
momentary = (&=) "momentary"

onChange :: (OnChange -> EventHandlerType handler) -> PropertyOrHandler handler
onChange = on1 "onChange"

onValueChange :: FromJSVal value => (value -> EventHandlerType handler) -> PropertyOrHandler handler
onValueChange = on1 "onValueChange"

selectedIndex :: Natural -> PropertyOrHandler handler
selectedIndex = (&=) "selectedIndex"

tintColor :: Color -> PropertyOrHandler handler
tintColor = (&=) "tintColor"

values :: [String] -> PropertyOrHandler handler
values = (&=) "values"

-- TODO: ViewProps

-- TODO: methods
