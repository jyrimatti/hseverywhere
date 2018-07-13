{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE PartialTypeSignatures #-}
module TodoComponents where

import           Data.Maybe                         (fromMaybe)
import           Data.Semigroup                     ((<>))
import           Data.Typeable                      (Typeable)
import           Prelude
import           React.Flux                         hiding (onBlur, style)

import           React.Flux.Rn.Components           (textInput)
import           React.Flux.Rn.Components.TextInput
import qualified React.Flux.Rn.Style                as RnS


import           TodoDispatcher
import           TodoStore

data TextInputArgs = TextInputArgs {
      tiaPlaceholder :: String
    , tiaSaveAction  :: SaveAction
    , tiaOnCancel    :: [TodoAction]
    , tiaValue       :: Maybe String
} deriving (Typeable, Eq)

data SaveAction = SACreate | SAUpdate Int
  deriving (Eq, Typeable)

tiaOnSave :: TextInputArgs -> String -> [SomeStoreAction]
tiaOnSave ta txt = dispatchTodo . f $ tiaSaveAction ta
  where
    f SACreate     = TodoCreate txt
    f (SAUpdate i) = UpdateText i txt

todoTextInput :: _ -> String -> View TextInputArgs
todoTextInput styles state = mkStatefulView "todo text input" state $ \curText args ->
    textInput [
      placeholder (tiaPlaceholder args)
    , value curText
    , autoFocus True
    , blurOnSubmit True
    , style [ RnS.flex 1
                    , RnS.height 45
                    , RnS.margin 8
                    , RnS.marginLeft 0
                    , RnS.fontFamily "HelveticaNeue"
                    , RnS.fontSize 22
                    , RnS.fontWeight RnS.W300
                    , RnS.color "#4d4d4d"
                    ] ++ styles

    , onChangeText $ \text -> const ([], Just text)
    , onBlur $ \curState ->
        if not (null curState)
            then (tiaOnSave args curState, Just "")
            else ([], Nothing)
    ] mempty

todoTextInput_ :: _ -> TextInputArgs -> ReactElementM eventHandler ()
todoTextInput_ styles args = view_ (todoTextInput styles $ fromMaybe "" $ tiaValue args) "todo-input" args
