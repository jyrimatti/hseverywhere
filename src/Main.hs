module Main where

import React.Flux
import TodoViews

main :: IO ()
main = reactRender "todoapp" todoApp ()
