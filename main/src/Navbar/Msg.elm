module Navbar.Msg exposing (..)

import Types exposing (Link)


type Msg
    = LinkClicked Link
    | SignIn
    | SignUp
    | SignOut
