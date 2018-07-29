{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE PartialTypeSignatures #-}
module TodoComponents where

import           Data.Maybe                         (fromMaybe)
import           Data.Typeable                      (Typeable)
import           Prelude
import           React.Flux                         hiding (onBlur, style)

import           React.Flux.Rn.Components           (Styles, TextInput,
                                                     textInput)
import           React.Flux.Rn.Components.TextInput
import           React.Flux.Rn.Styles.TextInput


import           TodoDispatcher
import           TodoStore

data TextInputArgs = TextInputArgs {
      tiaPlaceholder :: String
    , tiaSaveAction  :: SaveAction
    , tiaOnCancel    :: [TodoAction]
    , tiaValue       :: Maybe String
} deriving (Eq, Typeable)

data SaveAction = SACreate | SAUpdate Int
  deriving (Eq, Typeable)

tiaOnSave :: TextInputArgs -> String -> [SomeStoreAction]
tiaOnSave ta txt = dispatchTodo . f $ tiaSaveAction ta
  where
    f SACreate     = TodoCreate txt
    f (SAUpdate i) = UpdateText i txt

todoTextInput :: [Styles TextInput _] -> String -> View TextInputArgs
todoTextInput styles state = mkStatefulView "todo text input" state $ \curText args ->
    textInput [
      placeholder (tiaPlaceholder args)
    , value curText
    , autoFocus True
    , blurOnSubmit True
    , style $ [ flex 1
              , height 45
              , margin "8%"
              , marginLeft 0
              , fontFamily "HelveticaNeue"
              , fontSize 22
              , fontWeight W300
              , color "#4d4d4d"
              ] ++ styles

    , onChangeText $ \text -> const ([], Just text)
    , onBlur $ \curState ->
        if not (null curState)
            then (tiaOnSave args curState, Just "")
            else ([], Nothing)
    ] mempty

todoTextInput_ :: _ -> TextInputArgs -> ReactElementM eventHandler ()
todoTextInput_ styles args = view_ (todoTextInput styles $ fromMaybe "" $ tiaValue args) "todo-input" args
