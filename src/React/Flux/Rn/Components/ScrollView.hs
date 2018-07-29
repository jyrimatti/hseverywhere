{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.ScrollView (
    module React.Flux.Rn.Components.ScrollView,
    ViewProps.AccessibilityComponentTypes(..),
    ViewProps.AccessibilityLiveRegion(..),
    ViewProps.AccessibilityTraits(..),
    ViewProps.ImportantForAccessibility(..),
    ViewProps.Inset(Inset),
    ViewProps.OnLayout(OnLayout),
    ViewProps.PointerEvents(..),
    ViewProps.SyntheticTouchEvent(SyntheticTouchEvent),
    ScrollViewProps.Color (..),
    ScrollViewProps.ContentInsetAdjustmentBehavior (..),
    ScrollViewProps.ContentOffset (ContentOffset),
    ScrollViewProps.DecelerationRate (..),
    ScrollViewProps.IndicatorStyle (..),
    ScrollViewProps.KeyboardDismissMode (..),
    ScrollViewProps.KeyboardShouldPersistTaps (..),
    ScrollViewProps.OverScrollMode (..),
    ScrollViewProps.SnapToAlignment (..)
) where

import           React.Flux.Rn.Components            (ScrollView)
import qualified React.Flux.Rn.Props.ScrollViewProps as ScrollViewProps
import qualified React.Flux.Rn.Props.ViewProps       as ViewProps

-- ScrollViewProps:

alwaysBounceVertical             = ScrollViewProps.alwaysBounceVertical @ScrollView
contentContainerStyle            = ScrollViewProps.contentContainerStyle @ScrollView
keyboardDismissMode              = ScrollViewProps.keyboardDismissMode @ScrollView
keyboardShouldPersistTaps        = ScrollViewProps.keyboardShouldPersistTaps @ScrollView
onContentSizeChange              = ScrollViewProps.onContentSizeChange @ScrollView
onMomentumScrollBegin            = ScrollViewProps.onMomentumScrollBegin @ScrollView
onMomentumScrollEnd              = ScrollViewProps.onMomentumScrollEnd @ScrollView
onScroll                         = ScrollViewProps.onScroll @ScrollView
pagingEnabled                    = ScrollViewProps.pagingEnabled @ScrollView
refreshControl                   = ScrollViewProps.refreshControl @ScrollView
scrollEnabled                    = ScrollViewProps.scrollEnabled @ScrollView
showsHorizontalScrollIndicator   = ScrollViewProps.showsHorizontalScrollIndicator @ScrollView
showsVerticalScrollIndicator     = ScrollViewProps.showsVerticalScrollIndicator @ScrollView
stickyHeaderIndices              = ScrollViewProps.stickyHeaderIndices @ScrollView
endFillColor                     = ScrollViewProps.endFillColor @ScrollView
overScrollMode                   = ScrollViewProps.overScrollMode @ScrollView
scrollPerfTag                    = ScrollViewProps.scrollPerfTag @ScrollView
alwaysBounceHorizontal           = ScrollViewProps.alwaysBounceHorizontal @ScrollView
horizontal                       = ScrollViewProps.horizontal @ScrollView
automaticallyAdjustContentInsets = ScrollViewProps.automaticallyAdjustContentInsets @ScrollView
bounces                          = ScrollViewProps.bounces @ScrollView
bouncesZoom                      = ScrollViewProps.bouncesZoom @ScrollView
canCancelContentTouches          = ScrollViewProps.canCancelContentTouches @ScrollView
centerContent                    = ScrollViewProps.centerContent @ScrollView
contentInset                     = ScrollViewProps.contentInset @ScrollView
contentInsetAdjustmentBehavior   = ScrollViewProps.contentInsetAdjustmentBehavior @ScrollView
contentOffset                    = ScrollViewProps.contentOffset @ScrollView
decelerationRate                 = ScrollViewProps.decelerationRate @ScrollView
directionalLockEnabled           = ScrollViewProps.directionalLockEnabled @ScrollView
indicatorStyle                   = ScrollViewProps.indicatorStyle @ScrollView
maximumZoomScale                 = ScrollViewProps.maximumZoomScale @ScrollView
minimumZoomScale                 = ScrollViewProps.minimumZoomScale @ScrollView
pinchGestureEnabled              = ScrollViewProps.pinchGestureEnabled @ScrollView
scrollEventThrottle              = ScrollViewProps.scrollEventThrottle @ScrollView
scrollIndicatorInsets            = ScrollViewProps.scrollIndicatorInsets @ScrollView
scrollsToTop                     = ScrollViewProps.scrollsToTop @ScrollView
snapToAlignment                  = ScrollViewProps.snapToAlignment @ScrollView
snapToInterval                   = ScrollViewProps.snapToInterval @ScrollView
zoomScale                        = ScrollViewProps.zoomScale @ScrollView


-- ViewProps:

onStartShouldSetResponder        = ViewProps.onStartShouldSetResponder @ScrollView
accessibilityLabel               = ViewProps.accessibilityLabel @ScrollView
hitSlop                          = ViewProps.hitSlop @ScrollView
nativeID                         = ViewProps.nativeID @ScrollView
onAccessibilityTap               = ViewProps.onAccessibilityTap @ScrollView
onLayout                         = ViewProps.onLayout @ScrollView
onMagicTap                       = ViewProps.onMagicTap @ScrollView
onMoveShouldSetResponder         = ViewProps.onMoveShouldSetResponder @ScrollView
onMoveShouldSetResponderCapture  = ViewProps.onMoveShouldSetResponderCapture @ScrollView
onResponderGrant                 = ViewProps.onResponderGrant @ScrollView
onResponderMove                  = ViewProps.onResponderMove @ScrollView
onResponderReject                = ViewProps.onResponderReject @ScrollView
onResponderRelease               = ViewProps.onResponderRelease @ScrollView
onResponderTerminate             = ViewProps.onResponderTerminate @ScrollView
onResponderTerminationRequest    = ViewProps.onResponderTerminationRequest @ScrollView
accessible                       = ViewProps.accessible @ScrollView
onStartShouldSetResponderCapture = ViewProps.onStartShouldSetResponderCapture @ScrollView
pointerEvents                    = ViewProps.pointerEvents @ScrollView
removeClippedSubviews            = ViewProps.removeClippedSubviews @ScrollView
style                            = ViewProps.style @ScrollView
testID                           = ViewProps.testID @ScrollView
accessibilityComponentType       = ViewProps.accessibilityComponentType @ScrollView
accessibilityLiveRegion          = ViewProps.accessibilityLiveRegion @ScrollView
collapsable                      = ViewProps.collapsable @ScrollView
importantForAccessibility        = ViewProps.importantForAccessibility @ScrollView
needsOffscreenAlphaCompositing   = ViewProps.needsOffscreenAlphaCompositing @ScrollView
renderToHardwareTextureAndroid   = ViewProps.renderToHardwareTextureAndroid @ScrollView
accessibilityTraits              = ViewProps.accessibilityTraits @ScrollView
accessibilityViewIsModal         = ViewProps.accessibilityViewIsModal @ScrollView
shouldRasterizeIOS               = ViewProps.shouldRasterizeIOS @ScrollView


-- TODO: methods
