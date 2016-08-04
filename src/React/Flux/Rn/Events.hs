{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.Events where

import System.IO.Unsafe (unsafePerformIO)
import Data.Maybe (fromMaybe)

import GHCJS.Types (JSVal,JSString)
import GHCJS.Marshal (FromJSVal(..))

import React.Flux (PropertyOrHandler)
import React.Flux.Internal (PropertyOrHandler(CallbackPropertyWithSingleArgument), HandlerArg(..))

onPress :: handler -> PropertyOrHandler handler
onPress = on0 "onPress"

onPressIn :: handler -> PropertyOrHandler handler
onPressIn = on0 "onPressIn"

onLongPress :: handler -> PropertyOrHandler handler
onLongPress = on0 "onLongPress"

onSubmitEditing :: handler -> PropertyOrHandler handler
onSubmitEditing = on0 "onSubmitEditing"

onBlur :: handler -> PropertyOrHandler handler
onBlur = on0 "onBlur"

onEndEditing :: handler -> PropertyOrHandler handler
onEndEditing = on0 "onEndEditing"

onChange :: handler -> PropertyOrHandler handler
onChange = on0 "onChange"

onChangeText :: (String -> handler) -> PropertyOrHandler handler
onChangeText = on1 "onChangeText" 

on0 :: JSString -> handler -> PropertyOrHandler handler
on0 ev f = CallbackPropertyWithSingleArgument ev $ \_ -> f

on1 :: FromJSVal arg => JSString -> (arg -> handler) -> PropertyOrHandler handler
on1 ev f = CallbackPropertyWithSingleArgument ev $ \(HandlerArg jsval) -> f $ from jsval

from :: FromJSVal b => JSVal -> b
from jsval = fromMaybe (error "Unable to decode event target") $ unsafePerformIO $ fromJSVal $ jsval
