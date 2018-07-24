{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.TabBarIOS_Item where

import           Prelude                       (Bool, Either (..), Int, String)
import           React.Flux
import           React.Flux.Rn.Components      (Props, TabBarIOS_Item, prop)
import           React.Flux.Rn.Events
import qualified React.Flux.Rn.Props.ViewProps as ViewProps
import           React.Flux.Rn.Types           hiding (Left, Right)

selected :: Bool -> Props TabBarIOS_Item handler
selected = prop "selected"

badge :: Either String Int -> Props TabBarIOS_Item handler
badge (Left x)  = prop "badge" x
badge (Right x) = prop "badge" x

icon :: ImageSource -> Props TabBarIOS_Item handler
icon = prop "icon"

onPress :: EventHandlerType handler -> Props TabBarIOS_Item handler
onPress = on0 "onPress"

renderAsOriginal :: Bool -> Props TabBarIOS_Item handler
renderAsOriginal = prop "renderAsOriginal"

badgeColor :: Color -> Props TabBarIOS_Item handler
badgeColor = prop "badgeColor"

selectedIcon :: ImageSource -> Props TabBarIOS_Item handler
selectedIcon = prop "selectedIcon"

systemIcon :: TabBarSystemIcon -> Props TabBarIOS_Item handler
systemIcon = prop "systemIcon"

title :: String -> Props TabBarIOS_Item handler
title = prop "title"

-- Platform: IOS
isTVSelectable :: Bool -> Props TabBarIOS_Item handler
isTVSelectable = prop "isTVSelectable"

-- ViewProps:

onStartShouldSetResponder        = ViewProps.onStartShouldSetResponder @TabBarIOS_Item
accessibilityLabel               = ViewProps.accessibilityLabel @TabBarIOS_Item
hitSlop                          = ViewProps.hitSlop @TabBarIOS_Item
nativeID                         = ViewProps.nativeID @TabBarIOS_Item
onAccessibilityTap               = ViewProps.onAccessibilityTap @TabBarIOS_Item
onLayout                         = ViewProps.onLayout @TabBarIOS_Item
onMagicTap                       = ViewProps.onMagicTap @TabBarIOS_Item
onMoveShouldSetResponder         = ViewProps.onMoveShouldSetResponder @TabBarIOS_Item
onMoveShouldSetResponderCapture  = ViewProps.onMoveShouldSetResponderCapture @TabBarIOS_Item
onResponderGrant                 = ViewProps.onResponderGrant @TabBarIOS_Item
onResponderMove                  = ViewProps.onResponderMove @TabBarIOS_Item
onResponderReject                = ViewProps.onResponderReject @TabBarIOS_Item
onResponderRelease               = ViewProps.onResponderRelease @TabBarIOS_Item
onResponderTerminate             = ViewProps.onResponderTerminate @TabBarIOS_Item
onResponderTerminationRequest    = ViewProps.onResponderTerminationRequest @TabBarIOS_Item
accessible                       = ViewProps.accessible @TabBarIOS_Item
onStartShouldSetResponderCapture = ViewProps.onStartShouldSetResponderCapture @TabBarIOS_Item
pointerEvents                    = ViewProps.pointerEvents @TabBarIOS_Item
removeClippedSubviews            = ViewProps.removeClippedSubviews @TabBarIOS_Item
style                            = ViewProps.style @TabBarIOS_Item
testID                           = ViewProps.testID @TabBarIOS_Item
accessibilityComponentType       = ViewProps.accessibilityComponentType @TabBarIOS_Item
accessibilityLiveRegion          = ViewProps.accessibilityLiveRegion @TabBarIOS_Item
collapsable                      = ViewProps.collapsable @TabBarIOS_Item
importantForAccessibility        = ViewProps.importantForAccessibility @TabBarIOS_Item
needsOffscreenAlphaCompositing   = ViewProps.needsOffscreenAlphaCompositing @TabBarIOS_Item
renderToHardwareTextureAndroid   = ViewProps.renderToHardwareTextureAndroid @TabBarIOS_Item
accessibilityTraits              = ViewProps.accessibilityTraits @TabBarIOS_Item
accessibilityViewIsModal         = ViewProps.accessibilityViewIsModal @TabBarIOS_Item
shouldRasterizeIOS               = ViewProps.shouldRasterizeIOS @TabBarIOS_Item

