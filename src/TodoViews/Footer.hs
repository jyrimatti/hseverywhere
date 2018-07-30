{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}

module TodoViews.Footer where

import           Prelude                                   (($), (++))
import qualified Prelude                                   as P

import           React.Flux.Rn.Views

import           React.Flux                                (elemString)
import qualified React.Flux.Rn.APIs                        as RnA
import           React.Flux.Rn.Components.ScrollView
import           React.Flux.Rn.Components.Text
import qualified React.Flux.Rn.Components.Text             as T
import           React.Flux.Rn.Components.TouchableOpacity
import qualified React.Flux.Rn.Components.TouchableOpacity as TO
import           React.Flux.Rn.Components.View
import qualified React.Flux.Rn.Components.View             as V
import           React.Flux.Rn.Styles.Text
import qualified React.Flux.Rn.Styles.View                 as V_

import           TodoDispatcher
import           TodoStore

infoStyles = [ fontFamily "HelveticaNeue"
             , fontSize 10
             , color "#bfbfbf"
             , textShadowOffset $ ContentSize 0 1
             , textShadowColor $ Rgba 255 255 255 0.5
             , alignSelf Center____
             ]

todoFooter = mkView "todoFooter" $ \() ->
    view [ V.style [ V_.marginTop 20
                   , V_.marginBottom 10
                   , V_.marginHorizontal 30
                   ]] $ do
        text [ T.style (marginBottom 10 : infoStyles) ]
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
