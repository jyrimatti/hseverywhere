{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.TextInput where

import           Numeric.Natural
import           Prelude              (Bool, Int, String)
import           React.Flux
import           React.Flux.Rn.Events
import           React.Flux.Rn.Types

placeholderTextColor :: Color -> PropertyOrHandler handler
placeholderTextColor = (&=) "placeholderTextColor"

allowFontScaling :: Bool -> PropertyOrHandler handler
allowFontScaling = (&=) "allowFontScaling"

autoCorrect :: Bool -> PropertyOrHandler handler
autoCorrect = (&=) "autoCorrect"

autoFocus :: Bool -> PropertyOrHandler handler
autoFocus = (&=) "autoFocus"

blurOnSubmit :: Bool -> PropertyOrHandler handler
blurOnSubmit = (&=) "blurOnSubmit"

caretHidden :: Bool -> PropertyOrHandler handler
caretHidden = (&=) "caretHidden"

defaultValue :: String -> PropertyOrHandler handler
defaultValue = (&=) "defaultValue"

editable :: Bool -> PropertyOrHandler handler
editable = (&=) "editable"

keyboardType :: KeyboardType -> PropertyOrHandler handler
keyboardType = (&=) "keyboardType"

maxHeight :: Natural -> PropertyOrHandler handler
maxHeight = (&=) "maxHeight"

maxLength :: Natural -> PropertyOrHandler handler
maxLength = (&=) "maxLength"

multiline :: Bool -> PropertyOrHandler handler
multiline = (&=) "multiline"

onBlur :: EventHandlerType handler -> PropertyOrHandler handler
onBlur = on0 "onBlur"

onChange :: EventHandlerType handler -> PropertyOrHandler handler
onChange = on0 "onChange"

onChangeText :: (String -> EventHandlerType handler) -> PropertyOrHandler handler
onChangeText = on1 "onChangeText"

onContentSizeChange :: (OnContentSizeChange -> EventHandlerType handler) -> PropertyOrHandler handler
onContentSizeChange = on1 "onContentSizeChange"

onEndEditing :: EventHandlerType handler -> PropertyOrHandler handler
onEndEditing = on0 "onEndEditing"

onFocus :: EventHandlerType handler -> PropertyOrHandler handler
onFocus = on0 "onFocus"

onLayout :: (OnLayout -> EventHandlerType handler) -> PropertyOrHandler handler
onLayout = on1 "onLayout"

onScroll :: (OnScroll -> EventHandlerType handler) -> PropertyOrHandler handler
onScroll = on1 "onScroll"

onSelectionChange :: (OnSelectionChange -> EventHandlerType handler) -> PropertyOrHandler handler
onSelectionChange = on1 "onSelectionChange"

onSubmitEditing :: EventHandlerType handler -> PropertyOrHandler handler
onSubmitEditing = on0 "onSubmitEditing"

placeholder :: String -> PropertyOrHandler handler
placeholder = (&=) "placeholder"

autoCapitalize :: AutoCapitalize -> PropertyOrHandler handler
autoCapitalize = (&=) "autoCapitalize"

returnKeyType :: ReturnKeyType -> PropertyOrHandler handler
returnKeyType = (&=) "returnKeyType"

secureTextEntry :: Bool -> PropertyOrHandler handler
secureTextEntry = (&=) "secureTextEntry"

selectTextOnFocus :: Bool -> PropertyOrHandler handler
selectTextOnFocus = (&=) "selectTextOnFocus"

selection :: Selection -> PropertyOrHandler handler
selection = (&=) "selection"

selectionColor :: Color -> PropertyOrHandler handler
selectionColor = (&=) "selectionColor"

style :: TextInputStyleProps -> PropertyOrHandler handler
style = nestedProperty "style"

value :: String -> PropertyOrHandler handler
value = (&=) "value"

-- Platform: Android
autoGrow :: Bool -> PropertyOrHandler handler
autoGrow = (&=) "autoGrow"

-- Platform: Android
disableFullscreenUI :: Bool -> PropertyOrHandler handler
disableFullscreenUI = (&=) "disableFullscreenUI"

-- Platform: Android
inlineImageLeft :: String -> PropertyOrHandler handler
inlineImageLeft = (&=) "inlineImageLeft"

-- Platform: Android
inlineImagePadding :: Int -> PropertyOrHandler handler
inlineImagePadding = (&=) "inlineImagePadding"

-- Platform: Android
numberOfLines :: Natural -> PropertyOrHandler handler
numberOfLines = (&=) "numberOfLines"

-- Platform: Android
returnKeyLabel :: String -> PropertyOrHandler handler
returnKeyLabel = (&=) "returnKeyLabel"

-- Platform: Android
textBreakStrategy :: TextBreakStrategy -> PropertyOrHandler handler
textBreakStrategy = (&=) "textBreakStrategy"

-- Platform: Android
underlineColorAndroid :: Color -> PropertyOrHandler handler
underlineColorAndroid = (&=) "underlineColorAndroid"

-- Platform: IOS
clearButtonMode :: ClearButtonMode -> PropertyOrHandler handler
clearButtonMode = (&=) "clearButtonMode"

-- Platform: IOS
clearTextOnFocus :: Bool -> PropertyOrHandler handler
clearTextOnFocus = (&=) "clearTextOnFocus"

-- Platform: IOS
dataDetectorTypes :: DataDetectorTypes -> PropertyOrHandler handler
dataDetectorTypes = (&=) "dataDetectorTypes"

-- Platform: IOS
enablesReturnKeyAutomatically :: Bool -> PropertyOrHandler handler
enablesReturnKeyAutomatically = (&=) "enablesReturnKeyAutomatically"

-- Platform: IOS
keyboardAppearance :: KeyboardAppearance -> PropertyOrHandler handler
keyboardAppearance = (&=) "keyboardAppearance"

-- Platform: IOS
onKeyPress :: (OnKeyPress -> EventHandlerType handler) -> PropertyOrHandler handler
onKeyPress = on1 "onKeyPress"

-- Platform: IOS
selectionState :: DocumentSelectionState -> PropertyOrHandler handler
selectionState = (&=) "selectionState"

-- Platform: IOS
spellCheck :: Bool -> PropertyOrHandler handler
spellCheck = (&=) "spellCheck"

-- TODO: ViewProps

-- TODO: methods
