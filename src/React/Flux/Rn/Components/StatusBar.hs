{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.StatusBar where

import           Prelude                  (Bool)
import           React.Flux
import           React.Flux.Rn.Components (Props, StatusBar, prop)
import           React.Flux.Rn.Events
import           React.Flux.Rn.Types

animated :: Bool -> Props StatusBar handler
animated = prop "animated"

barStyle :: StatusBarStyle -> Props StatusBar handler
barStyle = prop "barStyle"

hidden :: Bool -> Props StatusBar handler
hidden = prop "hidden"

-- Platform: Android
backgroundColor :: Color -> Props StatusBar handler
backgroundColor = prop "backgroundColor"

-- Platform: Android
translucent :: Bool -> Props StatusBar handler
translucent = prop "translucent"

-- Platform: IOS
networkActivityIndicatorVisible :: Bool -> Props StatusBar handler
networkActivityIndicatorVisible = prop "networkActivityIndicatorVisible"

-- Platform: IOS
showHideTransition :: ShowHideTransition -> Props StatusBar handler
showHideTransition = prop "showHideTransition"

-- TODO: Methods
