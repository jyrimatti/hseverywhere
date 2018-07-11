{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.TabBarIOS_Item where

import           Prelude              (Bool, Either (..), Int, String)
import           React.Flux
import           React.Flux.Rn.Events
import           React.Flux.Rn.Types  hiding (Left, Right)

selected :: Bool -> PropertyOrHandler handler
selected = (&=) "selected"

badge :: Either String Int -> PropertyOrHandler handler
badge (Left x)  = "badge" &= x
badge (Right x) = "badge" &= x

icon :: ImageSource -> PropertyOrHandler handler
icon = (&=) "icon"

onPress :: EventHandlerType handler -> PropertyOrHandler handler
onPress = on0 "onPress"

renderAsOriginal :: Bool -> PropertyOrHandler handler
renderAsOriginal = (&=) "renderAsOriginal"

badgeColor :: Color -> PropertyOrHandler handler
badgeColor = (&=) "badgeColor"

selectedIcon :: ImageSource -> PropertyOrHandler handler
selectedIcon = (&=) "selectedIcon"

style :: ViewStyleProps -> PropertyOrHandler handler
style = nestedProperty "style"

systemIcon :: TabBarSystemIcon -> PropertyOrHandler handler
systemIcon = (&=) "systemIcon"

title :: String -> PropertyOrHandler handler
title = (&=) "title"

-- Platform: IOS
isTVSelectable :: Bool -> PropertyOrHandler handler
isTVSelectable = (&=) "isTVSelectable"

-- TODO: ViewProps
