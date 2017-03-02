module Routes exposing (getPage, getLocation)

import Navigation exposing (Location)
import UrlParser as Url exposing (top, s)
import Types exposing (Page(..))


getPage : Location -> Page
getPage location =
    case Url.parseHash route location of
        Just page ->
            page

        Nothing ->
            SignIn


getLocation : Page -> Location -> Location
getLocation page location =
    case page of
        SignIn ->
            { location | hash = "#/welcome" }

        Home ->
            { location | hash = "#/home" }


route : Url.Parser (Page -> Page) Page
route =
    Url.oneOf
        [ Url.map SignIn (s "welcome")
        , Url.map Home (s "home")
        ]
