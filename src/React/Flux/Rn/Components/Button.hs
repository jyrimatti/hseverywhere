{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.Components.Button (
    module React.Flux.Rn.Components.Button,
    Color(..)
) where

import           Prelude                  (Bool, String, fmap)
import           Prelude                  ((.))
import           React.Flux               (ReactElementM, foreign_)
import           React.Flux.Rn.Events     (EventHandlerType, on0)
import           React.Flux.Rn.Properties (Props, prop, props)
import           React.Flux.Rn.Types      (Color (..))

data Button
button :: [Props Button handler] -> ReactElementM handler a -> ReactElementM handler a
button = foreign_ "Button" . fmap props

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
