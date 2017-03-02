module HomePage.Update exposing (..)

import Msg as AppMsg
import Types exposing (Context)
import Utilities exposing ((!!))
import HomePage.Model exposing (Model)
import HomePage.Msg exposing (Msg(..))


init : Context -> Model
init context =
    Model "" ""


update : Context -> Msg -> Model -> ( Model, Cmd Msg, Cmd AppMsg.Msg )
update context msg model =
    model !! ( [], [] )
