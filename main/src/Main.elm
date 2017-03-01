module Main exposing (..)

import Navigation exposing (Location, program)
import Routes exposing (getPageFromLocation)
import Model exposing (Model)
import Msg exposing (Msg)
import Update exposing (update)
import View exposing (view)
import Types exposing (Context)
import Navbar.Update as Navbar


main : Program Never Model Msg
main =
    program Msg.UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }


init : Location -> ( Model, Cmd Msg )
init location =
    let
        context =
            Context
                Nothing
                (getPageFromLocation location)
    in
        Model
            context
            (Navbar.init context)
            ! []
