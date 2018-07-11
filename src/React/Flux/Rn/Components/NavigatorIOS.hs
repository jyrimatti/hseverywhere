{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.NavigatorIOS where

import           Prelude             (Bool)
import           React.Flux
import           React.Flux.Rn.Types

-- Required
initialRoute :: Route -> PropertyOrHandler handler
initialRoute = (&=) "initialRoute"

barStyle :: BarStyle -> PropertyOrHandler handler
barStyle = (&=) "barStyle"

barTintColor :: Color -> PropertyOrHandler handler
barTintColor = (&=) "barTintColor"

interactivePopGestureEnabled :: Bool -> PropertyOrHandler handler
interactivePopGestureEnabled = (&=) "interactivePopGestureEnabled"

itemWrapperStyle :: ViewStyleProps -> PropertyOrHandler handler
itemWrapperStyle = nestedProperty "itemWrapperStyle"

navigationBarHidden :: Bool -> PropertyOrHandler handler
navigationBarHidden = (&=) "navigationBarHidden"

shadowHidden :: Bool -> PropertyOrHandler handler
shadowHidden = (&=) "shadowHidden"

tintColor :: Color -> PropertyOrHandler handler
tintColor = (&=) "tintColor"

titleTextColor :: Color -> PropertyOrHandler handler
titleTextColor = (&=) "titleTextColor"

translucent :: Bool -> PropertyOrHandler handler
translucent = (&=) "translucent"

-- TODO: methods
