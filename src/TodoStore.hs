{-# LANGUAGE TypeFamilies, DeriveGeneric, DeriveAnyClass #-}
module TodoStore where

import React.Flux
import Control.DeepSeq
import GHC.Generics (Generic)
import Data.Typeable (Typeable)

data Todo = Todo {
    todoText :: String
  , todoComplete :: Bool
  , todoIsEditing :: Bool
} deriving (Show, Typeable)

newtype TodoState = TodoState {
    todoList :: [(Int, Todo)]
} deriving (Show, Typeable)

data TodoAction = TodoCreate String
                | TodoDelete Int
                | TodoEdit Int
                | UpdateText Int String
                | ToggleAllComplete
                | TodoSetComplete Int Bool
                | ClearCompletedTodos
  deriving (Show, Typeable, Generic, NFData)

instance StoreData TodoState where
    type StoreAction TodoState = TodoAction
    transform action (TodoState todos) = do
        putStrLn $ "Action: " ++ show action
        putStrLn $ "Initial todos: " ++ show todos

        -- Care is taken here to leave the Haskell object for the pair (Int, Todo) unchanged if the todo
        -- itself is unchanged.  This allows React to avoid re-rendering the todo when it does not change.
        -- For more, see the "Performance" section of the React.Flux haddocks.
        newTodos <- return $ case action of
            (TodoCreate txt) -> (maximum (map fst todos) + 1, Todo txt False False) : todos
            (TodoDelete i) -> filter ((/=i) . fst) todos
            (TodoEdit i) -> let f (idx, todo) | idx == i = (idx, todo { todoIsEditing = True })
                                f p = p
                             in map f todos
            (UpdateText newIdx newTxt) ->
                let f (idx, todo) | idx == newIdx = (idx, todo { todoText = newTxt, todoIsEditing = False })
                    f p = p
                 in map f todos
            ToggleAllComplete -> [ (idx, Todo txt True False) | (idx, Todo txt _ _) <- todos ]
            TodoSetComplete newIdx newComplete ->
                let f (idx, todo) | idx == newIdx = (idx, todo { todoComplete = newComplete })
                    f p = p
                 in map f todos
            ClearCompletedTodos -> filter (not . todoComplete . snd) todos

        putStrLn $ "New todos: " ++ show newTodos
        return $ TodoState newTodos

todoStore :: ReactStore TodoState
todoStore = mkStore $ TodoState
    [ (0, Todo "Learn react" True False)
    , (1, Todo "Learn react-flux" False False)
    ]
