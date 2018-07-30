{-# LANGUAGE CPP                       #-}
{-# LANGUAGE DataKinds                 #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE FlexibleInstances         #-}
{-# LANGUAGE MultiParamTypeClasses     #-}
{-# LANGUAGE OverloadedStrings         #-}
{-# LANGUAGE PolyKinds                 #-}
{-# LANGUAGE ScopedTypeVariables       #-}
{-# LANGUAGE TypeApplications          #-}
{-# LANGUAGE TypeFamilies              #-}
{-# LANGUAGE TypeFamilyDependencies    #-}
{-# LANGUAGE TypeOperators             #-}
{-# LANGUAGE UndecidableInstances      #-}

module TodoViews where

import           Prelude                             (($))

import           React.Flux.Rn.Views

import           React.Flux                          (StoreArg)
import           React.Flux.Rn.Components            (scrollView)
import qualified React.Flux.Rn.Components.ScrollView as SV
import qualified React.Flux.Rn.Styles.View           as V_

import           TodoStore
import           TodoViews.Footer
import           TodoViews.Header
import           TodoViews.MainSection

todoApp :: View ()
todoApp = mkControllerView @'[StoreArg TodoState] "todo app" $ \todoState () ->
    scrollView [ SV.style [ V_.backgroundColor "#f5f5f5" ]] $ do
        todoHeader ()
        mainSection todoState
        todoFooter ()
