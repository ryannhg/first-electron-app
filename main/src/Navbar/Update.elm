module Navbar.Update exposing (..)

import Msg as AppMsg
import Types exposing (Context, Link)
import Utilities exposing (getCmdForMsg, (!!))
import Navbar.Model exposing (Model)
import Navbar.Msg exposing (Msg(..))


init : Context -> Model
init context =
    Model
        [ Link "Home" "#/home"
        ]


update : Context -> Msg -> Model -> ( Model, Cmd Msg, Cmd AppMsg.Msg )
update context msg model =
    case msg of
        LinkClicked link ->
            model !! ( [], [] )

        SignIn ->
            model !! ( [], [ getCmdForMsg (AppMsg.SignIn "ryan.nhg@gmail.com" "password") ] )

        SignUp ->
            model !! ( [], [] )

        SignOut ->
            model !! ( [], [ getCmdForMsg AppMsg.SignOut ] )
