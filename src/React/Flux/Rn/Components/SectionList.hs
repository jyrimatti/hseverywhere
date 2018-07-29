{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TypeApplications  #-}
module React.Flux.Rn.Components.SectionList (
    module React.Flux.Rn.Components.SectionList,
    Index,
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
    ScrollViewProps.ReactViewRef,
    ScrollViewProps.SnapToAlignment (..)
) where

import           GHCJS.Marshal                            (FromJSVal)
import           Prelude                                  (Bool, String)
import           React.Flux.Rn.Components                 (Props, SectionList,
                                                           prop)
import qualified React.Flux.Rn.Props.ScrollViewProps      as ScrollViewProps
import qualified React.Flux.Rn.Props.ViewProps            as ViewProps
import qualified React.Flux.Rn.Props.VirtualizedListProps as VirtualizedListProps
import           React.Flux.Rn.Types                      (Index)

-- Platform: IOS
stickySectionHeadersEnabled :: Bool -> Props SectionList handler
stickySectionHeadersEnabled = prop "stickySectionHeadersEnabled"

-- VirtualizedListProps:

last                      = VirtualizedListProps.last @SectionList
first                     = VirtualizedListProps.first @SectionList
initialNumToRender        = VirtualizedListProps.initialNumToRender @SectionList
keyExtractor :: forall item handler. FromJSVal item => (item -> Index -> String) -> Props SectionList handler
keyExtractor              = VirtualizedListProps.keyExtractor @SectionList
disableVirtualization     = VirtualizedListProps.disableVirtualization @SectionList
maxToRenderPerBatch       = VirtualizedListProps.maxToRenderPerBatch @SectionList
onEndReachedThreshold     = VirtualizedListProps.onEndReachedThreshold @SectionList
updateCellsBatchingPeriod = VirtualizedListProps.updateCellsBatchingPeriod @SectionList
windowSize                = VirtualizedListProps.windowSize @SectionList

-- ScrollViewProps:

alwaysBounceVertical             = ScrollViewProps.alwaysBounceVertical @SectionList
contentContainerStyle            = ScrollViewProps.contentContainerStyle @SectionList
keyboardDismissMode              = ScrollViewProps.keyboardDismissMode @SectionList
keyboardShouldPersistTaps        = ScrollViewProps.keyboardShouldPersistTaps @SectionList
onContentSizeChange              = ScrollViewProps.onContentSizeChange @SectionList
onMomentumScrollBegin            = ScrollViewProps.onMomentumScrollBegin @SectionList
onMomentumScrollEnd              = ScrollViewProps.onMomentumScrollEnd @SectionList
onScroll                         = ScrollViewProps.onScroll @SectionList
pagingEnabled                    = ScrollViewProps.pagingEnabled @SectionList
refreshControl                   = ScrollViewProps.refreshControl @SectionList
scrollEnabled                    = ScrollViewProps.scrollEnabled @SectionList
showsHorizontalScrollIndicator   = ScrollViewProps.showsHorizontalScrollIndicator @SectionList
showsVerticalScrollIndicator     = ScrollViewProps.showsVerticalScrollIndicator @SectionList
stickyHeaderIndices              = ScrollViewProps.stickyHeaderIndices @SectionList
endFillColor                     = ScrollViewProps.endFillColor @SectionList
overScrollMode                   = ScrollViewProps.overScrollMode @SectionList
scrollPerfTag                    = ScrollViewProps.scrollPerfTag @SectionList
alwaysBounceHorizontal           = ScrollViewProps.alwaysBounceHorizontal @SectionList
horizontal                       = ScrollViewProps.horizontal @SectionList
automaticallyAdjustContentInsets = ScrollViewProps.automaticallyAdjustContentInsets @SectionList
bounces                          = ScrollViewProps.bounces @SectionList
bouncesZoom                      = ScrollViewProps.bouncesZoom @SectionList
canCancelContentTouches          = ScrollViewProps.canCancelContentTouches @SectionList
centerContent                    = ScrollViewProps.centerContent @SectionList
contentInset                     = ScrollViewProps.contentInset @SectionList
contentInsetAdjustmentBehavior   = ScrollViewProps.contentInsetAdjustmentBehavior @SectionList
contentOffset                    = ScrollViewProps.contentOffset @SectionList
decelerationRate                 = ScrollViewProps.decelerationRate @SectionList
directionalLockEnabled           = ScrollViewProps.directionalLockEnabled @SectionList
indicatorStyle                   = ScrollViewProps.indicatorStyle @SectionList
maximumZoomScale                 = ScrollViewProps.maximumZoomScale @SectionList
minimumZoomScale                 = ScrollViewProps.minimumZoomScale @SectionList
pinchGestureEnabled              = ScrollViewProps.pinchGestureEnabled @SectionList
scrollEventThrottle              = ScrollViewProps.scrollEventThrottle @SectionList
scrollIndicatorInsets            = ScrollViewProps.scrollIndicatorInsets @SectionList
scrollsToTop                     = ScrollViewProps.scrollsToTop @SectionList
snapToAlignment                  = ScrollViewProps.snapToAlignment @SectionList
snapToInterval                   = ScrollViewProps.snapToInterval @SectionList
zoomScale                        = ScrollViewProps.zoomScale @SectionList


-- ViewProps:

onStartShouldSetResponder        = ViewProps.onStartShouldSetResponder @SectionList
accessibilityLabel               = ViewProps.accessibilityLabel @SectionList
hitSlop                          = ViewProps.hitSlop @SectionList
nativeID                         = ViewProps.nativeID @SectionList
onAccessibilityTap               = ViewProps.onAccessibilityTap @SectionList
onLayout                         = ViewProps.onLayout @SectionList
onMagicTap                       = ViewProps.onMagicTap @SectionList
onMoveShouldSetResponder         = ViewProps.onMoveShouldSetResponder @SectionList
onMoveShouldSetResponderCapture  = ViewProps.onMoveShouldSetResponderCapture @SectionList
onResponderGrant                 = ViewProps.onResponderGrant @SectionList
onResponderMove                  = ViewProps.onResponderMove @SectionList
onResponderReject                = ViewProps.onResponderReject @SectionList
onResponderRelease               = ViewProps.onResponderRelease @SectionList
onResponderTerminate             = ViewProps.onResponderTerminate @SectionList
onResponderTerminationRequest    = ViewProps.onResponderTerminationRequest @SectionList
accessible                       = ViewProps.accessible @SectionList
onStartShouldSetResponderCapture = ViewProps.onStartShouldSetResponderCapture @SectionList
pointerEvents                    = ViewProps.pointerEvents @SectionList
removeClippedSubviews            = ViewProps.removeClippedSubviews @SectionList
style                            = ViewProps.style @SectionList
testID                           = ViewProps.testID @SectionList
accessibilityComponentType       = ViewProps.accessibilityComponentType @SectionList
accessibilityLiveRegion          = ViewProps.accessibilityLiveRegion @SectionList
collapsable                      = ViewProps.collapsable @SectionList
importantForAccessibility        = ViewProps.importantForAccessibility @SectionList
needsOffscreenAlphaCompositing   = ViewProps.needsOffscreenAlphaCompositing @SectionList
renderToHardwareTextureAndroid   = ViewProps.renderToHardwareTextureAndroid @SectionList
accessibilityTraits              = ViewProps.accessibilityTraits @SectionList
accessibilityViewIsModal         = ViewProps.accessibilityViewIsModal @SectionList
shouldRasterizeIOS               = ViewProps.shouldRasterizeIOS @SectionList

-- TODO: methods
