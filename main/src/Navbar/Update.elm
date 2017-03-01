module Navbar.Update exposing (..)

import Msg as AppMsg
import Types exposing (Context)
import Utilities exposing (getCmdForMsg, (!!))
import Navbar.Model exposing (Model)
import Navbar.Msg exposing (Msg(..))


init : Context -> Model
init context =
    Model []


update : Context -> Msg -> Model -> ( Model, Cmd Msg, Cmd AppMsg.Msg )
update context msg model =
    case msg of
        LinkClicked link ->
            model !! ( [], [ getCmdForMsg AppMsg.SignOut ] )

        SignIn ->
            model !! ( [], [] )

        SignUp ->
            model !! ( [], [] )

        SignOut ->
            model !! ( [], [] )
