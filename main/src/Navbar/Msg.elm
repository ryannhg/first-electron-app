module Navbar.Msg exposing (..)

import Navbar.Model exposing (Link)


type Msg
    = LinkClicked Link
    | SignIn
    | SignUp
    | SignOut
