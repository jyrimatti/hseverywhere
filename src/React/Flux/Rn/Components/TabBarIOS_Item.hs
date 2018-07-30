{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.TabBarIOS_Item (
    module React.Flux.Rn.Components.TabBarIOS_Item,
    Color(..), ImageSource(..),
    TabBarSystemIcon(..),
    ViewProps.AccessibilityComponentTypes(..),
    ViewProps.AccessibilityLiveRegion(..),
    ViewProps.AccessibilityTraits(..),
    ViewProps.ImportantForAccessibility(..),
    ViewProps.Inset(Inset),
    ViewProps.OnLayout(OnLayout),
    ViewProps.PointerEvents(..),
    ViewProps.SyntheticTouchEvent(SyntheticTouchEvent)
) where

import           Prelude                       (Bool, Either (..), Int, String)
import           Prelude                       (fmap)
import           Prelude                       ((.))
import           React.Flux                    (ReactElementM, foreign_)
import           React.Flux.Rn.Events          (EventHandlerType, on0)
import           React.Flux.Rn.Properties      (Props, prop, props)
import qualified React.Flux.Rn.Props.ViewProps as ViewProps
import           React.Flux.Rn.Types           (Color (..), ImageSource (..),
                                                TabBarSystemIcon (..))

{-# ANN module ("HLint: ignore Use camelCase" :: String) #-}

data TabBarIOS_Item
tabBarIOS_Item :: [Props TabBarIOS_Item handler] -> ReactElementM handler a -> ReactElementM handler a
tabBarIOS_Item = foreign_ "TabBarIOS_Item" . fmap props

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

