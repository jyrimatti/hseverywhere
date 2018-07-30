{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.NavigatorIOS (
    module React.Flux.Rn.Components.NavigatorIOS,
    BarStyle(..), Color(..), Route(Route)
) where

import           Prelude                  (Bool)
import           React.Flux               (ReactElementM, foreign_)
import React.Flux.Rn.Components.View (View)
import           Prelude                       (fmap)
import           Prelude                       ((.))
import           React.Flux.Rn.Properties (Props, Styles, nestedProp,
                                           prop, props)
import           React.Flux.Rn.Types      (BarStyle (..), Color (..),
                                           Route (Route))

data NavigatorIOS
navigatorIOS :: [Props NavigatorIOS handler] -> ReactElementM handler a -> ReactElementM handler a
navigatorIOS = foreign_ "NavigatorIOS" . fmap props

-- Required
initialRoute :: Route -> Props NavigatorIOS handler
initialRoute = prop "initialRoute"

barStyle :: BarStyle -> Props NavigatorIOS handler
barStyle = prop "barStyle"

barTintColor :: Color -> Props NavigatorIOS handler
barTintColor = prop "barTintColor"

interactivePopGestureEnabled :: Bool -> Props NavigatorIOS handler
interactivePopGestureEnabled = prop "interactivePopGestureEnabled"

itemWrapperStyle :: [Styles View handler] -> Props NavigatorIOS handler
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
