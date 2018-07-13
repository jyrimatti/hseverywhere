{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module React.Flux.Rn.Components where

import           Data.Monoid    (Monoid)
import           Data.Semigroup
import           GHCJS.Marshal  (ToJSVal)
import           GHCJS.Types    (JSString)
import           Prelude        (String, concatMap, fmap, ($), (.))
import           React.Flux     (PropertyOrHandler, ReactElementM, foreign_,
                                 nestedProperty, (&=))

{-# ANN module ("HLint: ignore Use camelCase" :: String) #-}

newtype Props component handler = Props { props :: PropertyOrHandler handler }

prop :: ToJSVal a => JSString -> a -> Props component handler
prop name val = prop_ $ name &= val

nestedProp :: JSString -> [Props component handler] -> Props component handler
nestedProp name = prop_ . nestedProperty name . fmap props

prop_ :: PropertyOrHandler handler -> Props component handler
prop_ = Props

foreign__ :: JSString -> [Props component handler] -> ReactElementM handler a -> ReactElementM handler a
foreign__ name = foreign_ name . fmap props

data ActivityIndicator
data Button
data DatePickerIOS
data DrawerLayoutAndroid
data FlatList
data Image
data KeyboardAvoidingView
data ListView
data MaskedViewIOS
data Modal
data NavigatorIOS
data Picker
data PickerIOS
data ProgressBarAndroid
data ProgressViewIOS
data RefreshControl
data SafeAreaView
data ScrollView
data SectionList
data SegmentedControlIOS
data Slider
data SnapshotViewIOS
data StatusBar
data Switch
data TabBarIOS
data TabBarIOS_Item
data Text
data TextInput
data ToolbarAndroid
data TouchableHighlight
data TouchableNativeFeedback
data TouchableOpacity
data TouchableWithoutFeedback
data View
data ViewPagerAndroid
data VirtualizedList
data WebView

-- corresponds to those in register_rn.js

activityIndicator :: [Props ActivityIndicator handler] -> ReactElementM handler a -> ReactElementM handler a
activityIndicator = foreign__ "ActivityIndicator"

button :: [Props Button handler] -> ReactElementM handler a -> ReactElementM handler a
button = foreign__ "Button"

datePickerIOS :: [Props DatePickerIOS handler] -> ReactElementM handler a -> ReactElementM handler a
datePickerIOS = foreign__ "DatePickerIOS"

drawerLayoutAndroid :: [Props DrawerLayoutAndroid handler] -> ReactElementM handler a -> ReactElementM handler a
drawerLayoutAndroid = foreign__ "DrawerLayoutAndroid"

flatList :: [Props FlatList handler] -> ReactElementM handler a -> ReactElementM handler a
flatList = foreign__ "FlatList"

image :: [Props Image handler] -> ReactElementM handler a -> ReactElementM handler a
image = foreign__ "Image"

keyboardAvoidingView :: [Props KeyboardAvoidingView handler] -> ReactElementM handler a -> ReactElementM handler a
keyboardAvoidingView = foreign__ "KeyboardAvoidingView"

listView :: [Props ListView handler] -> ReactElementM handler a -> ReactElementM handler a
listView = foreign__ "ListView"

maskedViewIOS :: [Props MaskedViewIOS handler] -> ReactElementM handler a -> ReactElementM handler a
maskedViewIOS = foreign__ "MaskedViewIOS"

modal :: [Props Modal handler] -> ReactElementM handler a -> ReactElementM handler a
modal = foreign__ "Modal"

navigatorIOS :: [Props NavigatorIOS handler] -> ReactElementM handler a -> ReactElementM handler a
navigatorIOS = foreign__ "NavigatorIOS"

picker :: [Props Picker handler] -> ReactElementM handler a -> ReactElementM handler a
picker = foreign__ "Picker"

pickerIOS :: [Props PickerIOS handler] -> ReactElementM handler a -> ReactElementM handler a
pickerIOS = foreign__ "PickerIOS"

progressBarAndroid :: [Props ProgressBarAndroid handler] -> ReactElementM handler a -> ReactElementM handler a
progressBarAndroid = foreign__ "ProgressBarAndroid"

progressViewIOS :: [Props ProgressViewIOS handler] -> ReactElementM handler a -> ReactElementM handler a
progressViewIOS = foreign__ "ProgressViewIOS"

refreshControl :: [Props RefreshControl handler] -> ReactElementM handler a -> ReactElementM handler a
refreshControl = foreign__ "RefreshControl"

safeAreaView :: [Props SafeAreaView handler] -> ReactElementM handler a -> ReactElementM handler a
safeAreaView = foreign__ "SafeAreaView"

scrollView :: [Props ScrollView handler] -> ReactElementM handler a -> ReactElementM handler a
scrollView = foreign__ "ScrollView"

sectionList :: [Props SectionList handler] -> ReactElementM handler a -> ReactElementM handler a
sectionList = foreign__ "SectionList"

segmentedControlIOS :: [Props SegmentedControlIOS handler] -> ReactElementM handler a -> ReactElementM handler a
segmentedControlIOS = foreign__ "SegmentedControlIOS"

slider :: [Props Slider handler] -> ReactElementM handler a -> ReactElementM handler a
slider = foreign__ "Slider"

snapshotViewIOS :: [Props SnapshotViewIOS handler] -> ReactElementM handler a -> ReactElementM handler a
snapshotViewIOS = foreign__ "SnapshotViewIOS"

statusBar :: [Props StatusBar handler] -> ReactElementM handler a -> ReactElementM handler a
statusBar = foreign__ "StatusBar"

switch :: [Props Switch handler] -> ReactElementM handler a -> ReactElementM handler a
switch = foreign__ "Switch"

tabBarIOS :: [Props TabBarIOS handler] -> ReactElementM handler a -> ReactElementM handler a
tabBarIOS = foreign__ "TabBarIOS"

tabBarIOS_Item :: [Props TabBarIOS_Item handler] -> ReactElementM handler a -> ReactElementM handler a
tabBarIOS_Item = foreign__ "TabBarIOS_Item"

text :: [Props Text handler] -> ReactElementM handler a -> ReactElementM handler a
text = foreign__ "Text"

textInput :: [Props TextInput handler] -> ReactElementM handler a -> ReactElementM handler a
textInput = foreign__ "TextInput"

toolbarAndroid :: [Props ToolbarAndroid handler] -> ReactElementM handler a -> ReactElementM handler a
toolbarAndroid = foreign__ "ToolbarAndroid"

touchableHighlight :: [Props TouchableHighlight handler] -> ReactElementM handler a -> ReactElementM handler a
touchableHighlight = foreign__ "TouchableHighlight"

touchableNativeFeedback :: [Props TouchableNativeFeedback handler] -> ReactElementM handler a -> ReactElementM handler a
touchableNativeFeedback = foreign__ "TouchableNativeFeedback"

touchableOpacity :: [Props TouchableOpacity handler] -> ReactElementM handler a -> ReactElementM handler a
touchableOpacity = foreign__ "TouchableOpacity"

touchableWithoutFeedback :: [Props TouchableWithoutFeedback handler] -> ReactElementM handler a -> ReactElementM handler a
touchableWithoutFeedback = foreign__ "TouchableWithoutFeedback"

view :: [Props View handler] -> ReactElementM handler a -> ReactElementM handler a
view = foreign__ "View"

viewPagerAndroid :: [Props ViewPagerAndroid handler] -> ReactElementM handler a -> ReactElementM handler a
viewPagerAndroid = foreign__ "ViewPagerAndroid"

virtualizedList :: [Props VirtualizedList handler] -> ReactElementM handler a -> ReactElementM handler a
virtualizedList = foreign__ "VirtualizedList"

webView :: [Props WebView handler] -> ReactElementM handler a -> ReactElementM handler a
webView = foreign__ "WebView"
