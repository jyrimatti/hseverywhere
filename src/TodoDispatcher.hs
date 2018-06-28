{-# LANGUAGE TypeApplications #-}
module TodoDispatcher (dispatchTodo, handleTodo) where

import React.Flux
import TodoStore

dispatchTodo :: TodoAction -> [SomeStoreAction]
dispatchTodo a = [action @TodoState a]

handleTodo :: TodoAction -> ([SomeStoreAction], [EventModification])
handleTodo = simpleHandler . dispatchTodo