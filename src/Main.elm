module Main exposing (..)

import Browser exposing (sandbox)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String.Conversions exposing (fromList)



-- model


type alias Model =
    Int


initialModel : Model
initialModel =
    0



-- update


type Msg
    = AddCalories
    | Clear


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddCalories ->
            model + 1

        Clear ->
            initialModel



-- view


view : Model -> Html Msg
view model =
    div []
        [ div
            [ class "flex justify-around" ]
            [ h3 [ class "text-4xl" ] [ text ("Total Calories: " ++ String.fromInt model) ] ]
        , div
            [ class "flex justify-around"
            ]
            [ button
                [ class "bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
                , type_
                    "button"
                , onClick AddCalories
                ]
                [ text "Add" ]
            , button
                [ class "bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4 rounded inline-flex items-center"
                , type_ "button"
                , onClick Clear
                ]
                [ text "Clear" ]
            ]
        ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
