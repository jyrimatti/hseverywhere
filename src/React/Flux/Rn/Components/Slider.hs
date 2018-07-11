{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.Slider where

import           Numeric.Natural
import           Prelude              (Bool, Int, String)
import           React.Flux
import           React.Flux.Rn.Events
import           React.Flux.Rn.Types

style :: ViewStyleProps -> PropertyOrHandler handler
style = nestedProperty "style"

disabled :: Bool -> PropertyOrHandler handler
disabled = (&=) "disabled"

maximumValue :: Int -> PropertyOrHandler handler
maximumValue = (&=) "maximumValue"

minimumTrackTintColor :: Color -> PropertyOrHandler handler
minimumTrackTintColor = (&=) "minimumTrackTintColor"

minimumValue :: Int -> PropertyOrHandler handler
minimumValue = (&=) "minimumValue"

onSlidingComplete :: (Int -> EventHandlerType handler) -> PropertyOrHandler handler
onSlidingComplete = on1 "onSlidingComplete"

onValueChange :: (Int -> EventHandlerType handler) -> PropertyOrHandler handler
onValueChange = on1 "onValueChange"

step :: Natural -> PropertyOrHandler handler
step = (&=) "step"

maximumTrackTintColor :: Color -> PropertyOrHandler handler
maximumTrackTintColor = (&=) "maximumTrackTintColor"

testID :: String -> PropertyOrHandler handler
testID = (&=) "testID"

value :: Int -> PropertyOrHandler handler
value = (&=) "value"

-- Platform: Android
thumbTintColor :: Color -> PropertyOrHandler handler
thumbTintColor = (&=) "thumbTintColor"

-- Platform: IOS
maximumTrackImage :: ImageSource -> PropertyOrHandler handler
maximumTrackImage = (&=) "maximumTrackImage"

-- Platform: IOS
minimumTrackImage :: ImageSource -> PropertyOrHandler handler
minimumTrackImage = (&=) "minimumTrackImage"

-- Platform: IOS
thumbImage :: ImageSource -> PropertyOrHandler handler
thumbImage = (&=) "thumbImage"

trackImage :: ImageSource -> PropertyOrHandler handler
trackImage = (&=) "trackImage"

-- TODO: ViewProps
