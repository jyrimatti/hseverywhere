{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.Components.Button where

import           Prelude                  (Bool, String)
import           React.Flux
import           React.Flux.Rn.Components (Props, prop, Button)
import           React.Flux.Rn.Events
import           React.Flux.Rn.Style

-- Required
onPress :: EventHandlerType handler -> Props Button handler
onPress = on0 "onPress"

-- Required
title :: String -> Props Button handler
title = prop "title"

accessibilityLabel :: String -> Props Button handler
accessibilityLabel = prop "accessibilityLabel"

color :: Color -> Props Button handler
color = prop "color"

disabled :: Bool -> Props Button handler
disabled = prop "disabled"

testID :: String -> Props Button handler
testID = prop "testID"

-- Platform: AppleTV
hasTVPreferredFocus :: Bool -> Props Button handler
hasTVPreferredFocus = prop "hasTVPreferredFocus"
