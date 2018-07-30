{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE DataKinds           #-}
{-# LANGUAGE FlexibleContexts    #-}
{-# LANGUAGE KindSignatures      #-}
{-# LANGUAGE NoImplicitPrelude   #-}
{-# LANGUAGE RankNTypes          #-}
module React.Flux.Rn.Views (
    module React.Flux.Rn.Views,
    R.View,
    R.mkControllerView,
    R.ReactElementM
) where

import           Data.JSString       (JSString)
import           Data.Typeable       (Typeable)
import           Prelude             (Eq, ($))
import qualified React.Flux          as R
import qualified React.Flux.Internal as I

mkView :: forall (props :: *) handler. (Typeable props, I.AllEq '[props]) => JSString -> (props -> R.ReactElementM 'R.EventHandlerCode ()) -> props -> R.ReactElementM handler ()
mkView name buildNode = R.xview_ $ R.mkView name buildNode

mkStatefulView :: forall (state :: *) (props :: *) handler.
                  (Typeable state, Typeable state, Eq state, Typeable props, I.AllEq '[props])
               => JSString
               -> state
               -> (state -> props -> R.ReactElementM ('R.StatefulEventHandlerCode state) ())
               -> props
               -> R.ReactElementM handler ()
mkStatefulView name initial buildNode = R.xview_ $ R.mkStatefulView name initial buildNode
