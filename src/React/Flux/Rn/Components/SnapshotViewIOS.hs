{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
module React.Flux.Rn.Components.SnapshotViewIOS where

import           Prelude              (String)
import           React.Flux
import           React.Flux.Rn.Events

onSnapshotReady :: EventHandlerType handler -> PropertyOrHandler handler
onSnapshotReady = on0 "onSnapshotReady"

testIdentifier :: String -> PropertyOrHandler handler
testIdentifier = (&=) "testIdentifier"

-- TODO: ViewProps
