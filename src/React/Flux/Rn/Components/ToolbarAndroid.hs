{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.ToolbarAndroid where

import           Data.Aeson           (FromJSON, ToJSON (..))
import           Data.Aeson.Types     (parseJSON, parseMaybe)
import           GHC.Generics
import           GHCJS.Marshal        (FromJSVal (..), ToJSVal (..))
import           Numeric.Natural
import           Prelude              (Bool, Int, Show, String, pure, (<$>),
                                       (>>=))
import           React.Flux
import           React.Flux.Rn.Events
import           React.Flux.Rn.Types

overflowIcon :: ImageSource -> PropertyOrHandler handler
overflowIcon = (&=) "overflowIcon"

actions :: [Action] -> PropertyOrHandler handler
actions = (&=) "actions"

contentInsetStart :: Int -> PropertyOrHandler handler
contentInsetStart = (&=) "contentInsetStart"

logo :: ImageSource -> PropertyOrHandler handler
logo = (&=) "logo"

navIcon :: ImageSource -> PropertyOrHandler handler
navIcon = (&=) "navIcon"

onActionSelected :: (Natural -> EventHandlerType handler) -> PropertyOrHandler handler
onActionSelected = on1 "onActionSelected"

onIconClicked :: EventHandlerType handler -> PropertyOrHandler handler
onIconClicked = on0 "onIconClicked"

contentInsetEnd :: Int -> PropertyOrHandler handler
contentInsetEnd = (&=) "contentInsetEnd"

rtl :: Bool -> PropertyOrHandler handler
rtl = (&=) "rtl"

subtitle :: String -> PropertyOrHandler handler
subtitle = (&=) "subtitle"

subtitleColor :: Color -> PropertyOrHandler handler
subtitleColor = (&=) "subtitleColor"

testID :: String -> PropertyOrHandler handler
testID = (&=) "testID"

title :: String -> PropertyOrHandler handler
title = (&=) "title"

titleColor :: Color -> PropertyOrHandler handler
titleColor = (&=) "titleColor"

-- TODO: ViewProps
