{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.Image where

import           GHCJS.Marshal        (FromJSVal (..))
import           Numeric.Natural
import           Prelude              (Bool, Double, String, ($))
import           React.Flux
import           React.Flux.Rn.Events
import           React.Flux.Rn.Types

style :: ImageStyleProps -> PropertyOrHandler handler
style = nestedProperty "style"

blurRadius :: Natural -> PropertyOrHandler handler
blurRadius = (&=) "blurRadius"

onLayout :: (OnLayoutVals -> EventHandlerType handler) -> PropertyOrHandler handler
onLayout f = on1 "onLayout" $ \(OnLayout layout) -> f layout

onLoad :: EventHandlerType handler -> PropertyOrHandler handler
onLoad = on0 "onLoad"

onLoadEnd :: EventHandlerType handler -> PropertyOrHandler handler
onLoadEnd = on0 "onLoadEnd"

onLoadStart :: EventHandlerType handler -> PropertyOrHandler handler
onLoadStart = on0 "onLoadStart"

source :: ImageSource -> PropertyOrHandler handler
source = (&=) "source"

onError :: FromJSVal err => (err -> EventHandlerType handler) -> PropertyOrHandler handler
onError f = on1 "onError" $ \err -> f err

testID :: String -> PropertyOrHandler handler
testID = (&=) "testID"

-- Platform: Android
resizeMethod :: ResizeMethod -> PropertyOrHandler handler
resizeMethod = (&=) "resizeMethod"

-- Platform: IOS
accessibilityLabel :: String -> PropertyOrHandler handler
accessibilityLabel = (&=) "accessibilityLabel"

-- Platform: IOS
accessible :: Bool -> PropertyOrHandler handler
accessible = (&=) "accessible"

-- Platform: IOS
capInsets :: Inset -> PropertyOrHandler handler
capInsets = (&=) "capInsets"

-- Platform: IOS
defaultSource :: DefaultSource -> PropertyOrHandler handler
defaultSource = (&=) "defaultSource"

-- Platform: IOS
onPartialLoad :: EventHandlerType handler -> PropertyOrHandler handler
onPartialLoad = on0 "onPartialLoad"

-- Platform: IOS
onProgress :: (OnProgress -> EventHandlerType handler) -> PropertyOrHandler handler
onProgress f = on1 "onProgress" $ \x -> f x

-- TODO: methods
