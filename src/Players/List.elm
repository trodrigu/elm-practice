module Players.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Players.Messages exposing (..)
import Players.Models exposing (Player)
import Html.Events exposing (onClick)

view : List Player -> Html Msg
view players =
  div []
      [ nav players
      , list players
      ]

nav : List Player -> Html Msg
nav model =
  div [ class "clearfix mb2 white bg-black" ]
      []

list : List Player -> Html Msg
list players =
  div [ class "p2" ]
  [ table []
    [ thead []
      [ tr []
        [ th [] [ text "Id" ]
        , th [] [ text "Name" ]
        , th [] [ text "Level" ]
        , th [] [ text "Actions" ]
        ]
      ]
        , tbody [] (List.map playerRow players)
    ]
    , newBtn
  ]

playerRow : Player -> Html Msg
playerRow player =
  tr []
    [ td [] [ text (toString player.id) ]
    , td [] [ text player.name ]
    , td [] [ text (toString player.level) ]
    , td []
        [ editBtn player ]
    ]

editBtn : Player -> Html.Html Msg
editBtn player =
  button
    [ class "btn regular"
    , onClick (ShowPlayer player.id) 
    ]
    [ i [ class "fa fa-pencil mr1" ] [], text "Edit" ]

newBtn : Html.Html Msg
newBtn =
  button
    [ class "btn regular"
    , onClick (NewPlayer)
    ]
    [ i [ class "fa fa-plus mr1" ] [], text "Add new player" ]
