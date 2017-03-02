module View exposing (..)

import Html exposing (..)
import Model exposing (Model, Page(..))
import Msg exposing (Msg(..))
import Types exposing (Context)
import Navbar.Model as Navbar
import Navbar.View
import SignInPage.View
import HomePage.View


view : Model -> Html Msg
view model =
    div []
        [ viewNavbar model.context model.navbar
        , viewPage model.context model.page
        ]


viewNavbar : Context -> Navbar.Model -> Html Msg
viewNavbar context navbar =
    Html.map NavbarMsg (Navbar.View.view context navbar)


viewPage : Context -> Page -> Html Msg
viewPage context page =
    case page of
        Model.SignIn signInModel ->
            Html.map SignInPageMsg (SignInPage.View.view context signInModel)

        Model.Home homePageModel ->
            Html.map HomePageMsg (HomePage.View.view context homePageModel)
