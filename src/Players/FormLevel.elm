module Players.FormLevel exposing(..)
import Html exposing (..)
import Html.Attributes exposing (class, value, href)
import Html.Events exposing (onClick)
import Players.Models exposing (..)
import Players.Messages exposing (..)

formLevel : Player -> Html.Html Msg
formLevel player =
  div
    [ class "clearfix py1" ]
    [ div [ class "col col-5" ] [ text "Level" ]
    , div [ class "col col-7" ]
        [ span [ class "h2 bold" ] [ text (toString player.level) ]
        , btnLevelDecrease player
        , btnLevelIncrease player
        ]
    ]

btnLevelDecrease : Player -> Html.Html Msg
btnLevelDecrease player =
  a [ class  "btn ml1 h1" ]
    [ i [ class "fa fa-plus-circle", onClick (ChangeLevel player.id 1) ] [] ]

btnLevelIncrease : Player -> Html.Html Msg
btnLevelIncrease player =
  a [ class  "btn ml1 h1" ]
    [ i [ class "fa fa-minus-circle",  onClick (ChangeLevel player.id -1) ] [] ]
