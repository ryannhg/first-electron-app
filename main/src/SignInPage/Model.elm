module SignInPage.Model exposing (..)

import Types exposing (EmailAddress, Password)


type alias Model =
    { email : EmailAddress
    , password : Password
    , firstName : String
    , lastName : String
    , signingUp : Bool
    }
