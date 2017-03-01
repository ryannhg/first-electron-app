module Msg exposing (..)

import Navigation exposing (Location)
import Navbar.Msg as Navbar


type Msg
    = UrlChange Location
    | SignOut
    | NavbarMsg Navbar.Msg
