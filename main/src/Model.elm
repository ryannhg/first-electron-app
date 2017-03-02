module Model exposing (..)

import Types exposing (Context)
import Navbar.Model as Navbar
import SignInPage.Model as SignInPage
import HomePage.Model as HomePage


type Page
    = SignIn SignInPage.Model
    | Home HomePage.Model


type alias Model =
    { context : Context
    , navbar : Navbar.Model
    , page : Page
    }
