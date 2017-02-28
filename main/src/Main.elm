module Main exposing (..)

import Html exposing (..)

type alias Model = 
    { title: String
    }

type Msg = NoOp


main =
  Html.beginnerProgram { model = model, view = view, update = update }

model : Model
model =
    Model "Elmi"

update : Msg -> Model -> Model
update msg model =
    model

view : Model -> Html Msg
view model =
    text model.title