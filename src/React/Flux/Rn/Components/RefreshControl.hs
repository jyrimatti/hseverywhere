{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.Components.RefreshControl where

import           Numeric.Natural
import           Prelude              (Bool, String)
import           React.Flux
import           React.Flux.Rn.Events
import           React.Flux.Rn.Types

-- Required
refreshing :: Bool -> PropertyOrHandler handler
refreshing = (&=) "refreshing"

onRefresh :: EventHandlerType handler -> PropertyOrHandler handler
onRefresh = on0 "onRefresh"

-- Platform: Android
colors :: [Color] {-nonempty-} -> PropertyOrHandler handler
colors = (&=) "colors"

-- Platform: Android
enabled :: Bool -> PropertyOrHandler handler
enabled = (&=) "enabled"

-- Platform: Android
progressBackgroundColor :: Color -> PropertyOrHandler handler
progressBackgroundColor = (&=) "progressBackgroundColor"

-- Platform: Android
progressViewOffset :: Natural -> PropertyOrHandler handler
progressViewOffset = (&=) "progressViewOffset"

-- Platform: Android
size :: RefreshControlSize -> PropertyOrHandler handler
size = (&=) "size"

-- Platform: IOS
tintColor :: Color -> PropertyOrHandler handler
tintColor = (&=) "tintColor"

-- Platform: IOS
title :: String -> PropertyOrHandler handler
title = (&=) "title"

-- Platform: IOS
titleColor :: Color -> PropertyOrHandler handler
titleColor = (&=) "titleColor"

-- TODO: ViewProps
