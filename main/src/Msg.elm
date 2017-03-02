module Msg exposing (..)

import Navigation exposing (Location)
import Types exposing (User, EmailAddress, Password)
import Navbar.Msg as Navbar
import SignInPage.Msg as SignInPage
import HomePage.Msg as HomePage


type Msg
    = UrlChange Location
    | SignIn EmailAddress Password
    | SignUp User Password
    | SignOut
    | NavbarMsg Navbar.Msg
    | SignInPageMsg SignInPage.Msg
    | HomePageMsg HomePage.Msg
