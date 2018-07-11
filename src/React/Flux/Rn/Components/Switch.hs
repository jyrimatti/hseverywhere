{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.Switch where

import           Numeric.Natural
import           Prelude              (Bool, String)
import           React.Flux
import           React.Flux.Rn.Events
import           React.Flux.Rn.Types

disabled :: Bool -> PropertyOrHandler handler
disabled = (&=) "disabled"

onTintColor :: Color -> PropertyOrHandler handler
onTintColor = (&=) "onTintColor"

onValueChange :: (Bool -> EventHandlerType handler) -> PropertyOrHandler handler
onValueChange = on1 "onValueChange"

testID :: String -> PropertyOrHandler handler
testID = (&=) "testID"

thumbTintColor :: Color -> PropertyOrHandler handler
thumbTintColor = (&=) "thumbTintColor"

tintColor :: Color -> PropertyOrHandler handler
tintColor = (&=) "tintColor"

value :: Bool -> PropertyOrHandler handler
value = (&=) "value"

-- TODO: ViewProps
