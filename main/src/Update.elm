module Update exposing (..)

import Model exposing (Model)
import Msg exposing (Msg(..))
import Types
import Utilities exposing (getCmdForMsg)
import Navigation
import Routes exposing (getPage, getLocation)
import Navbar.Update as Navbar
import SignInPage.Update as SignInPage
import HomePage.Update as HomePage


-- INIT


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    let
        context =
            Types.Context
                Nothing
                location
    in
        Model
            context
            (Navbar.init context)
            (initPage context)
            ! []


initPage : Types.Context -> Model.Page
initPage context =
    case getPage context.location of
        Types.SignIn ->
            Model.SignIn (SignInPage.init context)

        Types.Home ->
            Model.Home (HomePage.init context)



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        context =
            model.context
    in
        case Debug.log "Message:" msg of
            UrlChange location ->
                let
                    newContext =
                        { context | location = location }
                in
                    { model
                        | context = newContext
                        , page = initPage newContext
                    }
                        ! []

            SignIn email password ->
                if email == "ryan.nhg@gmail.com" && password == "password" then
                    { model
                        | context =
                            { context
                                | user =
                                    Just
                                        (Types.User
                                            (Types.Name "Ryan" "Haskell-Glatz")
                                            email
                                        )
                            }
                    }
                        ! [ getCmdForMsg (UrlChange <| getLocation Types.Home context.location) ]
                else
                    model ! []

            SignUp user password ->
                if user.email /= "ryan.nhg@gmail.com" then
                    { model | context = { context | user = Just user } }
                        ! [ getCmdForMsg (UrlChange <| getLocation Types.Home context.location) ]
                else
                    model ! []

            SignOut ->
                let
                    newContext =
                        { context
                            | location = getLocation Types.SignIn context.location
                            , user = Nothing
                        }
                in
                    { model
                        | context = newContext
                        , page = initPage newContext
                    }
                        ! []

            NavbarMsg msg ->
                let
                    ( navbarModel, navbarCmd, appCmd ) =
                        Navbar.update model.context msg model.navbar
                in
                    { model | navbar = navbarModel }
                        ! [ Cmd.map NavbarMsg navbarCmd
                          , appCmd
                          ]

            SignInPageMsg msg ->
                let
                    pageModel =
                        case model.page of
                            Model.SignIn signInPageModel ->
                                signInPageModel

                            _ ->
                                Debug.log "SignInMsg: " (SignInPage.init model.context)

                    ( signInPageModel, pageCmd, appCmd ) =
                        SignInPage.update model.context msg pageModel
                in
                    { model | page = Model.SignIn signInPageModel }
                        ! [ Cmd.map SignInPageMsg pageCmd
                          , appCmd
                          ]

            HomePageMsg msg ->
                let
                    pageModel =
                        case model.page of
                            Model.Home signInPageModel ->
                                signInPageModel

                            _ ->
                                Debug.log "SignInMsg: " (HomePage.init model.context)

                    ( signInPageModel, pageCmd, appCmd ) =
                        HomePage.update model.context msg pageModel
                in
                    { model | page = Model.Home signInPageModel }
                        ! [ Cmd.map HomePageMsg pageCmd
                          , appCmd
                          ]
