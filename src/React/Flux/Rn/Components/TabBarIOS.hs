{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.TabBarIOS (
    module React.Flux.Rn.Components.TabBarIOS,
    BarStyle(..), Color(..),
    ItemPositioning(..),
    ViewProps.AccessibilityComponentTypes(..),
    ViewProps.AccessibilityLiveRegion(..),
    ViewProps.AccessibilityTraits(..),
    ViewProps.ImportantForAccessibility(..),
    ViewProps.Inset(Inset),
    ViewProps.OnLayout(OnLayout),
    ViewProps.PointerEvents(..),
    ViewProps.SyntheticTouchEvent(SyntheticTouchEvent)
) where

import           Prelude                       (Bool)
import           React.Flux                    (ReactElementM, foreign_)
import           Prelude                       ((.))
import           React.Flux.Rn.Properties      (Props, prop, props)
import           Prelude                       (fmap)
import qualified React.Flux.Rn.Props.ViewProps as ViewProps
import           React.Flux.Rn.Types           (BarStyle (..), Color (..),
                                                ItemPositioning (..))

data TabBarIOS
tabBarIOS :: [Props TabBarIOS handler] -> ReactElementM handler a -> ReactElementM handler a
tabBarIOS = foreign_ "TabBarIOS" . fmap props

barStyle :: BarStyle -> Props TabBarIOS handler
barStyle = prop "barStyle"

barTintColor :: Color -> Props TabBarIOS handler
barTintColor = prop "barTintColor"

itemPositioning :: ItemPositioning -> Props TabBarIOS handler
itemPositioning = prop "itemPositioning"

tintColor :: Color -> Props TabBarIOS handler
tintColor = prop "tintColor"

translucent :: Bool -> Props TabBarIOS handler
translucent = prop "translucent"

unselectedItemTintColor :: Color -> Props TabBarIOS handler
unselectedItemTintColor = prop "unselectedItemTintColor"

unselectedTintColor :: Color -> Props TabBarIOS handler
unselectedTintColor = prop "unselectedTintColor"

-- ViewProps:

onStartShouldSetResponder        = ViewProps.onStartShouldSetResponder @TabBarIOS
accessibilityLabel               = ViewProps.accessibilityLabel @TabBarIOS
hitSlop                          = ViewProps.hitSlop @TabBarIOS
nativeID                         = ViewProps.nativeID @TabBarIOS
onAccessibilityTap               = ViewProps.onAccessibilityTap @TabBarIOS
onLayout                         = ViewProps.onLayout @TabBarIOS
onMagicTap                       = ViewProps.onMagicTap @TabBarIOS
onMoveShouldSetResponder         = ViewProps.onMoveShouldSetResponder @TabBarIOS
onMoveShouldSetResponderCapture  = ViewProps.onMoveShouldSetResponderCapture @TabBarIOS
onResponderGrant                 = ViewProps.onResponderGrant @TabBarIOS
onResponderMove                  = ViewProps.onResponderMove @TabBarIOS
onResponderReject                = ViewProps.onResponderReject @TabBarIOS
onResponderRelease               = ViewProps.onResponderRelease @TabBarIOS
onResponderTerminate             = ViewProps.onResponderTerminate @TabBarIOS
onResponderTerminationRequest    = ViewProps.onResponderTerminationRequest @TabBarIOS
accessible                       = ViewProps.accessible @TabBarIOS
onStartShouldSetResponderCapture = ViewProps.onStartShouldSetResponderCapture @TabBarIOS
pointerEvents                    = ViewProps.pointerEvents @TabBarIOS
removeClippedSubviews            = ViewProps.removeClippedSubviews @TabBarIOS
style                            = ViewProps.style @TabBarIOS
testID                           = ViewProps.testID @TabBarIOS
accessibilityComponentType       = ViewProps.accessibilityComponentType @TabBarIOS
accessibilityLiveRegion          = ViewProps.accessibilityLiveRegion @TabBarIOS
collapsable                      = ViewProps.collapsable @TabBarIOS
importantForAccessibility        = ViewProps.importantForAccessibility @TabBarIOS
needsOffscreenAlphaCompositing   = ViewProps.needsOffscreenAlphaCompositing @TabBarIOS
renderToHardwareTextureAndroid   = ViewProps.renderToHardwareTextureAndroid @TabBarIOS
accessibilityTraits              = ViewProps.accessibilityTraits @TabBarIOS
accessibilityViewIsModal         = ViewProps.accessibilityViewIsModal @TabBarIOS
shouldRasterizeIOS               = ViewProps.shouldRasterizeIOS @TabBarIOS

