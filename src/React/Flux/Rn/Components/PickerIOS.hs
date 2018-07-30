{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.PickerIOS (
    module React.Flux.Rn.Components.PickerIOS,
    ViewProps.AccessibilityComponentTypes(..),
    ViewProps.AccessibilityLiveRegion(..),
    ViewProps.AccessibilityTraits(..),
    ViewProps.ImportantForAccessibility(..),
    ViewProps.Inset(Inset),
    ViewProps.OnLayout(OnLayout),
    ViewProps.PointerEvents(..),
    ViewProps.SyntheticTouchEvent(SyntheticTouchEvent)
) where

import           GHCJS.Marshal                 (ToJSVal)
import           Prelude                       (fmap)
import           Prelude                       ((.))
import           React.Flux                    (ReactElementM, foreign_)
import           React.Flux.Rn.Components.Text (Text)
import           React.Flux.Rn.Events          (EventHandlerType, on0)
import           React.Flux.Rn.Properties      (Props, Styles, nestedProp, prop,
                                                props)
import qualified React.Flux.Rn.Props.ViewProps as ViewProps

data PickerIOS
pickerIOS :: [Props PickerIOS handler] -> ReactElementM handler a -> ReactElementM handler a
pickerIOS = foreign_ "PickerIOS" . fmap props

itemStyle :: [Styles Text handler] -> Props PickerIOS handler
itemStyle = nestedProp "itemStyle"

onValueChange :: EventHandlerType handler -> Props PickerIOS handler
onValueChange = on0 "onValueChange"

selectedValue :: ToJSVal value => value -> Props PickerIOS handler
selectedValue = prop "selectedValue"

-- ViewProps:

onStartShouldSetResponder        = ViewProps.onStartShouldSetResponder @PickerIOS
accessibilityLabel               = ViewProps.accessibilityLabel @PickerIOS
hitSlop                          = ViewProps.hitSlop @PickerIOS
nativeID                         = ViewProps.nativeID @PickerIOS
onAccessibilityTap               = ViewProps.onAccessibilityTap @PickerIOS
onLayout                         = ViewProps.onLayout @PickerIOS
onMagicTap                       = ViewProps.onMagicTap @PickerIOS
onMoveShouldSetResponder         = ViewProps.onMoveShouldSetResponder @PickerIOS
onMoveShouldSetResponderCapture  = ViewProps.onMoveShouldSetResponderCapture @PickerIOS
onResponderGrant                 = ViewProps.onResponderGrant @PickerIOS
onResponderMove                  = ViewProps.onResponderMove @PickerIOS
onResponderReject                = ViewProps.onResponderReject @PickerIOS
onResponderRelease               = ViewProps.onResponderRelease @PickerIOS
onResponderTerminate             = ViewProps.onResponderTerminate @PickerIOS
onResponderTerminationRequest    = ViewProps.onResponderTerminationRequest @PickerIOS
accessible                       = ViewProps.accessible @PickerIOS
onStartShouldSetResponderCapture = ViewProps.onStartShouldSetResponderCapture @PickerIOS
pointerEvents                    = ViewProps.pointerEvents @PickerIOS
removeClippedSubviews            = ViewProps.removeClippedSubviews @PickerIOS
style                            = ViewProps.style @PickerIOS
testID                           = ViewProps.testID @PickerIOS
accessibilityComponentType       = ViewProps.accessibilityComponentType @PickerIOS
accessibilityLiveRegion          = ViewProps.accessibilityLiveRegion @PickerIOS
collapsable                      = ViewProps.collapsable @PickerIOS
importantForAccessibility        = ViewProps.importantForAccessibility @PickerIOS
needsOffscreenAlphaCompositing   = ViewProps.needsOffscreenAlphaCompositing @PickerIOS
renderToHardwareTextureAndroid   = ViewProps.renderToHardwareTextureAndroid @PickerIOS
accessibilityTraits              = ViewProps.accessibilityTraits @PickerIOS
accessibilityViewIsModal         = ViewProps.accessibilityViewIsModal @PickerIOS
shouldRasterizeIOS               = ViewProps.shouldRasterizeIOS @PickerIOS
