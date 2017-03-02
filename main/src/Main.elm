module Main exposing (..)

import Navigation exposing (program)
import Model exposing (Model)
import Msg exposing (Msg, Msg(UrlChange))
import Update exposing (update, init)
import View exposing (view)


main : Program Never Model Msg
main =
    program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }
