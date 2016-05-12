module React.Flux.Rn.Events where

import System.IO.Unsafe (unsafePerformIO)
import Data.Maybe (fromMaybe)

import GHCJS.Types (JSString, JSVal)
import GHCJS.Marshal (FromJSVal(..))

import React.Flux (Event, PropertyOrHandler)
import React.Flux.Internal (PropertyOrHandler(CallbackPropertyWithSingleArgument), HandlerArg(..))

onPress :: handler -> PropertyOrHandler handler
onPress = on0 "onPress"

onSubmitEditing :: handler -> PropertyOrHandler handler
onSubmitEditing = on0 "onSubmitEditing"

onChange :: handler -> PropertyOrHandler handler
onChange = on0 "onChange"

onChangeText :: (String -> handler) -> PropertyOrHandler handler
onChangeText = on1 "onChangeText" 

on0 :: String -> handler -> PropertyOrHandler handler
on0 ev f = CallbackPropertyWithSingleArgument ev $ \_ -> f

on1 :: FromJSVal arg => String -> (arg -> handler) -> PropertyOrHandler handler
on1 ev f = CallbackPropertyWithSingleArgument ev $ \(HandlerArg jsval) -> f $ from jsval

from :: FromJSVal b => JSVal -> b
from jsval = fromMaybe (error "Unable to decode event target") $ unsafePerformIO $ fromJSVal $ jsval