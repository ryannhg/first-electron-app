module Utilities exposing (..)

import Task


getCmdForMsg : msg -> Cmd msg
getCmdForMsg msg =
    Task.perform identity (Task.succeed msg)


(!!) : model -> ( List (Cmd msgA), List (Cmd msgB) ) -> ( model, Cmd msgA, Cmd msgB )
(!!) model ( listA, listB ) =
    let
        ( modelA, cmdA ) =
            model ! listA

        ( _, cmdB ) =
            model ! listB
    in
        ( modelA, cmdA, cmdB )
