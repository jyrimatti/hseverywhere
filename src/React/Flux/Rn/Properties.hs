{-# LANGUAGE NoImplicitPrelude #-}
module React.Flux.Rn.Properties where

import           GHCJS.Marshal (ToJSVal)
import           GHCJS.Types   (JSString)
import           Prelude       (fmap, ($), (.))
import           React.Flux    (PropertyOrHandler, nestedProperty, (&=))

newtype Props component handler = Props { props :: PropertyOrHandler handler }
newtype Styles component handler = Styles { styles :: PropertyOrHandler handler }

prop :: ToJSVal a => JSString -> a -> Props component handler
prop name val = prop_ $ name &= val

nestedProp :: JSString -> [Styles comp handler] -> Props component handler
nestedProp name = prop_ . nestedProperty name . fmap styles

prop_ :: PropertyOrHandler handler -> Props component handler
prop_ = Props

style :: ToJSVal a => JSString -> a -> Styles component handler
style name val = style_ $ name &= val

style_ :: PropertyOrHandler handler -> Styles component handler
style_ = Styles
