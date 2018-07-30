{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.Image (
    module React.Flux.Rn.Components.Image,
    DefaultSource(..), ImageSource(..), Inset(Inset),
    OnLayout(OnLayout), OnLayoutVals(OnLayoutVals),
    OnProgress(OnProgress), ResizeMethod(..)
) where

import           GHCJS.Marshal            (FromJSVal (..))
import           Numeric.Natural          (Natural)
import           Prelude                  (Bool, String, ($))
import           Prelude                  ((.))
import           Prelude                  (fmap)
import           React.Flux               (ReactElementM, foreign_)
import           React.Flux.Rn.Events     (EventHandlerType, on0, on1)
import           React.Flux.Rn.Properties (Props, Styles, nestedProp, prop,
                                           props)
import           React.Flux.Rn.Types      (DefaultSource (..), ImageSource (..),
                                           Inset (Inset), OnLayout (OnLayout),
                                           OnLayoutVals (OnLayoutVals),
                                           OnProgress (OnProgress),
                                           ResizeMethod (..))

data Image
image :: [Props Image handler] -> ReactElementM handler a -> ReactElementM handler a
image = foreign_ "Image" . fmap props

style :: [Styles Image handler] -> Props Image handler
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
