{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.Components where

import           Data.Monoid    (Monoid)
import           Data.Semigroup
import           GHCJS.Types    (JSString)
import           Prelude        (String)
import           React.Flux

{-# ANN module ("HLint: ignore Use camelCase" :: String) #-}

newtype Prop component handler = Prop [PropertyOrHandler handler]
instance Semigroup (Prop c h) where
    Prop xs <> Prop yx = Prop (xs <> yx)
instance Monoid (Prop c h) where
    mempty = Prop []

prop :: PropertyOrHandler handler -> Prop component handler
prop p = Prop [p]

foreign__ :: JSString -> Prop component handler -> ReactElementM handler a -> ReactElementM handler a
foreign__ name (Prop xs) = foreign_ name xs

-- corresponds to those in register_rn.js
activityIndicator = foreign_ "ActivityIndicator"
button = foreign_ "Button"
datePickerIOS = foreign_ "DatePickerIOS"
drawerLayoutAndroid = foreign_ "DrawerLayoutAndroid"
flatList = foreign_ "FlatList"
image = foreign_ "Image"
keyboardAvoidingView = foreign_ "KeyboardAvoidingView"
listView = foreign_ "ListView"
maskedViewIOS = foreign_ "MaskedViewIOS"
modal = foreign_ "Modal"
navigatorIOS = foreign_ "NavigatorIOS"
picker = foreign_ "Picker"
pickerIOS = foreign_ "PickerIOS"
progressBarAndroid = foreign_ "ProgressBarAndroid"
progressViewIOS = foreign_ "ProgressViewIOS"
refreshControl = foreign_ "RefreshControl"
safeAreaView = foreign_ "SafeAreaView"
scrollView = foreign_ "ScrollView"
sectionList = foreign_ "SectionList"
segmentedControlIOS = foreign_ "SegmentedControlIOS"
slider = foreign_ "Slider"
snapshotViewIOS = foreign_ "SnapshotViewIOS"
statusBar = foreign_ "StatusBar"
switch = foreign_ "Switch"
tabBarIOS = foreign_ "TabBarIOS"
tabBarIOS_Item = foreign_ "TabBarIOS_Item"
text = foreign_ "Text"
textInput = foreign_ "TextInput"
toolbarAndroid = foreign_ "ToolbarAndroid"
touchableHighlight = foreign_ "TouchableHighlight"
touchableNativeFeedback = foreign_ "TouchableNativeFeedback"
touchableOpacity = foreign_ "TouchableOpacity"
touchableWithoutFeedback = foreign_ "TouchableWithoutFeedback"
view = foreign_ "View"
viewPagerAndroid = foreign_ "ViewPagerAndroid"
virtualizedList = foreign_ "VirtualizedList"
webView = foreign_ "WebView"
