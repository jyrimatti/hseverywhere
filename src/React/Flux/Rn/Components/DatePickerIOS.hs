{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.DatePickerIOS where

import           Data.Time.LocalTime
import           Prelude                  (Int)
import           React.Flux
import           React.Flux.Rn.Components (DatePickerIOS, Props, prop)
import           React.Flux.Rn.Events
import qualified React.Flux.Rn.Props.View as ViewProps
import           React.Flux.Rn.Types

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
