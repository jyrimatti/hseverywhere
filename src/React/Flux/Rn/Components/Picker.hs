{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.Picker where

import           GHCJS.Marshal        (FromJSVal, ToJSVal)
import           Numeric.Natural
import           Prelude              (Bool, String)
import           React.Flux
import           React.Flux.Rn.Events
import           React.Flux.Rn.Types

onValueChange :: FromJSVal value => (value -> Natural -> EventHandlerType handler) -> PropertyOrHandler handler
onValueChange = on2 "onValueChange"

selectedValue :: ToJSVal value => value -> PropertyOrHandler handler
selectedValue = (&=) "selectedValue"

style :: PickerStyleProps -> PropertyOrHandler handler
style = nestedProperty "style"

testID :: String -> PropertyOrHandler handler
testID = (&=) "testID"

-- Platform: Android
enabled :: Bool -> PropertyOrHandler handler
enabled = (&=) "enabled"

-- Platform: Android
mode :: PickerMode -> PropertyOrHandler handler
mode = (&=) "mode"

-- Platform: Android
prompt :: String -> PropertyOrHandler handler
prompt = (&=) "prompt"

-- Platform: IOS
itemStyle :: TextStyleProps -> PropertyOrHandler handler
itemStyle = nestedProperty "itemStyle"

-- TODO: ViewProps

-- TODO: methods
