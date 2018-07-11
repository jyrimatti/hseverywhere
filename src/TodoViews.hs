{-# LANGUAGE CPP                       #-}
{-# LANGUAGE DataKinds                 #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE FlexibleInstances         #-}
{-# LANGUAGE MultiParamTypeClasses     #-}
{-# LANGUAGE OverloadedStrings         #-}
{-# LANGUAGE PolyKinds                 #-}
{-# LANGUAGE ScopedTypeVariables       #-}
{-# LANGUAGE TypeApplications          #-}
{-# LANGUAGE TypeFamilies              #-}
{-# LANGUAGE TypeFamilyDependencies    #-}
{-# LANGUAGE TypeOperators             #-}
{-# LANGUAGE UndecidableInstances      #-}

module TodoViews where

import           Control.Monad                             (forM_, unless, when)
import           Prelude

import           React.Flux                                (EventHandlerCode (..),
                                                            ReactElementM,
                                                            StoreArg, View,
                                                            elemShow,
                                                            elemString,
                                                            mkControllerView,
                                                            mkView, view_,
                                                            xview_, ($=))

import qualified React.Flux.Rn.APIs                        as RnA
import qualified React.Flux.Rn.Components                  as Rn
import           React.Flux.Rn.Components.TouchableOpacity
import qualified React.Flux.Rn.Style                       as RnS

import           TodoComponents
import           TodoDispatcher
import           TodoStore

todoApp :: View ()
todoApp = mkControllerView @'[StoreArg TodoState] "todo app" $ \todoState () ->
    Rn.scrollView [ RnS.style [ RnS.backgroundColor "#f5f5f5"
                              ]] $ do
       todoHeader_
       mainSection_ todoState
       todoFooter_

todoHeader :: View ()
todoHeader = mkView "header" $ \() ->
        Rn.text [RnS.style [ RnS.alignSelf RnS.SCenter
                           , RnS.fontSize 100
                           , RnS.fontFamily "HelveticaNeue"
                           , RnS.fontWeight RnS.W100
                           , RnS.color $ RnS.Rgba 175 47 47 0.15
                           , RnS.marginHorizontal 30
                           ]]
            "todos!"

todoHeader_ :: ReactElementM eventHandler ()
todoHeader_ = view_ todoHeader "header" ()

infoStyles = [ RnS.fontFamily "HelveticaNeue"
             , RnS.fontSize 10
             , RnS.color "#bfbfbf"
             , RnS.textShadowOffset 0 1
             , RnS.textShadowColor $ RnS.Rgba 255 255 255 0.5
             , RnS.alignSelf RnS.SCenter
             ]

todoFooter :: View ()
todoFooter = mkView "todoFooter" $ \() ->
    Rn.view [RnS.style [ RnS.marginTop 20
                       , RnS.marginBottom 10
                       , RnS.marginHorizontal 30
                       ]] $ do
        Rn.text [RnS.style $ RnS.marginBottom 10 : infoStyles] "Long-press to edit, double-click x to delete"
        Rn.text [RnS.style infoStyles] $ elemString ("You are running on: " ++ show RnA.platform)
        Rn.view [ RnS.style [ RnS.flexWrap RnS.Wrap
                            , RnS.alignSelf RnS.SCenter
                            ]] $
            credit "Credits: Jyri-Matti Lähteenmäki" "https://twitter.com/jyrimatti"
        Rn.text [RnS.style infoStyles] "standing on the shoulders of"
        Rn.view [ RnS.style [ RnS.flexDirection RnS.Row
                            , RnS.flexWrap RnS.Wrap
                            , RnS.alignSelf RnS.SCenter
                            ]] $ do
            credit "GHCJS, " "https://github.com/ghcjs/ghcjs"
            credit "React, " "https://facebook.github.io/react/"
            credit "React-flux, " "https://hackage.haskell.org/package/react-flux"
            credit "React-native, " "https://facebook.github.io/react-native/"
            credit "React-native-desktop, " "https://www.npmjs.com/package/react-native-desktop"
            credit "React-native-web" "https://github.com/necolas/react-native-web"
  where credit text link = Rn.touchableOpacity [ onPress $ dispatchTodo $ OpenLink link ] $
                               Rn.text [RnS.style infoStyles] text

todoFooter_ :: ReactElementM eventHandler ()
todoFooter_ = view_ todoFooter "footer" ()

mainSection_ :: TodoState -> ReactElementM 'EventHandlerCode ()
mainSection_ todoState@(TodoState todoList filt) =
    Rn.view [RnS.style [ RnS.backgroundColor "#fff"
                       , RnS.marginHorizontal 30
                       , RnS.shadowOffset 0 2
                       , RnS.shadowRadius 4
                       , RnS.shadowColor $ RnS.Rgba 0 0 0 0.2
                       , RnS.shadowOpacity 1
                       ]] $ do
        Rn.view [RnS.style [RnS.flexDirection RnS.Row]] $ do
            Rn.touchableOpacity [ onPress $ dispatchTodo ToggleAllComplete
                                , RnS.style [ RnS.alignItems RnS.ICenter
                                            , RnS.alignSelf RnS.SCenter
                                            , RnS.flexDirection RnS.Column
                                            , RnS.width 50
                                            ]] $
                Rn.text [ "checked" $= if all (todoComplete . snd) todoList then "checked" else ""
                        , RnS.style [ RnS.transform [RnS.RotateZ "90deg"]
                                    , RnS.color $ if allCompleted then "#4d4d4d" else "#d9d9d9"
                                    , RnS.fontSize 20
                                    , RnS.fontFamily "HelveticaNeue"
                                    ]]
                    ">"
            todoTextInput_ [ RnS.fontStyle RnS.Italic
                           , RnS.fontSize 16
                           ] TextInputArgs { tiaPlaceholder = "What needs to be done?"
                                           , tiaSaveAction = SACreate
                                           , tiaOnCancel = []
                                           , tiaValue = Nothing
                                           }

        Rn.view [ RnS.style [ RnS.borderTopWidth 1
                            , RnS.borderTopColor "#e6e6e6"
                            ]] $
            forM_ (doFilter filt todoList) todoItem_

        -- FIXME: Would use ListView but it's not working yet (react-flux and react-native-web)
        {-
        Rn.listView
           [ property "dataSource" $ JsApply js_newListViewDataSource (doFilter filt $ map snd $ todoList)
           , property "renderRow" js_renderRow
           , RnS.style [ RnS.borderTopWidth 1
                       , RnS.borderTopColor "#e6e6e6"
                       ]
           ] mempty
        -}

        mainSectionFooter todoState
  where doFilter All       = id
        doFilter Active    = filter (not . todoComplete . snd)
        doFilter Completed = filter (todoComplete . snd)
        allCompleted = all (todoComplete . snd) todoList


todoItem :: View (Int, Todo)
todoItem = mkView "todo item" $ \(todoIdx, todo) ->
    let isComplete = todoComplete todo
    in Rn.view [ RnS.style [ RnS.flexDirection RnS.Row ]
               ] $ do
        unless (todoIsEditing todo) $ do
            Rn.touchableWithoutFeedback [ onPress $ dispatchTodo $ TodoSetComplete todoIdx (not isComplete) ] $
                -- I guess IOS does not support rendering inline SVG, so let's use border and unicode instead of a check-mark image.
                Rn.view [ RnS.style [ RnS.width 30
                                    , RnS.height 30
                                    , RnS.alignSelf RnS.SCenter
                                    , RnS.marginLeft 8
                                    , RnS.paddingTop 4
                                    , RnS.borderWidth 1
                                    , RnS.borderRadius 30
                                    , RnS.borderColor "#bddad5"
                                    , RnS.alignItems RnS.ICenter
                                    ]] $
                    case RnA.platform of
                        --RnA.IOS | isComplete -> Addons.icon_materialicons ["name" $= "done", "size" @= (20 :: Int), "color" $= "#5dc2af"] mempty
                        --RnA.IOS              -> mempty
                        _                    -> Rn.text [ RnS.style [ RnS.fontSize 20, RnS.color "#5dc2af", RnS.fontFamily "HelveticaNeue" ]] $ if isComplete then "\x2713" else ""
            Rn.touchableOpacity [ onLongPress $ dispatchTodo $ TodoEdit todoIdx
                                , RnS.style [ RnS.padding 15
                                            , RnS.flex 1
                                            ]] $
                Rn.text [ RnS.style [ RnS.fontSize 22
                                    , RnS.marginVertical 3
                                    , RnS.fontWeight RnS.W300
                                    , RnS.color $ RnS.Color $ if isComplete then "#d9d9d9" else "#4d4d4d"
                                    , RnS.fontFamily "HelveticaNeue"
                                    , RnS.textDecorationLine $ if isComplete then RnS.LineThrough else RnS.None
                                    ]] $
                    elemString $ todoText todo

        when (todoIsEditing todo) $ do
            Rn.touchableWithoutFeedback [ onPress $ dispatchTodo $ TodoDelete todoIdx ] $
                Rn.view [ RnS.style [ RnS.width 30
                                    , RnS.height 30
                                    , RnS.alignSelf RnS.SCenter
                                    , RnS.marginLeft 8
                                    , RnS.paddingTop 4
                                    , RnS.alignItems RnS.ICenter
                                    ]] $
                    Rn.text [ RnS.style [ RnS.fontSize 20
                                        , RnS.fontFamily "HelveticaNeue"
                                        , RnS.color "#cc9a9a"
                                        ]]
                        "x"

            Rn.view [ RnS.style [ RnS.flex 1
                                , RnS.marginLeft 15
                                , RnS.marginTop 1
                                ]] $
                todoTextInput_ [] TextInputArgs { tiaPlaceholder = ""
                                                , tiaSaveAction = SAUpdate todoIdx
                                                , tiaOnCancel = [CancelUpdateWithDelay todoIdx]
                                                , tiaValue = Just $ todoText todo
                                                }

todoItem_ :: (Int, Todo) -> ReactElementM eventHandler ()
todoItem_ todo = xview_ todoItem todo


footerStyles = [ RnS.color "#777"
               , RnS.fontFamily "HelveticaNeue"
               , RnS.fontWeight RnS.W300
               ]

filterStyle = [ RnS.paddingHorizontal 7
              , RnS.marginHorizontal 10
              ]
activeFilterStyle = [ RnS.borderWidth 1
                    , RnS.borderColor $ RnS.Rgba 175 47 47 0.2
                    , RnS.borderRadius 3
                    ]

mainSectionFooter :: TodoState -> ReactElementM eventHandler ()
mainSectionFooter = xview_ $ mkView "msfooter" $ \(TodoState todos filtering) ->
    let completed = length (filter (todoComplete . snd) todos)
        itemsLeft = length todos - completed
        styling f = RnS.style $ filterStyle ++ (if f == filtering then activeFilterStyle else [])
     in Rn.view [RnS.style [ RnS.flexDirection RnS.Row
                           , RnS.borderTopWidth 1
                           , RnS.borderTopColor "#e6e6e6"
                           , RnS.paddingVertical 10
                           , RnS.paddingHorizontal 15
                           , RnS.justifyContent RnS.JSpaceBetween
                ]] $ do
            Rn.view [ RnS.style [RnS.flexDirection RnS.Row] ] $ do
                Rn.text [RnS.style $ RnS.fontWeight RnS.WBold : footerStyles] $ elemShow itemsLeft
                Rn.text [RnS.style footerStyles] $ if itemsLeft == 1 then " item left" else " items left"

            Rn.view [ RnS.style [ RnS.flexDirection RnS.Row
                                , RnS.justifyContent RnS.JCenter
                                , RnS.flexWrap RnS.Wrap
                                , RnS.flex 1
                                ]] $ do
                Rn.touchableOpacity [ onPress $ dispatchTodo (SetFilter All), styling All] $
                    Rn.text [RnS.style [RnS.fontFamily "HelveticaNeue"]] "All"
                Rn.touchableOpacity [ onPress $ dispatchTodo (SetFilter Active), styling Active] $
                    Rn.text [RnS.style [RnS.fontFamily "HelveticaNeue"]] "Active"
                Rn.touchableOpacity [ onPress $ dispatchTodo (SetFilter Completed), styling Completed] $
                    Rn.text [RnS.style [RnS.fontFamily "HelveticaNeue"]] "Completed"

            Rn.touchableOpacity [ onPress $ dispatchTodo ClearCompletedTodos
                                , RnS.style (if completed == 0 then [RnS.opacity 0] else [])
                                ] $
                Rn.text [ RnS.style footerStyles
                        , RnS.flexWrap RnS.Wrap
                        ]
                    "Clear completed"

