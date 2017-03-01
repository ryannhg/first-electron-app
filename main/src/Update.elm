module Update exposing (..)

import Model exposing (Model)
import Msg exposing (Msg(..))
import Routes exposing (getPageFromLocation)
import Types exposing (Page(..))
import Navbar.Update as Navbar


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        context =
            model.context
    in
        case msg of
            UrlChange location ->
                { model
                    | context = { context | page = getPageFromLocation location }
                }
                    ! []

            SignOut ->
                { model
                    | context = { context | user = Nothing, page = SignIn }
                }
                    ! []

            NavbarMsg msg ->
                let
                    ( navbarModel, navbarCmd, appCmd ) =
                        Navbar.update model.context msg model.navbar
                in
                    { model
                        | navbar = navbarModel
                    }
                        ! []
