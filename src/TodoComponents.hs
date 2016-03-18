{-# LANGUAGE OverloadedStrings #-}

-- | The division between a view and a component is arbitrary, but for me components are pieces that
-- are re-used many times for different purposes.  In the TODO app, there is one component for the
-- text box.
module TodoComponents where

import Data.Typeable (Typeable)
import React.Flux

-- | The properties for the text input component.  Note how we can pass anything, including
-- functions, as the properties; the only requirement is an instance of Typeable.
data TextInputArgs = TextInputArgs {
      tiaId :: Maybe String
    , tiaClass :: String
    , tiaPlaceholder :: String
    , tiaOnSave :: String -> [SomeStoreAction]
    , tiaValue :: Maybe String
} deriving (Typeable)

-- | The text input stateful view.  The state is the text that has been typed into the textbox
-- but not yet saved.  The save is triggered either on enter or blur, which resets the state/content
-- of the text box to the empty string.
todoTextInput :: ReactView TextInputArgs
todoTextInput = defineStatefulView "todo text input" "" $ \curText args ->
    input_ $
        maybe [] (\i -> ["id" @= i]) (tiaId args)
        ++
        [ "className" @= tiaClass args
        , "placeholder" @= tiaPlaceholder args
        , "value" @= curText -- using value here creates a controlled component: https://facebook.github.io/react/docs/forms.html
        , "autoFocus" @= True

        -- Update the current state with the current text in the textbox, sending no actions
        , onChange $ \evt _ -> ([], Just $ target evt "value")

        -- Produce the save action and reset the current state to the empty string
        , onBlur $ \_ _ curState ->
            if not (null curState)
                then (tiaOnSave args curState, Just "")
                else ([], Nothing)
        , onKeyDown $ \_ evt curState ->
             if keyCode evt == 13 && not (null curState) -- 13 is enter
                 then (tiaOnSave args curState, Just "")
                 else ([], Nothing)
        ]

-- | A combinator suitible for use inside rendering functions.
todoTextInput_ :: TextInputArgs -> ReactElementM eventHandler ()
todoTextInput_ args = view todoTextInput args mempty
