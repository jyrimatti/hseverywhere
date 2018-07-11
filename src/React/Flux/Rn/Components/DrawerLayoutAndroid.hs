{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.Components.DrawerLayoutAndroid where

import           Data.Typeable
import           Numeric.Natural
import           React.Flux
import           React.Flux.Internal  (ReactViewRef)
import           React.Flux.Rn.Events
import           React.Flux.Rn.Types

-- Required
renderNavigationView :: Typeable props => ReactViewRef props -> PropertyOrHandler handler
renderNavigationView = (&=) "renderNavigationView"

onDrawerClose :: EventHandlerType handler -> PropertyOrHandler handler
onDrawerClose = on0 "onDrawerClose"

drawerPosition :: DrawerPosition -> PropertyOrHandler handler
drawerPosition = (&=) "drawerPosition"

drawerWidth :: Natural -> PropertyOrHandler handler
drawerWidth = (&=) "drawerWidth"

keyboardDismissMode :: KeyboardDismissMode -> PropertyOrHandler handler
keyboardDismissMode = (&=) "keyboardDismissMode"

drawerLockMode :: DrawerLockMode -> PropertyOrHandler handler
drawerLockMode = (&=) "drawerLockMode"

onDrawerOpen :: EventHandlerType handler -> PropertyOrHandler handler
onDrawerOpen = on0 "onDrawerOpen"

onDrawerSlide :: EventHandlerType handler -> PropertyOrHandler handler
onDrawerSlide = on0 "onDrawerSlide"

onDrawerStateChanged :: EventHandlerType handler -> PropertyOrHandler handler
onDrawerStateChanged = on0 "onDrawerStateChanged"

drawerBackgroundColor :: Color -> PropertyOrHandler handler
drawerBackgroundColor = (&=) "drawerBackgroundColor"

statusBarBackgroundColor :: Color -> PropertyOrHandler handler
statusBarBackgroundColor = (&=) "statusBarBackgroundColor"

-- TODO: ViewProps

-- TODO: methods
