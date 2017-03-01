module Routes
    exposing
        ( getPageFromLocation
        )

import Navigation exposing (Location)
import UrlParser as Url exposing (top, s)
import Types exposing (Page(..))


getPageFromLocation : Location -> Page
getPageFromLocation location =
    case Url.parseHash route location of
        Just page ->
            page

        Nothing ->
            SignIn


route : Url.Parser (Page -> Page) Page
route =
    Url.oneOf
        [ Url.map SignIn top
        , Url.map Home (s "home")
        ]
