{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.Components.Modal where

import           Prelude
import           React.Flux
import           React.Flux.Rn.Events
import           React.Flux.Rn.Types

visible :: Bool -> PropertyOrHandler handler
visible = (&=) "visible"

-- Platform: IOS
supportedOrientations :: SupportedOrientations -> PropertyOrHandler handler
supportedOrientations = (&=) "supportedOrientations"

onRequestClose :: EventHandlerType handler -> PropertyOrHandler handler
onRequestClose = on0 "onRequestClose"

onShow :: EventHandlerType handler -> PropertyOrHandler handler
onShow = on0 "onShow"

transparent :: Bool -> PropertyOrHandler handler
transparent = (&=) "transparent"

animationType :: AnimationType -> PropertyOrHandler handler
animationType = (&=) "animationType"

-- Platform: Android
hardwareAccelerated :: Bool -> PropertyOrHandler handler
hardwareAccelerated = (&=) "hardwareAccelerated"

-- Platform: IOS
onDismiss :: EventHandlerType handler -> PropertyOrHandler handler
onDismiss = on0 "onDismiss"

-- Platform: IOS
onOrientationChange :: EventHandlerType handler -> PropertyOrHandler handler
onOrientationChange = on0 "onOrientationChange"

-- Platform: IOS
presentationStyle :: PresentationStyle -> PropertyOrHandler handler
presentationStyle = (&=) "presentationStyle"
