module Navbar.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (Context, Link, User)
import Navbar.Model exposing (Model)
import Navbar.Msg exposing (Msg(..))


view : Context -> Model -> Html Msg
view context model =
    nav [ class "navbar" ]
        [ viewBrand context model
        , viewLeftLinks context model
        , viewRightLinks context model
        ]


viewBrand : Context -> Model -> Html Msg
viewBrand context model =
    h4 [ class "brand" ]
        [ a [ href "#/" ]
            [ text "Elmi" ]
        ]


viewLeftLinks : Context -> Model -> Html Msg
viewLeftLinks context model =
    div [ class "left links" ]
        (viewLinks model.links)


viewRightLinks : Context -> Model -> Html Msg
viewRightLinks context model =
    div [ class "right links" ]
        [ viewUserOptions context.user
        ]



-- TODO: Add active class based on context.page


viewLinks : List Link -> List (Html Msg)
viewLinks =
    List.map viewLink


viewLink : Link -> Html Msg
viewLink link =
    a [ href link.url ]
        [ text link.label ]


viewUserOptions : Maybe User -> Html Msg
viewUserOptions maybeUser =
    div [ class "user-links" ]
        [ case maybeUser of
            Just user ->
                viewSignOut user

            Nothing ->
                viewSignIn
        ]


viewSignOut : User -> Html Msg
viewSignOut user =
    a [ onClick SignOut ] [ text ("Sign out") ]


viewSignIn : Html Msg
viewSignIn =
    div []
        [ a [ onClick SignIn ] [ text "Sign in" ]
        , span [] [ text " / " ]
        , a [ onClick SignUp ] [ text "Sign up" ]
        ]
