{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.ViewPagerAndroid where

import           Numeric.Natural
import           Prelude                        (Bool, Int, String, const, pure,
                                                 ($), (.), (<$>))
import           React.Flux
import           React.Flux.Internal            (HandlerArg (..),
                                                 PropertyOrHandler_ (..))
import           React.Flux.PropertiesAndEvents (callback)
import           React.Flux.Rn.Components       (Props, ViewPagerAndroid, prop)
import           React.Flux.Rn.Events
import qualified React.Flux.Rn.Props.View       as ViewProps
import           React.Flux.Rn.Types

initialPage :: Natural -> Props ViewPagerAndroid handler
initialPage = prop "initialPage"

keyboardDismissMode :: KeyboardDismissMode -> Props ViewPagerAndroid handler
keyboardDismissMode = prop "keyboardDismissMode"

onPageScroll :: (OnPageScroll -> EventHandlerType handler) -> Props ViewPagerAndroid handler
onPageScroll = on1 "onPageScroll"

onPageScrollStateChanged :: (PageScrollingState -> EventHandlerType handler) -> Props ViewPagerAndroid handler
onPageScrollStateChanged = on1 "onPageScrollStateChanged"

onPageSelected :: (OnPageSelected -> EventHandlerType handler) -> Props ViewPagerAndroid handler
onPageSelected = on1 "onPageSelected"

pageMargin :: Int -> Props ViewPagerAndroid handler
pageMargin = prop "pageMargin"

peekEnabled :: Bool -> Props ViewPagerAndroid handler
peekEnabled = prop "peekEnabled"

scrollEnabled :: Bool -> Props ViewPagerAndroid handler
scrollEnabled = prop "scrollEnabled"

-- ViewProps:

onStartShouldSetResponder        = ViewProps.onStartShouldSetResponder @ViewPagerAndroidPagerAndroid
accessibilityLabel               = ViewProps.accessibilityLabel @ViewPagerAndroidPagerAndroid
hitSlop                          = ViewProps.hitSlop @ViewPagerAndroidPagerAndroid
nativeID                         = ViewProps.nativeID @ViewPagerAndroid
onAccessibilityTap               = ViewProps.onAccessibilityTap @ViewPagerAndroid
onLayout                         = ViewProps.onLayout @ViewPagerAndroid
onMagicTap                       = ViewProps.onMagicTap @ViewPagerAndroid
onMoveShouldSetResponder         = ViewProps.onMoveShouldSetResponder @ViewPagerAndroid
onMoveShouldSetResponderCapture  = ViewProps.onMoveShouldSetResponderCapture @ViewPagerAndroid
onResponderGrant                 = ViewProps.onResponderGrant @ViewPagerAndroid
onResponderMove                  = ViewProps.onResponderMove @ViewPagerAndroid
onResponderReject                = ViewProps.onResponderReject @ViewPagerAndroid
onResponderRelease               = ViewProps.onResponderRelease @ViewPagerAndroid
onResponderTerminate             = ViewProps.onResponderTerminate @ViewPagerAndroid
onResponderTerminationRequest    = ViewProps.onResponderTerminationRequest @ViewPagerAndroid
accessible                       = ViewProps.accessible @ViewPagerAndroid
onStartShouldSetResponderCapture = ViewProps.onStartShouldSetResponderCapture @ViewPagerAndroid
pointerEvents                    = ViewProps.pointerEvents @ViewPagerAndroid
removeClippedSubviews            = ViewProps.removeClippedSubviews @ViewPagerAndroid
style                            = ViewProps.style @ViewPagerAndroid
testID                           = ViewProps.testID @ViewPagerAndroid
accessibilityComponentType       = ViewProps.accessibilityComponentType @ViewPagerAndroid
accessibilityLiveRegion          = ViewProps.accessibilityLiveRegion @ViewPagerAndroid
collapsable                      = ViewProps.collapsable @ViewPagerAndroid
importantForAccessibility        = ViewProps.importantForAccessibility @ViewPagerAndroid
needsOffscreenAlphaCompositing   = ViewProps.needsOffscreenAlphaCompositing @ViewPagerAndroid
renderToHardwareTextureAndroid   = ViewProps.renderToHardwareTextureAndroid @ViewPagerAndroid
accessibilityTraits              = ViewProps.accessibilityTraits @ViewPagerAndroid
accessibilityViewIsModal         = ViewProps.accessibilityViewIsModal @ViewPagerAndroid
shouldRasterizeIOS               = ViewProps.shouldRasterizeIOS @ViewPagerAndroid

