{-# LANGUAGE NoImplicitPrelude     #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE PartialTypeSignatures #-}
module TodoComponents where

import           Data.Maybe                         (fromMaybe)
import           Data.Typeable                      (Typeable)
import           Prelude                            (Bool (..), Eq, Int,
                                                     Maybe (..), String, const,
                                                     flip, mempty, not, null,
                                                     ($), (++), (.))

import           React.Flux                         (SomeStoreAction)
import           React.Flux.Rn.Components.TextInput
import           React.Flux.Rn.Properties           (Styles)
import           React.Flux.Rn.Styles.TextInput
import           React.Flux.Rn.Views


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

todoTextInput :: [Styles TextInput _] -> TextInputArgs -> ReactElementM handler ()
todoTextInput styles args = flip (mkStatefulView "todo text input" (fromMaybe "" $ tiaValue args)) args $ \curText args ->
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
