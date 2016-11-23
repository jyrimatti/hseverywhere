var registerRnComponents = function(__rn) {
    window['ActivityIndicator'] = __rn.ActivityIndicator;
    window['DatePickerIOS'] = __rn.DatePickerIOS;
    window['DrawerLayoutAndroid'] = __rn.DrawerLayoutAndroid;
    window['Image'] = __rn.Image;
    window['ListView'] = __rn.ListView;
    window['ListView.DataSource'] = __rn.ListView.DataSource;
    window['MapView'] = __rn.MapView;
    window['Modal'] = __rn.Modal;
    window['Navigator'] = __rn.Navigator;
    window['NavigatorIOS'] = __rn.NavigatorIOS;
    window['PickerIOS'] = __rn.PickerIOS;
    window['Picker'] = __rn.Picker;
    window['ProgressBarAndroid'] = __rn.ProgressBarAndroid;
    window['ProgressViewIOS'] = __rn.ProgressViewIOS;
    window['RefreshControl'] = __rn.RefreshControl;
    window['ScrollView'] = __rn.ScrollView;
    window['SegmentedControlIOS'] = __rn.SegmentedControlIOS;
    window['Slider'] = __rn.Slider;
    window['SliderIOS'] = __rn.SliderIOS;
    window['StatusBar'] = __rn.StatusBar;
    window['Switch'] = __rn.Switch;
    window['TabBarIOS'] = __rn.TabBarIOS;
    window['TabBarIOS.Item'] = __rn.TabBarIOS_Item;
    window['Text'] = __rn.Text;
    window['TextInput'] = __rn.TextInput;
    window['ToolbarAndroid'] = __rn.ToolbarAndroid;
    window['TouchableHighlight'] = __rn.TouchableHighlight;
    window['TouchableNativeFeedback'] = __rn.TouchableNativeFeedback;
    window['TouchableOpacity'] = __rn.TouchableOpacity;
    window['TouchableWithoutFeedback'] = __rn.TouchableWithoutFeedback;
    window['View'] = __rn.View;
    window['ViewPagerAndroid'] = __rn.ViewPagerAndroid;
    window['WebView'] = __rn.WebView;

    window['ActionSheetIOS'] = __rn.ActionSheetIOS;
    window['Alert'] = __rn.Alert;
    window['AlertIOS'] = __rn.AlertIOS;
    window['Animated'] = __rn.Animated;
    window['AppRegistry'] = __rn.AppRegistry;
    window['AppState'] = __rn.AppState;
    window['AsyncStorage'] = __rn.AsyncStorage;
    window['BackAndroid'] = __rn.BackAndroid;
    window['CameraRoll'] = __rn.CameraRoll;
    window['Clipboard'] = __rn.Clipboard;
    window['DatePickerAndroid'] = __rn.DatePickerAndroid;
    window['Dimensions'] = __rn.Dimensions;
    window['Geolocation'] = __rn.Geolocation;
    window['IntentAndroid'] = __rn.IntentAndroid;
    window['InteractionManager'] = __rn.InteractionManager;
    window['LayoutAnimation'] = __rn.LayoutAnimation;
    window['Linking'] = __rn.Linking;
    window['NativeMethodsMixin'] = __rn.NativeMethodsMixin;
    window['NetInfo'] = __rn.NetInfo;
    window['PanResponder'] = __rn.PanResponder;
    window['PixelRatio'] = __rn.PixelRatio;
// failing, why?    window['PushNotificationIOS'] = __rn.PushNotificationIOS;
if (__rn.Platform.OS !== 'macos') {
    window['StatusBarIOS'] = __rn.StatusBarIOS;
}
    window['StyleSheet'] = __rn.StyleSheet;
    window['TimePickerAndroid'] = __rn.TimePickerAndroid;
    window['ToastAndroid'] = __rn.ToastAndroid;
    window['VibrationIOS'] = __rn.VibrationIOS;
    window['Vibration'] = __rn.Vibration;

    window['Platform'] = __rn.Platform;
};

module.exports = {
  registerRnComponents: registerRnComponents
};
