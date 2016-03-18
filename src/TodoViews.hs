{-# LANGUAGE OverloadedStrings #-}
-- | The views for the TODO app
module TodoViews where

import Control.Monad (when)
import React.Flux

import TodoDispatcher
import TodoStore
import TodoComponents

-- | The controller view and also the top level of the TODO app.  This controller view registers
-- with the store and will be re-rendered whenever the store changes.
todoApp :: ReactView ()
todoApp = defineControllerView "todo app" todoStore $ \todoState () ->
    div_ $ do
        todoHeader_
        mainSection_ todoState
        todoFooter_ todoState

-- | The TODO header as a React view with no properties.
todoHeader :: ReactView ()
todoHeader = defineView "header" $ \() ->
    header_ ["id" $= "header"] $ do
        h1_ "todos"
        todoTextInput_  TextInputArgs
          { tiaId = Just "new-todo"
          , tiaClass = "new-todo"
          , tiaPlaceholder = "What needs to be done?"
          , tiaOnSave = dispatchTodo . TodoCreate
          , tiaValue = Nothing
          }

-- | A combinator for the header suitable for use inside the 'todoApp' rendering function.
todoHeader_ :: ReactElementM eventHandler ()
todoHeader_ = view todoHeader () mempty

-- | A view that does not use a ReactView and is instead just a Haskell function.
-- Note how we use an underscore to signal that this is directly a combinator that can be used
-- inside the rendering function.
mainSection_ :: TodoState -> ReactElementM ViewEventHandler ()
mainSection_ st = section_ ["id" $= "main"] $ do
    labeledInput_ "toggle-all" "Mark all as complete"
        [ "type" $= "checkbox"
        , "checked" $= if all (todoComplete . snd) $ todoList st then "checked" else ""
        , onChange $ \_ -> dispatchTodo ToggleAllComplete
        ]

    ul_ [ "id" $= "todo-list" ] $ mapM_ todoItem_ $ todoList st

-- | A view for each todo item.  We specifically use a ReactView here to take advantage of the
-- ability for React to only re-render the todo items that have changed.  Care is taken in the
-- transform function of the store to not change the Haskell object for the pair (Int, Todo), and
-- in this case React will not re-render the todo item.  For more details, see the "Performance"
-- section of the React.Flux documentation.
todoItem :: ReactView (Int, Todo)
todoItem = defineView "todo item" $ \(todoIdx, todo) ->
    li_ [ classNames [("completed", todoComplete todo), ("editing", todoIsEditing todo)]
        , "key" @= todoIdx
        ] $ do
        
        cldiv_ "view" $ do
            input_ [ "className" $= "toggle"
                   , "type" $= "checkbox"
                   , "checked" @= todoComplete todo
                   , onChange $ \_ -> dispatchTodo $ TodoSetComplete todoIdx $ not $ todoComplete todo
                   ]

            label_ [ onDoubleClick $ \_ _ -> dispatchTodo $ TodoEdit todoIdx] $
                elemText $ todoText todo

            clbutton_ "destroy" (dispatchTodo $ TodoDelete todoIdx) mempty

        when (todoIsEditing todo) $
            todoTextInput_ TextInputArgs
                { tiaId = Nothing
                , tiaClass = "edit"
                , tiaPlaceholder = ""
                , tiaOnSave = dispatchTodo . UpdateText todoIdx
                , tiaValue = Just $ todoText todo
                }

-- | A combinator for a todo item to use inside rendering functions
todoItem_ :: (Int, Todo) -> ReactElementM eventHandler ()
todoItem_ todo = viewWithKey todoItem (fst todo) todo mempty

-- | A view for the footer, taking the entire state as the properties.  This could alternatively
-- been modeled as a controller-view, attaching directly to the store.
todoFooter :: ReactView TodoState
todoFooter = defineView "footer" $ \(TodoState todos) ->
    let completed = length (filter (todoComplete . snd) todos)
        itemsLeft = length todos - completed
     in footer_ [ "id" $= "footer"] $ do

            span_ [ "id" $= "todo-count" ] $ do
                strong_ $ elemShow itemsLeft
                elemText $ if itemsLeft == 1 then " item left" else " items left"

            when (completed > 0) $ do
                button_ [ "id" $= "clear-completed"
                        , onClick $ \_ _ -> dispatchTodo ClearCompletedTodos
                        ] $
                    elemText $ "Clear completed (" ++ show completed ++ ")"

-- | A render combinator for the footer
todoFooter_ :: TodoState -> ReactElementM eventHandler ()
todoFooter_ s = view todoFooter s mempty
