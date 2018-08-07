{-# LANGUAGE DeriveAnyClass    #-}
{-# LANGUAGE NoImplicitPrelude #-}
module Store where

import           Data.Typeable      (Typeable)
import           Prelude (Show, Eq, pure)
import           React.Flux (StoreData(..))

data AppState = AppState {
} deriving (Show, Typeable, Eq)

instance StoreData AppState where
    transform action = pure
        
appStore = AppState