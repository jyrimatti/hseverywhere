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

import           Control.Monad                                     (forM_,
                                                                    unless,
                                                                    when)
import           Prelude                                           (Int,
                                                                    Maybe (..),
                                                                    all, filter,
                                                                    id, length,
                                                                    not, snd,
                                                                    ($), (++),
                                                                    (-), (.),
                                                                    (==))
import qualified Prelude                                           as P

import           React.Flux                                        (EventHandlerCode (..),
                                                                    ReactElementM,
                                                                    StoreArg,
                                                                    View,
                                                                    elemShow,
                                                                    elemString,
                                                                    mkControllerView,
                                                                    mkView,
                                                                    view_,
                                                                    xview_,
                                                                    ($=))

import qualified React.Flux.Rn.APIs                                as RnA
import           React.Flux.Rn.Components                          (scrollView,
                                                                    text,
                                                                    touchableOpacity,
                                                                    touchableWithoutFeedback,
                                                                    view)
import           React.Flux.Rn.Components.ScrollView
import qualified React.Flux.Rn.Components.ScrollView               as SV
import           React.Flux.Rn.Components.Text
import qualified React.Flux.Rn.Components.Text                     as T
import           React.Flux.Rn.Components.TouchableOpacity
import qualified React.Flux.Rn.Components.TouchableOpacity         as TO
import           React.Flux.Rn.Components.TouchableWithoutFeedback
import qualified React.Flux.Rn.Components.TouchableWithoutFeedback as TWF
import           React.Flux.Rn.Components.View
import qualified React.Flux.Rn.Components.View                     as V
import           React.Flux.Rn.Styles.Text
import qualified React.Flux.Rn.Styles.Text                         as T_
import qualified React.Flux.Rn.Styles.TextInput                    as TI_
import           React.Flux.Rn.Styles.View
import qualified React.Flux.Rn.Styles.View                         as V_
import           React.Flux.Rn.Types

import           TodoComponents
import           TodoDispatcher
import           TodoStore

rview s x = xview_ $ mkView s x

todoApp :: View ()
todoApp = mkControllerView @'[StoreArg TodoState] "todo app" $ \todoState () ->
    scrollView [ SV.style [ V_.backgroundColor "#f5f5f5" ]] $ do
        todoHeader ()
        mainSection todoState
        todoFooter ()

todoHeader = rview "header" $ \() ->
    text [ T.style [ fontSize 100
                   , fontFamily "HelveticaNeue"
                   , fontWeight W100
                   , color $ Rgba 175 47 47 0.15
                   ]]
        "todos!"

infoStyles = [ fontFamily "HelveticaNeue"
             , fontSize 10
             , color "#bfbfbf"
             , textShadowOffset $ ContentSize 0 1
             , textShadowColor $ Rgba 255 255 255 0.5
             , T_.alignSelf Center____
             ]

todoFooter = rview "todoFooter" $ \() ->
    view [ V.style [ V_.marginTop 20
                   , V_.marginBottom 10
                   , V_.marginHorizontal 30
                   ]] $ do
        text [ T.style (T_.marginBottom 10 : infoStyles) ]
            "Long-press to edit, double-click x to delete"
        text [ T.style infoStyles ] $
            elemString ("You are running on: " ++ P.show RnA.platform)
        view [ V.style [ V_.flexWrap Wrap
                       , V_.alignSelf Center____
                       ]] $
            credit "Credits: Jyri-Matti Lähteenmäki" "https://twitter.com/jyrimatti"
        text [ T.style infoStyles ]
            "standing on the shoulders of"
        view [ V.style [ V_.flexDirection Row
                       , V_.flexWrap Wrap
                       , V_.alignSelf Center____
                       ]] $ do
            credit "GHCJS, "                "https://github.com/ghcjs/ghcjs"
            credit "React, "                "https://facebook.github.io/react/"
            credit "React-flux, "           "https://hackage.haskell.org/package/react-flux"
            credit "React-native, "         "https://facebook.github.io/react-native/"
            credit "React-native-desktop, " "https://www.npmjs.com/package/react-native-desktop"
            credit "React-native-web"       "https://github.com/necolas/react-native-web"
  where credit txt link = touchableOpacity [ TO.onPress $ dispatchTodo $ OpenLink link ] $
                              text [T.style  infoStyles] txt

mainSection todoState@(TodoState todoList filt) =
    let doFilter AcceptAll       = id
        doFilter AcceptActive    = filter (not . todoComplete . snd)
        doFilter AcceptCompleted = filter (todoComplete . snd)
        allCompleted = all (todoComplete . snd) todoList
    in
        view [ V.style [ V_.backgroundColor "#fff"
                   , V_.marginHorizontal 30
                   , V_.shadowOffset $ ContentSize 0 2
                   , V_.shadowRadius 4
                   , V_.shadowColor $ Rgba 0 0 0 0.2
                   , V_.shadowOpacity 1
                   ]] $ do
            view [ V.style [ V_.flexDirection Row ]] $ do
                touchableOpacity [ TO.onPress $ dispatchTodo ToggleAllComplete ] $
                    view [ V.style [ V_.alignItems Center______
                                , V_.alignSelf Center____
                                , V_.flexDirection Column
                                , V_.width 50
                                ]] $
                        text [ T.style [ T_.transform [RotateZ (Deg 90.0)]
                                    , color $ if allCompleted then "#4d4d4d" else "#d9d9d9"
                                    , fontSize 20
                                    , fontFamily "HelveticaNeue"
                                    ]]
                            ">"
                todoTextInput_ [ TI_.fontStyle Italic
                            , TI_.fontSize 16
                            ] TextInputArgs { tiaPlaceholder = "What needs to be done?"
                                            , tiaSaveAction = SACreate
                                            , tiaOnCancel = []
                                            , tiaValue = Nothing
                                            }

            view [ V.style [ V_.borderTopWidth 1
                        , V_.borderTopColor "#e6e6e6"
                        ]] $
                forM_ (doFilter filt todoList) todoItem

            mainSectionFooter todoState

