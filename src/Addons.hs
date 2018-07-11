{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module Addons where

import           Prelude    (String)
import           React.Flux (foreign_)

{-# ANN module ("HLint: ignore Use camelCase" :: String) #-}

icon_entypo        = foreign_ "Icon.Entypo"
icon_evilicons     = foreign_ "Icon.EvilIcons"
icon_fontawesome   = foreign_ "Icon.FontAwesome"
icon_foundation    = foreign_ "Icon.Foundation"
icon_ionicons      = foreign_ "Icon.Ionicons"
icon_materialicons = foreign_ "Icon.MaterialIcons"
icon_octicons      = foreign_ "Icon.Octicons"
icon_zocial        = foreign_ "Icon.Zocial"

i18n = foreign_ "I18n"

animatable = foreign_ "Animatable"

gl = foreign_ "GL"
