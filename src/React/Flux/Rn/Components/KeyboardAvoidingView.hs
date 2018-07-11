{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.KeyboardAvoidingView where

import           Numeric.Natural
import           React.Flux
import           React.Flux.Rn.Types

-- Required
keyboardVerticalOffset :: Natural -> PropertyOrHandler handler
keyboardVerticalOffset = (&=) "keyboardVerticalOffset"

behavior :: Behavior -> PropertyOrHandler handler
behavior = (&=) "behavior"

contentContainerStyle :: ViewStyleProps -> PropertyOrHandler handler
contentContainerStyle = nestedProperty "contentContainerStyle"

-- TODO: ViewProps

-- TODO: methods
