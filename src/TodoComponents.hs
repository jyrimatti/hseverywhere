{-# LANGUAGE OverloadedStrings #-}
module TodoComponents where

import Data.Typeable (Typeable)

import GHCJS.Types (JSString, JSVal, IsJSVal)
import GHCJS.Marshal (ToJSVal(..), toJSVal_aeson, FromJSVal(..))

import React.Flux

import qualified React.Flux.Rn.Components as Rn
import qualified React.Flux.Rn.Events as RnE
import qualified React.Flux.Rn.Style as RnS


data TextInputArgs = TextInputArgs {
      tiaPlaceholder :: String
    , tiaOnSave :: String -> [SomeStoreAction]
    , tiaValue :: Maybe String
} deriving (Typeable)

todoTextInput :: ReactView TextInputArgs
todoTextInput = defineStatefulView "todo text input" "" $ \curText args ->
    Rn.textInput
        [ "placeholder" @= tiaPlaceholder args
        , "value"       @= curText
        , "autoFocus"   @= True
        , "multiline"   @= False
        , RnS.style [ RnS.flex 1
                    , RnS.height 65
                    , RnS.padding 16
                    , RnS.paddingLeft 0
                    , RnS.fontFamily "HelveticaNeue"
                    , RnS.color "#4d4d4d"
                    ]

        , RnE.onSubmitEditing $ \state -> (tiaOnSave args $ state, Just "")
        , RnE.onChangeText $ \txt -> \state -> ([], Just txt)
        ] mempty

todoTextInput_ :: TextInputArgs -> ReactElementM eventHandler ()
todoTextInput_ args = view todoTextInput args mempty
