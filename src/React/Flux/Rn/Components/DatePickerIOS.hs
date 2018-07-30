{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.DatePickerIOS (
    module React.Flux.Rn.Components.DatePickerIOS,
    MinuteInterval(..), Mode(..),
    ViewProps.AccessibilityComponentTypes(..),
    ViewProps.AccessibilityLiveRegion(..),
    ViewProps.AccessibilityTraits(..),
    ViewProps.ImportantForAccessibility(..),
    ViewProps.Inset(Inset),
    ViewProps.OnLayout(OnLayout),
    ViewProps.PointerEvents(..),
    ViewProps.SyntheticTouchEvent(SyntheticTouchEvent)
) where

import           Data.Time.LocalTime           (LocalTime)
import           Prelude                       ((.))
import           Prelude                       (Int, fmap)
import           React.Flux                    (ReactElementM, foreign_)
import           React.Flux.Rn.Events          (EventHandlerType, on1)
import           React.Flux.Rn.Properties      (Props, prop, props)
import qualified React.Flux.Rn.Props.ViewProps as ViewProps
import           React.Flux.Rn.Types           (MinuteInterval (..), Mode (..))

data DatePickerIOS
datePickerIOS :: [Props DatePickerIOS handler] -> ReactElementM handler a -> ReactElementM handler a
datePickerIOS = foreign_ "DatePickerIOS" . fmap props

-- Required
date :: LocalTime -> Props DatePickerIOS handler
date = prop "date"

-- Required
onDateChange :: (LocalTime -> EventHandlerType handler) -> Props DatePickerIOS handler
onDateChange = on1 "onDateChange"

maximumDate :: LocalTime -> Props DatePickerIOS handler
maximumDate = prop "maximumDate"

minimumDate :: LocalTime -> Props DatePickerIOS handler
minimumDate = prop "minimumDate"

minuteInterval :: MinuteInterval -> Props DatePickerIOS handler
minuteInterval = prop "minuteInterval"

mode :: Mode -> Props DatePickerIOS handler
mode = prop "mode"

timeZoneOffsetInMinutes :: Int -> Props DatePickerIOS handler
timeZoneOffsetInMinutes = prop "timeZoneOffsetInMinutes"

-- ViewProps:

onStartShouldSetResponder        = ViewProps.onStartShouldSetResponder @DatePickerIOS
accessibilityLabel               = ViewProps.accessibilityLabel @DatePickerIOS
hitSlop                          = ViewProps.hitSlop @DatePickerIOS
nativeID                         = ViewProps.nativeID @DatePickerIOS
onAccessibilityTap               = ViewProps.onAccessibilityTap @DatePickerIOS
onLayout                         = ViewProps.onLayout @DatePickerIOS
onMagicTap                       = ViewProps.onMagicTap @DatePickerIOS
onMoveShouldSetResponder         = ViewProps.onMoveShouldSetResponder @DatePickerIOS
onMoveShouldSetResponderCapture  = ViewProps.onMoveShouldSetResponderCapture @DatePickerIOS
onResponderGrant                 = ViewProps.onResponderGrant @DatePickerIOS
onResponderMove                  = ViewProps.onResponderMove @DatePickerIOS
onResponderReject                = ViewProps.onResponderReject @DatePickerIOS
onResponderRelease               = ViewProps.onResponderRelease @DatePickerIOS
onResponderTerminate             = ViewProps.onResponderTerminate @DatePickerIOS
onResponderTerminationRequest    = ViewProps.onResponderTerminationRequest @DatePickerIOS
accessible                       = ViewProps.accessible @DatePickerIOS
onStartShouldSetResponderCapture = ViewProps.onStartShouldSetResponderCapture @DatePickerIOS
pointerEvents                    = ViewProps.pointerEvents @DatePickerIOS
removeClippedSubviews            = ViewProps.removeClippedSubviews @DatePickerIOS
style                            = ViewProps.style @DatePickerIOS
testID                           = ViewProps.testID @DatePickerIOS
accessibilityComponentType       = ViewProps.accessibilityComponentType @DatePickerIOS
accessibilityLiveRegion          = ViewProps.accessibilityLiveRegion @DatePickerIOS
collapsable                      = ViewProps.collapsable @DatePickerIOS
importantForAccessibility        = ViewProps.importantForAccessibility @DatePickerIOS
needsOffscreenAlphaCompositing   = ViewProps.needsOffscreenAlphaCompositing @DatePickerIOS
renderToHardwareTextureAndroid   = ViewProps.renderToHardwareTextureAndroid @DatePickerIOS
accessibilityTraits              = ViewProps.accessibilityTraits @DatePickerIOS
accessibilityViewIsModal         = ViewProps.accessibilityViewIsModal @DatePickerIOS
shouldRasterizeIOS               = ViewProps.shouldRasterizeIOS @DatePickerIOS
