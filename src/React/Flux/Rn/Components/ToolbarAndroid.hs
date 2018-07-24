{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.ToolbarAndroid where

import           Data.Aeson                    (FromJSON, ToJSON (..))
import           Data.Aeson.Types              (parseJSON, parseMaybe)
import           GHC.Generics
import           GHCJS.Marshal                 (FromJSVal (..), ToJSVal (..))
import           Numeric.Natural
import           Prelude                       (Bool, Int, Show, String, pure,
                                                (<$>), (>>=))
import           React.Flux
import           React.Flux.Rn.Components      (Props, ToolbarAndroid, prop)
import           React.Flux.Rn.Events
import qualified React.Flux.Rn.Props.ViewProps as ViewProps
import           React.Flux.Rn.Types

overflowIcon :: ImageSource -> Props ToolbarAndroid handler
overflowIcon = prop "overflowIcon"

actions :: [Action] -> Props ToolbarAndroid handler
actions = prop "actions"

contentInsetStart :: Int -> Props ToolbarAndroid handler
contentInsetStart = prop "contentInsetStart"

logo :: ImageSource -> Props ToolbarAndroid handler
logo = prop "logo"

navIcon :: ImageSource -> Props ToolbarAndroid handler
navIcon = prop "navIcon"

onActionSelected :: (Natural -> EventHandlerType handler) -> Props ToolbarAndroid handler
onActionSelected = on1 "onActionSelected"

onIconClicked :: EventHandlerType handler -> Props ToolbarAndroid handler
onIconClicked = on0 "onIconClicked"

contentInsetEnd :: Int -> Props ToolbarAndroid handler
contentInsetEnd = prop "contentInsetEnd"

rtl :: Bool -> Props ToolbarAndroid handler
rtl = prop "rtl"

subtitle :: String -> Props ToolbarAndroid handler
subtitle = prop "subtitle"

subtitleColor :: Color -> Props ToolbarAndroid handler
subtitleColor = prop "subtitleColor"

title :: String -> Props ToolbarAndroid handler
title = prop "title"

titleColor :: Color -> Props ToolbarAndroid handler
titleColor = prop "titleColor"

-- ViewProps:

onStartShouldSetResponder        = ViewProps.onStartShouldSetResponder @ToolbarAndroid
accessibilityLabel               = ViewProps.accessibilityLabel @ToolbarAndroid
hitSlop                          = ViewProps.hitSlop @ToolbarAndroid
nativeID                         = ViewProps.nativeID @ToolbarAndroid
onAccessibilityTap               = ViewProps.onAccessibilityTap @ToolbarAndroid
onLayout                         = ViewProps.onLayout @ToolbarAndroid
onMagicTap                       = ViewProps.onMagicTap @ToolbarAndroid
onMoveShouldSetResponder         = ViewProps.onMoveShouldSetResponder @ToolbarAndroid
onMoveShouldSetResponderCapture  = ViewProps.onMoveShouldSetResponderCapture @ToolbarAndroid
onResponderGrant                 = ViewProps.onResponderGrant @ToolbarAndroid
onResponderMove                  = ViewProps.onResponderMove @ToolbarAndroid
onResponderReject                = ViewProps.onResponderReject @ToolbarAndroid
onResponderRelease               = ViewProps.onResponderRelease @ToolbarAndroid
onResponderTerminate             = ViewProps.onResponderTerminate @ToolbarAndroid
onResponderTerminationRequest    = ViewProps.onResponderTerminationRequest @ToolbarAndroid
accessible                       = ViewProps.accessible @ToolbarAndroid
onStartShouldSetResponderCapture = ViewProps.onStartShouldSetResponderCapture @ToolbarAndroid
pointerEvents                    = ViewProps.pointerEvents @ToolbarAndroid
removeClippedSubviews            = ViewProps.removeClippedSubviews @ToolbarAndroid
style                            = ViewProps.style @ToolbarAndroid
testID                           = ViewProps.testID @ToolbarAndroid
accessibilityComponentType       = ViewProps.accessibilityComponentType @ToolbarAndroid
accessibilityLiveRegion          = ViewProps.accessibilityLiveRegion @ToolbarAndroid
collapsable                      = ViewProps.collapsable @ToolbarAndroid
importantForAccessibility        = ViewProps.importantForAccessibility @ToolbarAndroid
needsOffscreenAlphaCompositing   = ViewProps.needsOffscreenAlphaCompositing @ToolbarAndroid
renderToHardwareTextureAndroid   = ViewProps.renderToHardwareTextureAndroid @ToolbarAndroid
accessibilityTraits              = ViewProps.accessibilityTraits @ToolbarAndroid
accessibilityViewIsModal         = ViewProps.accessibilityViewIsModal @ToolbarAndroid
shouldRasterizeIOS               = ViewProps.shouldRasterizeIOS @ToolbarAndroid

