module Players.New exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, value, href)
import Players.Models exposing (..)
import Players.Messages exposing (..)
import Html.Events exposing (onSubmit, onClick, onInput)
import Players.FormLevel exposing(formLevel)

view : Player -> Html.Html Msg
view model =
  div []
      [ 
       newPlayerLevel model
       , newPlayerName model
      ]

newPlayerForm : Player -> Html.Html Msg
newPlayerForm player =
  form [ class "m3" 
       , onSubmit (CreatePlayer player)
       ] 
       [ 
         --newPlayerName player
       --, submitButton
       ]


newPlayerName : Player -> Html.Html Msg
newPlayerName player =
  div [ class "m3" ] 
  [ label [ class "m1" ] [ text ( "Player Id" ) ]
  , span [] [ text ( toString player.id ) ]
  , br [] []
  , label [ class "m1" ] [ text "New player name" ]
  , input [ value player.name ] []
  ]

newPlayerLevel : Player -> Html.Html Msg
newPlayerLevel player =
  div [ class "m3" ]
  [ formLevel player ]
  
formLevel : Player -> Html.Html Msg
formLevel player =
  div
    [ class "clearfix py1" ]
    [ div [ class "col col-7" ]
        [ span [ class "h2 bold" ] [ text (toString player.level) ]
        --, btnLevelDecrease player
        --, btnLevelIncrease player
        --]
        ]
    ]

btnLevelDecrease : Player -> Html.Html Player
btnLevelDecrease player =
  a [ class  "btn ml1 h1" ]
    [ i [ class "fa fa-plus-circle" ] [] ]

btnLevelIncrease : Player -> Html.Html Player
btnLevelIncrease player =
  a [ class  "btn ml1 h1" ]
    [ i [ class "fa fa-minus-circle" ] [] ]

updateLevel : Player -> Int -> Player
updateLevel player howMuch =
  { player | level = player.level + howMuch } 

submitButton : Html.Html Player
submitButton =
  button 
  [ class "m3" 
  ]
  [ text "Create" ]
