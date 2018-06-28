{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.Events where

import           Data.Aeson
import           Data.Aeson.Types               (parseMaybe)
import           Data.Maybe                     (fromMaybe)

import           GHC.Generics                   (Generic)

import           GHCJS.Marshal                  (FromJSVal (..))
import           GHCJS.Types                    (JSString, JSVal)

import           React.Flux
import           React.Flux.Internal            (HandlerArg (..),
                                                 PropertyOrHandler_ (..))
import           React.Flux.PropertiesAndEvents ()

onPress :: (Event -> EventHandlerTypeWithMods handler) -> PropertyOrHandler handler
onPress = on "onPress"

onPressIn :: (Event -> EventHandlerTypeWithMods handler) -> PropertyOrHandler handler
onPressIn = on "onPressIn"

onLongPress :: (Event -> EventHandlerTypeWithMods handler) -> PropertyOrHandler handler
onLongPress = on "onLongPress"

onSubmitEditing :: (Event -> EventHandlerTypeWithMods handler) -> PropertyOrHandler handler
onSubmitEditing = on "onSubmitEditing"

onEndEditing :: (Event -> EventHandlerTypeWithMods handler) -> PropertyOrHandler handler
onEndEditing = on "onEndEditing"



onBlur :: EventHandlerType handler -> PropertyOrHandler handler
onBlur = on0 "onBlur"

onChangeText :: (String -> EventHandlerType handler) -> PropertyOrHandler handler
onChangeText = on1 "onChangeText"

newtype OnKeyPress = OnKeyPress { key :: String } deriving (Show, Generic)
instance FromJSON OnKeyPress
instance FromJSVal OnKeyPress where
  fromJSVal jsval = parseMaybe parseJSON <$> (js_nativeEvent jsval >>= fromJSValUnchecked)

onKeyPress :: (String -> EventHandlerType handler) -> PropertyOrHandler handler
onKeyPress f = on1 "onKeyPress" $ \(OnKeyPress key) -> f key

on0 :: JSString -> EventHandlerType handler -> PropertyOrHandler handler
on0 ev f = CallbackPropertyWithArgumentArray ev $ const $ pure f

on1 :: FromJSVal arg => JSString -> (arg -> EventHandlerType handler) -> PropertyOrHandler handler
on1 ev f = CallbackPropertyWithSingleArgument ev $ \(HandlerArg jsval) -> f <$> from jsval

from :: FromJSVal b => JSVal -> IO b
from jsval = fromMaybe (error "Unable to decode event target") <$> fromJSVal jsval

#ifdef __GHCJS__

foreign import javascript unsafe
  "$1['nativeEvent']"
  js_nativeEvent :: JSVal -> IO JSVal

#else

js_nativeEvent :: JSVal -> IO JSVal
js_nativeEvent _ = error "js_nativeEvent only works with GHCJS"

#endif