{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.StatusBar where

import           Prelude              (Bool)
import           React.Flux
import           React.Flux.Rn.Events
import           React.Flux.Rn.Types

animated :: Bool -> PropertyOrHandler handler
animated = (&=) "animated"

barStyle :: StatusBarStyle -> PropertyOrHandler handler
barStyle = (&=) "barStyle"

hidden :: Bool -> PropertyOrHandler handler
hidden = (&=) "hidden"

-- Platform: Android
backgroundColor :: Color -> PropertyOrHandler handler
backgroundColor = (&=) "backgroundColor"

-- Platform: Android
translucent :: Bool -> PropertyOrHandler handler
translucent = (&=) "translucent"

-- Platform: IOS
networkActivityIndicatorVisible :: Bool -> PropertyOrHandler handler
networkActivityIndicatorVisible = (&=) "networkActivityIndicatorVisible"

-- Platform: IOS
showHideTransition :: ShowHideTransition -> PropertyOrHandler handler
showHideTransition = (&=) "showHideTransition"

-- TODO: Methods
