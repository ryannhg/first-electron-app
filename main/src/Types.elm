module Types exposing (..)


type alias Name =
    { first : String
    , last : String
    }


type alias EmailAddress =
    String


type alias User =
    { name : Name
    , email : EmailAddress
    }


type Page
    = SignIn
    | Home


type alias Context =
    { user : Maybe User
    , page : Page
    }
