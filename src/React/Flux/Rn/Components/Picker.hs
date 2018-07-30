{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.Picker (
    module React.Flux.Rn.Components.Picker,
    PickerMode(..),
    ViewProps.AccessibilityComponentTypes(..),
    ViewProps.AccessibilityLiveRegion(..),
    ViewProps.AccessibilityTraits(..),
    ViewProps.ImportantForAccessibility(..),
    ViewProps.Inset(Inset),
    ViewProps.OnLayout(OnLayout),
    ViewProps.PointerEvents(..),
    ViewProps.SyntheticTouchEvent(SyntheticTouchEvent)
) where

import           GHCJS.Marshal                 (FromJSVal, ToJSVal)
import           Numeric.Natural               (Natural)
import           Prelude                       (fmap)
import           Prelude                       (Bool, String)
import           Prelude                       ((.))
import           React.Flux                    (ReactElementM, foreign_)
import           React.Flux.Rn.Components.Text (Text)
import           React.Flux.Rn.Events          (EventHandlerType, on2)
import           React.Flux.Rn.Properties      (Props, Styles, nestedProp, prop,
                                                props)
import qualified React.Flux.Rn.Props.ViewProps as ViewProps
import           React.Flux.Rn.Types           (PickerMode (..))

data Picker
picker :: [Props Picker handler] -> ReactElementM handler a -> ReactElementM handler a
picker = foreign_ "Picker" . fmap props

onValueChange :: FromJSVal value => (value -> Natural -> EventHandlerType handler) -> Props Picker handler
onValueChange = on2 "onValueChange"

selectedValue :: ToJSVal value => value -> Props Picker handler
selectedValue = prop "selectedValue"

-- Platform: Android
enabled :: Bool -> Props Picker handler
enabled = prop "enabled"

-- Platform: Android
mode :: PickerMode -> Props Picker handler
mode = prop "mode"

-- Platform: Android
prompt :: String -> Props Picker handler
prompt = prop "prompt"

-- Platform: IOS
itemStyle :: [Styles Text handler] -> Props Picker handler
itemStyle = nestedProp "itemStyle"

-- ViewProps:

onStartShouldSetResponder        = ViewProps.onStartShouldSetResponder @Picker
accessibilityLabel               = ViewProps.accessibilityLabel @Picker
hitSlop                          = ViewProps.hitSlop @Picker
nativeID                         = ViewProps.nativeID @Picker
onAccessibilityTap               = ViewProps.onAccessibilityTap @Picker
onLayout                         = ViewProps.onLayout @Picker
onMagicTap                       = ViewProps.onMagicTap @Picker
onMoveShouldSetResponder         = ViewProps.onMoveShouldSetResponder @Picker
onMoveShouldSetResponderCapture  = ViewProps.onMoveShouldSetResponderCapture @Picker
onResponderGrant                 = ViewProps.onResponderGrant @Picker
onResponderMove                  = ViewProps.onResponderMove @Picker
onResponderReject                = ViewProps.onResponderReject @Picker
onResponderRelease               = ViewProps.onResponderRelease @Picker
onResponderTerminate             = ViewProps.onResponderTerminate @Picker
onResponderTerminationRequest    = ViewProps.onResponderTerminationRequest @Picker
accessible                       = ViewProps.accessible @Picker
onStartShouldSetResponderCapture = ViewProps.onStartShouldSetResponderCapture @Picker
pointerEvents                    = ViewProps.pointerEvents @Picker
removeClippedSubviews            = ViewProps.removeClippedSubviews @Picker
style                            = ViewProps.style @Picker
testID                           = ViewProps.testID @Picker
accessibilityComponentType       = ViewProps.accessibilityComponentType @Picker
accessibilityLiveRegion          = ViewProps.accessibilityLiveRegion @Picker
collapsable                      = ViewProps.collapsable @Picker
importantForAccessibility        = ViewProps.importantForAccessibility @Picker
needsOffscreenAlphaCompositing   = ViewProps.needsOffscreenAlphaCompositing @Picker
renderToHardwareTextureAndroid   = ViewProps.renderToHardwareTextureAndroid @Picker
accessibilityTraits              = ViewProps.accessibilityTraits @Picker
accessibilityViewIsModal         = ViewProps.accessibilityViewIsModal @Picker
shouldRasterizeIOS               = ViewProps.shouldRasterizeIOS @Picker


-- TODO: methods
