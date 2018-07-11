{-# LANGUAGE CPP               #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.Events where

import           Data.Aeson
import           Data.Aeson.Types    (parseMaybe)
import           Data.Maybe          (fromMaybe)
import           Data.Typeable
import           JavaScript.Array    (index)
import           Prelude             (IO, Maybe, String, const, error, print,
                                      pure, undefined, ($), (<$>), (<*>))

import           GHCJS.Marshal       (FromJSVal (..), ToJSVal (..))
import           GHCJS.Types         (JSString, JSVal)

import           React.Flux
import           React.Flux.Internal (HandlerArg (..), PropertyOrHandler_ (..),
                                      ReactViewRef)

{-# ANN module ("HLint: ignore Use camelCase" :: String) #-}

on0 :: JSString -> EventHandlerType handler -> PropertyOrHandler handler
on0 ev f = CallbackPropertyWithArgumentArray ev $ const $ pure f

on1 :: FromJSVal arg => JSString -> (arg -> EventHandlerType handler) -> PropertyOrHandler handler
on1 ev f = CallbackPropertyWithSingleArgument ev $ \(HandlerArg jsval) -> f <$> from jsval

on2 :: (FromJSVal arg1, FromJSVal arg2) => JSString -> (arg1 -> arg2 -> EventHandlerType handler) -> PropertyOrHandler handler
on2 ev f = CallbackPropertyWithArgumentArray ev $ \jsarray -> f <$> from (index 0 jsarray) <*> from (index 1 jsarray)

on3 :: (FromJSVal arg1, FromJSVal arg2, FromJSVal arg3) => JSString -> (arg1 -> arg2 -> arg3 -> EventHandlerType handler) -> PropertyOrHandler handler
on3 ev f = CallbackPropertyWithArgumentArray ev $ \jsarray -> f <$> from (index 0 jsarray) <*> from (index 1 jsarray) <*> from (index 2 jsarray)

on4 :: (FromJSVal arg1, FromJSVal arg2, FromJSVal arg3, FromJSVal arg4) => JSString -> (arg1 -> arg2 -> arg3 -> arg4 -> EventHandlerType handler) -> PropertyOrHandler handler
on4 ev f = CallbackPropertyWithArgumentArray ev $ \jsarray -> f <$> from (index 0 jsarray) <*> from (index 1 jsarray) <*> from (index 2 jsarray) <*> from (index 3 jsarray)

ret1 :: (FromJSVal arg, ToJSVal ret) => JSString -> (arg -> ret) -> PropertyOrHandler handler
ret1 ev f = undefined -- TODO: ?

ret2 :: (FromJSVal arg1, FromJSVal arg2, ToJSVal ret) => JSString -> (arg1 -> arg2 -> ret) -> PropertyOrHandler handler
ret2 ev f = undefined -- TODO: ?

view0 :: Typeable props => JSString -> ReactViewRef props -> PropertyOrHandler handler
view0 ev = CallbackPropertyReturningView ev undefined -- TODO: ?

view1 :: Typeable props => JSString -> (arg -> ReactViewRef props) -> PropertyOrHandler handler
view1 ev f = CallbackPropertyReturningView ev undefined $ f undefined -- TODO: ?

view2 :: Typeable props => JSString -> (arg1 -> arg2 -> ReactViewRef props) -> PropertyOrHandler handler
view2 ev f = CallbackPropertyReturningView ev undefined $ f undefined undefined -- TODO: ?

view3 :: Typeable props => JSString -> (arg1 -> arg2 -> arg3 -> ReactViewRef props) -> PropertyOrHandler handler
view3 ev f = CallbackPropertyReturningView ev undefined $ f undefined undefined undefined -- TODO: ?

view4 :: Typeable props => JSString -> (arg1 -> arg2 -> arg3 -> arg4 -> ReactViewRef props) -> PropertyOrHandler handler
view4 ev f = CallbackPropertyReturningView ev undefined $ f undefined undefined undefined undefined -- TODO: ?

from :: FromJSVal b => JSVal -> IO b
from jsval = fromMaybe (error "Unable to decode event target") <$> fromJSVal jsval

fromNativeJSON :: FromJSON x => JSVal -> IO (Maybe x)
fromNativeJSON jsval = parseMaybe parseJSON <$> nativeEvent jsval

nativeEvent :: FromJSVal x => JSVal -> IO x
nativeEvent jsval = do
  x <- js_nativeEvent_ jsval
  y <- js_toString x
  print y
  fromJSValUnchecked x

#ifdef __GHCJS__

foreign import javascript unsafe
  "$1['nativeEvent']"
  js_nativeEvent_ :: JSVal -> IO JSVal

foreign import javascript unsafe
  "JSON.stringify($1)"
  js_toString :: JSVal -> IO JSString

#else

js_nativeEvent_ :: JSVal -> IO JSVal
js_nativeEvent_ _ = error "js_nativeEvent only works with GHCJS"

js_toString :: JSVal -> IO JSString
js_toString _ = error "js_toString only works with GHCJS"

#endif
