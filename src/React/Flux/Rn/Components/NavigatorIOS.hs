{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.NavigatorIOS where

import           Prelude                  (Bool)
import           React.Flux
import           React.Flux.Rn.Components (NavigatorIOS, Props, prop)
import           React.Flux.Rn.Types

-- Required
initialRoute :: Route -> Props NavigatorIOS handler
initialRoute = prop "initialRoute"

barStyle :: BarStyle -> Props NavigatorIOS handler
barStyle = prop "barStyle"

barTintColor :: Color -> Props NavigatorIOS handler
barTintColor = prop "barTintColor"

interactivePopGestureEnabled :: Bool -> Props NavigatorIOS handler
interactivePopGestureEnabled = prop "interactivePopGestureEnabled"

itemWrapperStyle :: ViewStyleProps -> Props NavigatorIOS handler
itemWrapperStyle = nestedProp "itemWrapperStyle"

navigationBarHidden :: Bool -> Props NavigatorIOS handler
navigationBarHidden = prop "navigationBarHidden"

shadowHidden :: Bool -> Props NavigatorIOS handler
shadowHidden = prop "shadowHidden"

tintColor :: Color -> Props NavigatorIOS handler
tintColor = prop "tintColor"

titleTextColor :: Color -> Props NavigatorIOS handler
titleTextColor = prop "titleTextColor"

translucent :: Bool -> Props NavigatorIOS handler
translucent = prop "translucent"

-- TODO: methods
