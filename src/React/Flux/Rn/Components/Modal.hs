{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.Components.Modal (
    module React.Flux.Rn.Components.Modal,
    AnimationType(..), SupportedOrientations(..), PresentationStyle(..)
) where

import           Prelude                  (Bool)
import           React.Flux.Rn.Components (Modal, Props, prop)
import           React.Flux.Rn.Events     (EventHandlerType, on0)
import           React.Flux.Rn.Types      (AnimationType (..),
                                           PresentationStyle (..),
                                           SupportedOrientations (..))

visible :: Bool -> Props Modal handler
visible = prop "visible"

-- Platform: IOS
supportedOrientations :: SupportedOrientations -> Props Modal handler
supportedOrientations = prop "supportedOrientations"

onRequestClose :: EventHandlerType handler -> Props Modal handler
onRequestClose = on0 "onRequestClose"

onShow :: EventHandlerType handler -> Props Modal handler
onShow = on0 "onShow"

transparent :: Bool -> Props Modal handler
transparent = prop "transparent"

animationType :: AnimationType -> Props Modal handler
animationType = prop "animationType"

-- Platform: Android
hardwareAccelerated :: Bool -> Props Modal handler
hardwareAccelerated = prop "hardwareAccelerated"

-- Platform: IOS
onDismiss :: EventHandlerType handler -> Props Modal handler
onDismiss = on0 "onDismiss"

-- Platform: IOS
onOrientationChange :: EventHandlerType handler -> Props Modal handler
onOrientationChange = on0 "onOrientationChange"

-- Platform: IOS
presentationStyle :: PresentationStyle -> Props Modal handler
presentationStyle = prop "presentationStyle"
