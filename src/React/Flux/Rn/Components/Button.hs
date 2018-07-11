{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.Components.Button where

import           Prelude              (Bool, String)
import           React.Flux
import           React.Flux.Rn.Events
import           React.Flux.Rn.Style

-- Required
onPress :: EventHandlerType handler -> PropertyOrHandler handler
onPress = on0 "onPress"

-- Required
title :: String -> PropertyOrHandler handler
title = (&=) "title"

accessibilityLabel :: String -> PropertyOrHandler handler
accessibilityLabel = (&=) "accessibilityLabel"

color :: Color -> PropertyOrHandler handler
color = (&=) "color"

disabled :: Bool -> PropertyOrHandler handler
disabled = (&=) "disabled"

testID :: String -> PropertyOrHandler handler
testID = (&=) "testID"

-- Platform: AppleTV
hasTVPreferredFocus :: Bool -> PropertyOrHandler handler
hasTVPreferredFocus = (&=) "hasTVPreferredFocus"
