module SignInPage.Msg exposing (Msg(..))

import Types exposing (EmailAddress, Password, Name)


type Msg
    = UpdateEmail String
    | UpdatePassword String
    | UpdateFirstName String
    | UpdateLastName String
    | SignIn EmailAddress Password
    | SignUp EmailAddress Password Name
