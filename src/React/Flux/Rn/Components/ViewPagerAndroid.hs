{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.ViewPagerAndroid where

import           Numeric.Natural
import           Prelude                        (Bool, String, const, pure, ($),
                                                 (.), (<$>))
import           React.Flux
import           React.Flux.Internal            (HandlerArg (..),
                                                 PropertyOrHandler_ (..))
import           React.Flux.PropertiesAndEvents (callback)
import           React.Flux.Rn.Events
import           React.Flux.Rn.Types

initialPage :: Natural -> PropertyOrHandler handler
initialPage = (&=) "initialPage"

keyboardDismissMode :: KeyboardDismissMode -> PropertyOrHandler handler
keyboardDismissMode = (&=) "keyboardDismissMode"

onPageScroll :: (OnPageScroll -> EventHandlerType handler) -> PropertyOrHandler handler
onPageScroll = on1 "onPageScroll"

onPageScrollStateChanged :: (OnPageScrollStateChanged -> EventHandlerType handler) -> PropertyOrHandler handler
onPageScrollStateChanged = on1 "onPageScrollStateChanged"

onPageSelected :: (OnPageSelected -> EventHandlerType handler) -> PropertyOrHandler handler
onPageSelected = on1 "onPageSelected"

pageMargin :: Int -> PropertyOrHandler handler
pageMargin = (&=) "pageMargin"

peekEnabled :: Bool -> PropertyOrHandler handler
peekEnabled = (&=) "peekEnabled"

scrollEnabled :: Bool -> PropertyOrHandler handler
scrollEnabled = (&=) "scrollEnabled"

-- TODO: ViewProps
