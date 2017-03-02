module SignInPage.Update exposing (..)

import Msg as AppMsg
import Types exposing (Context)
import Utilities exposing (getCmdForMsg, (!!))
import SignInPage.Model exposing (Model)
import SignInPage.Msg exposing (Msg(..))


init : Context -> Model
init context =
    Model
        ""
        ""
        ""
        ""
        False


update : Context -> Msg -> Model -> ( Model, Cmd Msg, Cmd AppMsg.Msg )
update context msg model =
    model !! ( [], [] )
