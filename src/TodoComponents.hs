{-# LANGUAGE OverloadedStrings #-}
module TodoComponents where

import Data.Typeable (Typeable)
import Data.Maybe (fromMaybe)

import React.Flux

import qualified React.Flux.Rn.Components as Rn
import qualified React.Flux.Rn.Events as RnE
import qualified React.Flux.Rn.Style as RnS


data TextInputArgs = TextInputArgs {
      tiaPlaceholder :: String
    , tiaOnSave :: String -> [SomeStoreAction]
    , tiaOnCancel :: [SomeStoreAction]
    , tiaValue :: Maybe String
} deriving (Typeable)

todoTextInput :: [PropertyOrHandler (StatefulViewEventHandler String)] -> String -> ReactView TextInputArgs
todoTextInput styles state = defineStatefulView "todo text input" state $ \curText args ->
    Rn.textInput
        [ "placeholder" @= tiaPlaceholder args
        , "value"       @= curText
        , "autoFocus"   @= True
        , "blurOnSubmit" @= True
        , RnS.style $ [ RnS.flex 1
                      , RnS.height 45
                      , RnS.margin 8
                      , RnS.marginLeft 0
                      , RnS.fontFamily "HelveticaNeue"
                      , RnS.fontSize 22
                      , RnS.fontWeight RnS.W300
                      , RnS.color "#4d4d4d"
                      ] ++ styles

        , RnE.onSubmitEditing $ \txt -> (tiaOnSave args $ txt, Just "")
        , RnE.onChangeText $ \txt -> \_ -> ([], Just txt)
        , RnE.onBlur $ \_ -> (tiaOnCancel args, tiaValue args)
        ] mempty

todoTextInput_ :: [PropertyOrHandler (StatefulViewEventHandler String)] -> TextInputArgs -> ReactElementM eventHandler ()
todoTextInput_ styles args = view (todoTextInput styles (fromMaybe "" $ tiaValue args)) args mempty
