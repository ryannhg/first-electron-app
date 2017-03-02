module SignInPage.View exposing (..)

import Html exposing (..)
import Types exposing (Context)
import SignInPage.Model exposing (Model)
import SignInPage.Msg exposing (Msg(..))


view : Context -> Model -> Html Msg
view context model =
    h1 [] [ text "Sign in" ]
