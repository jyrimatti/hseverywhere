{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.RefreshControl (
    module React.Flux.Rn.Components.RefreshControl,
    Color(..), RefreshControlSize(..),
    ViewProps.AccessibilityComponentTypes(..),
    ViewProps.AccessibilityLiveRegion(..),
    ViewProps.AccessibilityTraits(..),
    ViewProps.ImportantForAccessibility(..),
    ViewProps.Inset(Inset),
    ViewProps.OnLayout(OnLayout),
    ViewProps.PointerEvents(..),
    ViewProps.SyntheticTouchEvent(SyntheticTouchEvent)
) where

import           Data.List.NonEmpty            (NonEmpty)
import           Numeric.Natural               (Natural)
import           Prelude                       (Bool, String)
import           React.Flux.Rn.Components      (Props, RefreshControl, prop)
import           React.Flux.Rn.Events          (EventHandlerType, on0)
import qualified React.Flux.Rn.Props.ViewProps as ViewProps
import           React.Flux.Rn.Types           (Color (..),
                                                RefreshControlSize (..))

-- Required
refreshing :: Bool -> Props RefreshControl handler
refreshing = prop "refreshing"

onRefresh :: EventHandlerType handler -> Props RefreshControl handler
onRefresh = on0 "onRefresh"

-- Platform: Android
colors :: NonEmpty Color -> Props RefreshControl handler
colors = prop "colors"

-- Platform: Android
enabled :: Bool -> Props RefreshControl handler
enabled = prop "enabled"

-- Platform: Android
progressBackgroundColor :: Color -> Props RefreshControl handler
progressBackgroundColor = prop "progressBackgroundColor"

-- Platform: Android
progressViewOffset :: Natural -> Props RefreshControl handler
progressViewOffset = prop "progressViewOffset"

-- Platform: Android
size :: RefreshControlSize -> Props RefreshControl handler
size = prop "size"

-- Platform: IOS
tintColor :: Color -> Props RefreshControl handler
tintColor = prop "tintColor"

-- Platform: IOS
title :: String -> Props RefreshControl handler
title = prop "title"

-- Platform: IOS
titleColor :: Color -> Props RefreshControl handler
titleColor = prop "titleColor"

-- ViewProps:

onStartShouldSetResponder        = ViewProps.onStartShouldSetResponder @RefreshControl
accessibilityLabel               = ViewProps.accessibilityLabel @RefreshControl
hitSlop                          = ViewProps.hitSlop @RefreshControl
nativeID                         = ViewProps.nativeID @RefreshControl
onAccessibilityTap               = ViewProps.onAccessibilityTap @RefreshControl
onLayout                         = ViewProps.onLayout @RefreshControl
onMagicTap                       = ViewProps.onMagicTap @RefreshControl
onMoveShouldSetResponder         = ViewProps.onMoveShouldSetResponder @RefreshControl
onMoveShouldSetResponderCapture  = ViewProps.onMoveShouldSetResponderCapture @RefreshControl
onResponderGrant                 = ViewProps.onResponderGrant @RefreshControl
onResponderMove                  = ViewProps.onResponderMove @RefreshControl
onResponderReject                = ViewProps.onResponderReject @RefreshControl
onResponderRelease               = ViewProps.onResponderRelease @RefreshControl
onResponderTerminate             = ViewProps.onResponderTerminate @RefreshControl
onResponderTerminationRequest    = ViewProps.onResponderTerminationRequest @RefreshControl
accessible                       = ViewProps.accessible @RefreshControl
onStartShouldSetResponderCapture = ViewProps.onStartShouldSetResponderCapture @RefreshControl
pointerEvents                    = ViewProps.pointerEvents @RefreshControl
removeClippedSubviews            = ViewProps.removeClippedSubviews @RefreshControl
style                            = ViewProps.style @RefreshControl
testID                           = ViewProps.testID @RefreshControl
accessibilityComponentType       = ViewProps.accessibilityComponentType @RefreshControl
accessibilityLiveRegion          = ViewProps.accessibilityLiveRegion @RefreshControl
collapsable                      = ViewProps.collapsable @RefreshControl
importantForAccessibility        = ViewProps.importantForAccessibility @RefreshControl
needsOffscreenAlphaCompositing   = ViewProps.needsOffscreenAlphaCompositing @RefreshControl
renderToHardwareTextureAndroid   = ViewProps.renderToHardwareTextureAndroid @RefreshControl
accessibilityTraits              = ViewProps.accessibilityTraits @RefreshControl
accessibilityViewIsModal         = ViewProps.accessibilityViewIsModal @RefreshControl
shouldRasterizeIOS               = ViewProps.shouldRasterizeIOS @RefreshControl

