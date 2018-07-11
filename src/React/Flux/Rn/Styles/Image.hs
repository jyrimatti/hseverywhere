module React.Flux.Rn.Styles.Image where

import           Numeric.Natural
import           Prelude                        (Bool, String, const, pure, ($),
                                                 (.), (<$>))
import           React.Flux
import           React.Flux.Internal            (HandlerArg (..),
                                                 PropertyOrHandler_ (..))
import           React.Flux.PropertiesAndEvents (callback)
import           React.Flux.Rn.Events
import           React.Flux.Rn.Types

borderTopRightRadius :: Natural -> PropertyOrHandler handler
borderTopRightRadius = (&=) "borderTopRightRadius"

backfaceVisibility :: VisibilityEnum -> PropertyOrHandler handler
backfaceVisibility = (&=) "backfaceVisibility"

borderBottomLeftRadius :: Natural -> PropertyOrHandler handler
borderBottomLeftRadius = (&=) "borderBottomLeftRadius"

borderBottomRightRadius :: Natural -> PropertyOrHandler handler
borderBottomRightRadius = (&=) "borderBottomRightRadius"

borderColor :: Color -> PropertyOrHandler handler
borderColor = (&=) "borderColor"

borderRadius :: Natural -> PropertyOrHandler handler
borderRadius = (&=) "borderRadius"

borderTopLeftRadius :: Natural -> PropertyOrHandler handler
borderTopLeftRadius = (&=) "borderTopLeftRadius"

backgroundColor :: Color -> PropertyOrHandler handler
backgroundColor = (&=) "backgroundColor"

borderWidth :: Natural -> PropertyOrHandler handler
borderWidth = (&=) "borderWidth"

opacity :: Double -> PropertyOrHandler handler
opacity = (&=) "opacity"

overflow :: VisibilityEnum -> PropertyOrHandler handler
overflow = (&=) "overflow"

resizeMode :: ResizeMode -> PropertyOrHandler handler
resizeMode = (&=) "resizeMode"

tintColor :: Color -> PropertyOrHandler handler
tintColor = (&=) "tintColor"

overlayColor :: Color -> PropertyOrHandler handler
overlayColor = (&=) "overlayColor"

