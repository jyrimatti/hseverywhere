{-# LANGUAGE OverloadedStrings #-}
module TodoViews where

import GHCJS.Marshal (ToJSVal(..), toJSVal_aeson)
import GHCJS.Types (JSVal)

import qualified Data.Aeson as A

import React.Flux (defineView, defineControllerView, defineStatefulView, view, ReactView, ReactElementM, ViewEventHandler, elemShow)

import React.Flux (($=),(@=),property)

import qualified React.Flux.Rn.Components as Rn
import qualified React.Flux.Rn.Style as RnS
import qualified React.Flux.Rn.Events as RnE

import TodoDispatcher
import TodoStore
import TodoComponents


_NOT_IMPLEMENTED = dispatchTodo $ Alert "Sorry, not implemented yet :("


todoApp :: ReactView ()
todoApp = defineControllerView "todo app" todoStore $ \todoState () -> do
    Rn.view [RnS.style [ RnS.backgroundColor "#f5f5f5"
                       , RnS.paddingHorizontal 50
                       , RnS.flex 1
            ]] $ do
       todoHeader_
       mainSection_ todoState
       todoFooter_

todoHeader :: ReactView ()
todoHeader = defineView "header" $ \() -> do
        Rn.text [RnS.style [ RnS.alignSelf RnS.SCenter
                           , RnS.fontSize 100
                           , RnS.fontFamily "HelveticaNeue"
                           , RnS.fontWeight RnS.W100
                           , RnS.color $ RnS.Rgba 175 47 47 0.15
                ]] "todos"

todoHeader_ :: ReactElementM eventHandler ()
todoHeader_ = view todoHeader () mempty

infoStyles = [ RnS.fontFamily "HelveticaNeue"
             , RnS.fontSize 10
             , RnS.color "#bfbfbf"
             , RnS.textShadowOffset 0 1
             , RnS.textShadowColor $ RnS.Rgba 255 255 255 0.5
             , RnS.alignSelf RnS.SCenter
             ]

todoFooter :: ReactView ()
todoFooter = defineView "todoFooter" $ \() -> do
    Rn.view [RnS.style [ RnS.marginTop 65 ]] $ do
        Rn.text [RnS.style infoStyles] "Long-press to edit a todo"
        Rn.touchableHighlight [ RnE.onPress $ _NOT_IMPLEMENTED ] $ do
            Rn.text [RnS.style infoStyles] "Credits: Jyri-Matti Lähteenmäki"
        Rn.touchableHighlight [ RnE.onPress $ _NOT_IMPLEMENTED] $ do
            Rn.text [RnS.style infoStyles] "Future part of TodoMVC?"


todoFooter_ :: ReactElementM eventHandler ()
todoFooter_ = view todoFooter () mempty

mainSection_ :: TodoState -> ReactElementM ViewEventHandler ()
mainSection_ todoState@(TodoState todoList filt) = do
    Rn.view [RnS.style [ RnS.backgroundColor "#fff"
                       , RnS.shadowOffset 0 2
                       , RnS.shadowRadius 4
                       , RnS.shadowColor $ RnS.Rgba 0 0 0 0.2
                       , RnS.shadowOpacity 1
            ]] $ do
        Rn.view [RnS.style [RnS.flexDirection RnS.Row]] $ do
            Rn.touchableHighlight [ RnE.onPress $ dispatchTodo ToggleAllComplete
                                  , RnS.style [ RnS.alignItems RnS.ICenter
                                              , RnS.alignSelf RnS.SCenter
                                              , RnS.flexDirection RnS.Column
                                              , RnS.width 60
                                              ]
                                  ] $ do
                Rn.text [ "checked" $= if all (todoComplete . snd) $ todoList then "checked" else ""
                        , RnS.style [ RnS.transform [RnS.RotateZ "90deg"]
                                    , RnS.color $ if allCompleted then "#4d4d4d" else "#d9d9d9"
                                    , RnS.fontSize 22
                                    ]
                        ] ">"
            todoTextInput_ TextInputArgs
              { tiaPlaceholder = "What needs to be done?"
              , tiaOnSave = \txt -> dispatchTodo $ TodoCreate txt
              }

        Rn.listView
           [ property "dataSource" $ JsApply js_newListViewDataSource (doFilter filt $ map snd $ todoList)
           , property "renderRow" js_renderRow
           , RnS.style [ RnS.borderTopWidth 1
                       , RnS.borderTopColor "#e6e6e6"
                       ]
           ] mempty

        mainSectionFooter_ todoState
  where doFilter All = id
        doFilter Active = filter (not . todoComplete)
        doFilter Completed = filter todoComplete
        allCompleted = all todoComplete $ map snd $ todoList

data JsApply f = JsApply (JSVal -> IO JSVal) f
instance A.ToJSON f => ToJSVal (JsApply f) where
  toJSVal (JsApply f x) = toJSVal_aeson x >>= f

instance A.ToJSON Todo where
    toJSON (Todo t c i) = A.object [ "text" A..= t
                                   , "complete" A..= c
                                   , "isEditing" A..= i
                                   ]

foreign import javascript unsafe
    "new ListView.DataSource({rowHasChanged: function(r1, r2) { return r1 !== r2; }}).cloneWithRows($1)"
  js_newListViewDataSource :: JSVal -> IO JSVal

-- FIXME: Has to be implemented in JS until react-flux supports callbacks returning renderables
-- I guess IOS does not support rendering inline SVG, so let's use border and unicode instead of a check-mark image.
foreign import javascript unsafe
    "function(rowdata) {\
\      return React.createElement(View, {'style': {'flexDirection': 'row'}}, [\
\               React.createElement(TouchableWithoutFeedback, {'onPress': function() { Alert.alert('Sorry, not implemented yet :('); }}, React.createElement(View, {\
\                 'style': {\
\                   'width': 30,\
\                   'height': 30,\
\                   'alignSelf': 'center',\
\                   'marginLeft': 8,\
\                   'paddingTop': 4,\
\                   'borderWidth': 1,\
\                   'borderRadius': 30,\
\                   'borderColor': '#bddad5',\
\                   'alignItems': 'center'}}, React.createElement(Text, {'style': {\
\                     'fontSize': 20,\
\                     'color': '#5dc2af'}}, rowdata.complete ? '\x2713' : ''))),\
\               React.createElement(TouchableHighlight, {'onLongPress': function() { Alert.alert('Sorry, not implemented yet :('); }, 'style': {'padding': 15}}, React.createElement(Text, {\
\                 'style': {\
\                   'paddingRight': 60,\
\                   'fontSize': 24,\
\                   'fontWeight': '300',\
\                   'color': rowdata.complete ? '#d9d9d9' : '#4d4d4d',\
\                   'fontFamily': 'HelveticaNeue',\
\                   'textDecorationLine': (rowdata.complete ? 'line-through' : 'none')}}, rowdata.text))]);\
\    }"
  js_renderRow :: JSVal

{-
todoItem :: ReactView (Int, Todo)
todoItem = defineView "todo item" $ \(todoIdx, todo) ->
    li_ [
          "key" @= todoIdx
        ] $ do

        cldiv_ "view" $ do
            input_ [ "className" $= "toggle"
                   , "type" $= "checkbox"
                   , "checked" @= todoComplete todo
                   , onChangeText $ \str -> dispatchTodo $ TodoSetComplete todoIdx $ not $ todoComplete todo
                   ]

            label_ [ onDoubleClick $ \_ _ -> dispatchTodo $ TodoEdit todoIdx] $
                elemText $ todoText todo

            clbutton_ "destroy" (dispatchTodo $ TodoDelete todoIdx) mempty

        when (todoIsEditing todo) $
            todoTextInput_ TextInputArgs
                { tiaPlaceholder = ""
                , tiaOnSave = dispatchTodo . UpdateText todoIdx
                , tiaValue = Just $ todoText todo
                }

todoItem_ :: (Int, Todo) -> ReactElementM eventHandler ()
todoItem_ todo = viewWithKey todoItem (fst todo) todo mempty
-}

footerStyles = [ RnS.color "#777"
               , RnS.fontFamily "HelveticaNeue"
               , RnS.fontWeight RnS.W300
               ]

filterStyle = [ RnS.paddingHorizontal 7
              , RnS.marginHorizontal 3
              ]
activeFilterStyle = [ RnS.borderWidth 1
                    , RnS.borderColor $ RnS.Rgba 175 47 47 0.2
                    , RnS.borderRadius 3
                    ]

mainSectionFooter :: ReactView TodoState
mainSectionFooter = defineView "footer" $ \(TodoState todos filtering) ->
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

            Rn.view [ RnS.style [ RnS.alignItems RnS.ICenter ]] $ do
                Rn.touchableHighlight [ RnE.onPress $ dispatchTodo (SetFilter All), styling All] $ do
                    Rn.text [] "All"
                Rn.touchableHighlight [ RnE.onPress $ dispatchTodo (SetFilter Active), styling Active] $ do
                    Rn.text [] "Active"
                Rn.touchableHighlight [ RnE.onPress $ dispatchTodo (SetFilter Completed), styling Completed] $ do
                    Rn.text [] "Completed"

            Rn.touchableHighlight [ RnE.onPress $ dispatchTodo ClearCompletedTodos
                                  , RnS.style (if completed == 0 then [RnS.opacity 0] else []) ] $
                Rn.text [RnS.style footerStyles] "Clear completed"

mainSectionFooter_ :: TodoState -> ReactElementM eventHandler ()
mainSectionFooter_ s = view mainSectionFooter s mempty
