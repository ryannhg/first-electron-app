module Types exposing (..)

import Navigation exposing (Location)


type alias Name =
    { first : String
    , last : String
    }


type alias EmailAddress =
    String


type alias Password =
    String


type alias User =
    { name : Name
    , email : EmailAddress
    }


type alias Link =
    { label : String
    , url : String
    }


type Page
    = SignIn
    | Home


type alias Context =
    { user : Maybe User
    , location : Location
    }
