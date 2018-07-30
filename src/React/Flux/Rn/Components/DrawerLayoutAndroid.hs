{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.DrawerLayoutAndroid (
    module React.Flux.Rn.Components.DrawerLayoutAndroid,
    Color(..), DrawerLockMode(..), DrawerPosition(..), KeyboardDismissMode(..),
    ViewProps.AccessibilityComponentTypes(..),
    ViewProps.AccessibilityLiveRegion(..),
    ViewProps.AccessibilityTraits(..),
    ViewProps.ImportantForAccessibility(..),
    ViewProps.Inset(Inset),
    ViewProps.OnLayout(OnLayout),
    ViewProps.PointerEvents(..),
    ViewProps.SyntheticTouchEvent(SyntheticTouchEvent)
) where

import           Data.Typeable                 (Typeable)
import           Numeric.Natural               (Natural)
import           Prelude                       ((.))
import           Prelude                       (fmap)
import           React.Flux                    (ReactElementM, foreign_)
import           React.Flux.Rn.Events          (EventHandlerType, on0)
import           React.Flux.Rn.Properties      (Props, prop, props)
import qualified React.Flux.Rn.Props.ViewProps as ViewProps
import           React.Flux.Rn.Types           (Color (..), DrawerLockMode (..),
                                                DrawerPosition (..),
                                                KeyboardDismissMode (..),
                                                ReactViewRef)

data DrawerLayoutAndroid
drawerLayoutAndroid :: [Props DrawerLayoutAndroid handler] -> ReactElementM handler a -> ReactElementM handler a
drawerLayoutAndroid = foreign_ "DrawerLayoutAndroid" . fmap props


-- Required
renderNavigationView :: Typeable props => ReactViewRef props -> Props DrawerLayoutAndroid handler
renderNavigationView = prop "renderNavigationView"

onDrawerClose :: EventHandlerType handler -> Props DrawerLayoutAndroid handler
onDrawerClose = on0 "onDrawerClose"

drawerPosition :: DrawerPosition -> Props DrawerLayoutAndroid handler
drawerPosition = prop "drawerPosition"

drawerWidth :: Natural -> Props DrawerLayoutAndroid handler
drawerWidth = prop "drawerWidth"

keyboardDismissMode :: KeyboardDismissMode -> Props DrawerLayoutAndroid handler
keyboardDismissMode = prop "keyboardDismissMode"

drawerLockMode :: DrawerLockMode -> Props DrawerLayoutAndroid handler
drawerLockMode = prop "drawerLockMode"

onDrawerOpen :: EventHandlerType handler -> Props DrawerLayoutAndroid handler
onDrawerOpen = on0 "onDrawerOpen"

onDrawerSlide :: EventHandlerType handler -> Props DrawerLayoutAndroid handler
onDrawerSlide = on0 "onDrawerSlide"

onDrawerStateChanged :: EventHandlerType handler -> Props DrawerLayoutAndroid handler
onDrawerStateChanged = on0 "onDrawerStateChanged"

drawerBackgroundColor :: Color -> Props DrawerLayoutAndroid handler
drawerBackgroundColor = prop "drawerBackgroundColor"

statusBarBackgroundColor :: Color -> Props DrawerLayoutAndroid handler
statusBarBackgroundColor = prop "statusBarBackgroundColor"

-- ViewProps:

onStartShouldSetResponder        = ViewProps.onStartShouldSetResponder @DrawerLayoutAndroid
accessibilityLabel               = ViewProps.accessibilityLabel @DrawerLayoutAndroid
hitSlop                          = ViewProps.hitSlop @DrawerLayoutAndroid
nativeID                         = ViewProps.nativeID @DrawerLayoutAndroid
onAccessibilityTap               = ViewProps.onAccessibilityTap @DrawerLayoutAndroid
onLayout                         = ViewProps.onLayout @DrawerLayoutAndroid
onMagicTap                       = ViewProps.onMagicTap @DrawerLayoutAndroid
onMoveShouldSetResponder         = ViewProps.onMoveShouldSetResponder @DrawerLayoutAndroid
onMoveShouldSetResponderCapture  = ViewProps.onMoveShouldSetResponderCapture @DrawerLayoutAndroid
onResponderGrant                 = ViewProps.onResponderGrant @DrawerLayoutAndroid
onResponderMove                  = ViewProps.onResponderMove @DrawerLayoutAndroid
onResponderReject                = ViewProps.onResponderReject @DrawerLayoutAndroid
onResponderRelease               = ViewProps.onResponderRelease @DrawerLayoutAndroid
onResponderTerminate             = ViewProps.onResponderTerminate @DrawerLayoutAndroid
onResponderTerminationRequest    = ViewProps.onResponderTerminationRequest @DrawerLayoutAndroid
accessible                       = ViewProps.accessible @DrawerLayoutAndroid
onStartShouldSetResponderCapture = ViewProps.onStartShouldSetResponderCapture @DrawerLayoutAndroid
pointerEvents                    = ViewProps.pointerEvents @DrawerLayoutAndroid
removeClippedSubviews            = ViewProps.removeClippedSubviews @DrawerLayoutAndroid
style                            = ViewProps.style @DrawerLayoutAndroid
testID                           = ViewProps.testID @DrawerLayoutAndroid
accessibilityComponentType       = ViewProps.accessibilityComponentType @DrawerLayoutAndroid
accessibilityLiveRegion          = ViewProps.accessibilityLiveRegion @DrawerLayoutAndroid
collapsable                      = ViewProps.collapsable @DrawerLayoutAndroid
importantForAccessibility        = ViewProps.importantForAccessibility @DrawerLayoutAndroid
needsOffscreenAlphaCompositing   = ViewProps.needsOffscreenAlphaCompositing @DrawerLayoutAndroid
renderToHardwareTextureAndroid   = ViewProps.renderToHardwareTextureAndroid @DrawerLayoutAndroid
accessibilityTraits              = ViewProps.accessibilityTraits @DrawerLayoutAndroid
accessibilityViewIsModal         = ViewProps.accessibilityViewIsModal @DrawerLayoutAndroid
shouldRasterizeIOS               = ViewProps.shouldRasterizeIOS @DrawerLayoutAndroid


-- TODO: methods
