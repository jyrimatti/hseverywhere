{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.TabBarIOS where

import           Prelude             (Bool)
import           React.Flux
import           React.Flux.Rn.Types

barStyle :: BarStyle -> PropertyOrHandler handler
barStyle = (&=) "barStyle"

barTintColor :: Color -> PropertyOrHandler handler
barTintColor = (&=) "barTintColor"

itemPositioning :: ItemPositioning -> PropertyOrHandler handler
itemPositioning = (&=) "itemPositioning"

style :: ViewStyleProps -> PropertyOrHandler handler
style = nestedProperty "style"

tintColor :: Color -> PropertyOrHandler handler
tintColor = (&=) "tintColor"

translucent :: Bool -> PropertyOrHandler handler
translucent = (&=) "translucent"

unselectedItemTintColor :: Color -> PropertyOrHandler handler
unselectedItemTintColor = (&=) "unselectedItemTintColor"

unselectedTintColor :: Color -> PropertyOrHandler handler
unselectedTintColor = (&=) "unselectedTintColor"

-- TODO: ViewProps
