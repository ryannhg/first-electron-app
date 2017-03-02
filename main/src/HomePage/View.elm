module HomePage.View exposing (..)

import Html exposing (..)
import Types exposing (Context)
import HomePage.Model exposing (Model)
import HomePage.Msg exposing (Msg(..))


view : Context -> Model -> Html Msg
view context model =
    h1 [] [ text "Home" ]
