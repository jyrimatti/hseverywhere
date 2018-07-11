{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.PickerIOS where

import           GHCJS.Marshal        (ToJSVal)
import           React.Flux
import           React.Flux.Rn.Events
import           React.Flux.Rn.Types

itemStyle :: TextStyleProps -> PropertyOrHandler handler
itemStyle = nestedProperty "itemStyle"

onValueChange :: EventHandlerType handler -> PropertyOrHandler handler
onValueChange = on0 "onValueChange"

selectedValue :: ToJSVal value => value -> PropertyOrHandler handler
selectedValue = (&=) "selectedValue"

-- TODO: ViewProps
