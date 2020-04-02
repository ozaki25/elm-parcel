module Main exposing (main)

import Browser
import Html exposing (Html, button, div, p, text)
import Html.Events exposing (onClick)


-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    String


init : () -> ( Model, Cmd Msg )
init _ =
    ( "", Cmd.none )



-- UPDATE


type Msg
    = ChangeWord String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeWord word ->
            ( word, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick (ChangeWord "Hello") ] [ text "hello" ]
        , button [ onClick (ChangeWord "World") ] [ text "world" ]
        , p [] [ text model ]
        ]


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none