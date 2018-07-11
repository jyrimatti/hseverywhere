{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.Components.DatePickerIOS where

import           Data.Time.LocalTime
import           Prelude              (Int)
import           React.Flux
import           React.Flux.Rn.Events
import           React.Flux.Rn.Types


-- Required
date :: LocalTime -> PropertyOrHandler handler
date = (&=) "date"

-- Required
onDateChange :: (LocalTime -> EventHandlerType handler) -> PropertyOrHandler handler
onDateChange = on1 "onDateChange"

maximumDate :: LocalTime -> PropertyOrHandler handler
maximumDate = (&=) "maximumDate"

minimumDate :: LocalTime -> PropertyOrHandler handler
minimumDate = (&=) "minimumDate"

minuteInterval :: MinuteInterval -> PropertyOrHandler handler
minuteInterval = (&=) "minuteInterval"

mode :: Mode -> PropertyOrHandler handler
mode = (&=) "mode"

timeZoneOffsetInMinutes :: Int -> PropertyOrHandler handler
timeZoneOffsetInMinutes = (&=) "timeZoneOffsetInMinutes"

-- TODO: ViewProps
