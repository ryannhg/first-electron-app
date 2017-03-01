module Model exposing (..)

import Types exposing (Context)
import Navbar.Model as Navbar


type alias Model =
    { context : Context
    , navbar : Navbar.Model
    }
