module Navbar.Model exposing (..)


type alias Link =
    { label : String
    , url : String
    }


type alias Model =
    { links : List Link
    }
