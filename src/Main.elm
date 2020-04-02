module Main exposing (main)

import Browser
import Html exposing (Html, button, div, p, text)
import Html.Events exposing (onClick)
import Http
import Json.Decode as JD

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
    = GetHelloWorld
    | GotHelloWorld (Result Http.Error String)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GetHelloWorld ->
            ( model, getHelloWorld )
        GotHelloWorld result ->
            case result of
                Ok content ->
                    ( content, Cmd.none )
                Err _ ->
                    ( "Error", Cmd.none )

getHelloWorld : Cmd Msg
getHelloWorld =
    Http.get
        { url = "https://api.github.com/gists/9251473d9af67cb8a9d6c1e87fa19a00"
        , expect = Http.expectJson GotHelloWorld gistDecoder
        }

gistDecoder : JD.Decoder String
gistDecoder =
    JD.at [ "files", "hello.txt", "content" ] JD.string


-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick GetHelloWorld ] [ text "gist hello" ]
        , p [] [ text model ]
        ]


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none