todoItem = rview "todo item" $ \(todoIdx, todo) ->
    let isComplete = todoComplete todo
    in
        view [ V.style [ V_.flexDirection Row ] ] $ do
            unless (todoIsEditing todo) $ do
                touchableWithoutFeedback [ TWF.onPress $ dispatchTodo $ TodoSetComplete todoIdx (not isComplete) ] $
                    -- I guess IOS does not support rendering inline SVG, so let's use border and unicode instead of a check-mark image.
                    view [ V.style [ V_.width 30
                                , V_.height 30
                                , V_.alignSelf Center____
                                , V_.marginLeft 8
                                , V_.paddingTop 4
                                , V_.borderWidth 1
                                , V_.borderRadius 30
                                , V_.borderColor "#bddad5"
                                , V_.alignItems Center______
                                ]] $
                        text [ T.style [ fontSize 20, color "#5dc2af", fontFamily "HelveticaNeue" ]] $
                            if isComplete then "\x2713" else ""
                touchableOpacity [ TO.onLongPress $ dispatchTodo $ TodoEdit todoIdx ] $
                    view [ V.style [ V_.padding 15
                                , V_.flex 1
                                ]] $
                        text [ T.style [ fontSize 22
                                    , T_.marginVertical 3
                                    , fontWeight W300
                                    , color $ Color $ if isComplete then "#d9d9d9" else "#4d4d4d"
                                    , fontFamily "HelveticaNeue"
                                    , textDecorationLine $ if isComplete then LineThrough else None__________
                                    ]] $
                            elemString $ todoText todo

            when (todoIsEditing todo) $ do
                touchableWithoutFeedback [ TWF.onPress $ dispatchTodo $ TodoDelete todoIdx ] $
                    view [ V.style [ V_.width 30
                                , V_.height 30
                                , V_.alignSelf Center____
                                , V_.marginLeft 8
                                , V_.paddingTop 4
                                , V_.alignItems Center______
                                ]] $
                        text [ T.style [ fontSize 20
                                    , fontFamily "HelveticaNeue"
                                    , color "#cc9a9a"
                                    ]]
                            "x"

                view [ V.style [ V_.flex 1
                            , V_.marginLeft 15
                            , V_.marginTop 1
                            ]] $
                    todoTextInput_ [] TextInputArgs { tiaPlaceholder = ""
                                                    , tiaSaveAction = SAUpdate todoIdx
                                                    , tiaOnCancel = [CancelUpdateWithDelay todoIdx]
                                                    , tiaValue = Just $ todoText todo
                                                    }

footerStyles = [ color "#777"
               , fontFamily "HelveticaNeue"
               , fontWeight W300
               ]

filterStyle = [ V_.paddingHorizontal 7
              , V_.marginHorizontal 10
              ]
activeFilterStyle = [ V_.borderWidth 1
                    , V_.borderColor $ Rgba 175 47 47 0.2
                    , V_.borderRadius 3
                    ]

mainSectionFooter :: TodoState -> ReactElementM eventHandler ()
mainSectionFooter = rview "msfooter" $ \(TodoState todos filtering) ->
    let completed = length (filter (todoComplete . snd) todos)
        itemsLeft = length todos - completed
        styling f = V.style  $ filterStyle ++ (if f == filtering then activeFilterStyle else [])
     in
        view [V.style [ V_.flexDirection Row
                      , V_.borderTopWidth 1
                      , V_.borderTopColor "#e6e6e6"
                      , V_.paddingVertical 10
                      , V_.paddingHorizontal 15
                      , V_.justifyContent SpaceBetween_
                ]] $ do
            view [ V.style  [V_.flexDirection Row] ] $ do
                text [T.style  $ fontWeight Bold : footerStyles] $
                    elemShow itemsLeft
                text [T.style  footerStyles] $
                    if itemsLeft == 1 then " item left" else " items left"

            view [ V.style [ V_.flexDirection Row
                           , V_.justifyContent Center_____
                           , V_.flexWrap Wrap
                           , V_.flex 1
                           ]] $ do
                touchableOpacity [ TO.onPress $ dispatchTodo (SetFilter AcceptAll) ] $
                    view [styling AcceptAll] $
                        text [T.style  [fontFamily "HelveticaNeue"]] "All"
                touchableOpacity [ TO.onPress $ dispatchTodo (SetFilter AcceptActive) ] $
                    view [styling AcceptActive] $
                        text [T.style  [fontFamily "HelveticaNeue"]] "Active"
                touchableOpacity [ TO.onPress $ dispatchTodo (SetFilter AcceptCompleted) ] $
                    view [styling AcceptCompleted] $
                        text [T.style  [fontFamily "HelveticaNeue"]] "Completed"

            touchableOpacity [ TO.onPress $ dispatchTodo ClearCompletedTodos ] $
                view [ V.style (if completed == 0 then [V_.opacity 0] else []) ] $
                    text [ T.style (T_.flexWrap Wrap : footerStyles) ]
                        "Clear completed"

