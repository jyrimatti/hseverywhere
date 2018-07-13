{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.Image where

import           GHCJS.Marshal            (FromJSVal (..))
import           Numeric.Natural
import           Prelude                  (Bool, Double, Image, String, ($))
import           React.Flux
import           React.Flux.Rn.Components (Props, prop)
import           React.Flux.Rn.Events
import           React.Flux.Rn.Types

style :: ImageStyleProps -> Props Image handler
style = nestedProp "style"

blurRadius :: Natural -> Props Image handler
blurRadius = prop "blurRadius"

onLayout :: (OnLayoutVals -> EventHandlerType handler) -> Props Image handler
onLayout f = on1 "onLayout" $ \(OnLayout layout) -> f layout

onLoad :: EventHandlerType handler -> Props Image handler
onLoad = on0 "onLoad"

onLoadEnd :: EventHandlerType handler -> Props Image handler
onLoadEnd = on0 "onLoadEnd"

onLoadStart :: EventHandlerType handler -> Props Image handler
onLoadStart = on0 "onLoadStart"

source :: ImageSource -> Props Image handler
source = prop "source"

onError :: FromJSVal err => (err -> EventHandlerType handler) -> Props Image handler
onError f = on1 "onError" $ \err -> f err

testID :: String -> Props Image handler
testID = prop "testID"

-- Platform: Android
resizeMethod :: ResizeMethod -> Props Image handler
resizeMethod = prop "resizeMethod"

-- Platform: IOS
accessibilityLabel :: String -> Props Image handler
accessibilityLabel = prop "accessibilityLabel"

-- Platform: IOS
accessible :: Bool -> Props Image handler
accessible = prop "accessible"

-- Platform: IOS
capInsets :: Inset -> Props Image handler
capInsets = prop "capInsets"

-- Platform: IOS
defaultSource :: DefaultSource -> Props Image handler
defaultSource = prop "defaultSource"

-- Platform: IOS
onPartialLoad :: EventHandlerType handler -> Props Image handler
onPartialLoad = on0 "onPartialLoad"

-- Platform: IOS
onProgress :: (OnProgress -> EventHandlerType handler) -> Props Image handler
onProgress f = on1 "onProgress" $ \x -> f x

-- TODO: methods
