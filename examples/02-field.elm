import Browser
import Html exposing (Html, Attribute, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

-- MAIN
main =
  Browser.sandbox { init = init, update = update, view = view }

-- MODEL
-- note: "double" increments, braces need to be indented
type alias Model = {
    content : String
  }

init : Model
init = { 
    content = ""
  }

-- UPDATE
type Msg
  = Change String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent -> {
        model | content = newContent
      }

-- VIEW
view : Model -> Html Msg
view model =
  div [] [
      input [
        placeholder "enter string to reverse"
        , value model.content
        , onInput Change
      ] []
      , div [] [ text (String.reverse model.content) ]
    ]