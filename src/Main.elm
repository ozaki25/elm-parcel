module Main exposing (main)

import Browser
import Html exposing (Html, button, div, p, text)



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
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ button [] [ text "hello" ]
        , button [] [ text "world" ]
        , p [] [ text model ]
        ]


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none