module Players.Edit exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, value, href)
import Players.Models exposing (..)
import Players.Messages exposing (..)
import Players.FormLevel exposing(formLevel)
import Html.Events exposing (onClick)

view : Player -> Html.Html Msg
view model =
  div []
      [ nav model
      , form model
      ]

nav : Player -> Html.Html Msg
nav model =
  div [ class "clearfix mb2 white bg-blank p1" ]
      [ listBtn ]

form : Player -> Html.Html Msg
form player =
  div [ class "m3" ]
      [ h1 [] [ text player.name ]
      , formLevel player
      ]



listBtn : Html Msg
listBtn =
  button
    [ class "btn regular"
    , onClick ShowPlayers
    ]
    [ i [ class "fa fa-chevron-left mr1" ] [], text "List" ]
