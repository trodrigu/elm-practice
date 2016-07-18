module View exposing (..)

import Html exposing (Html, div, text)
import Html.App
import Messages exposing (Msg(..))
import Models exposing (Model)
import Players.List
import Players.Edit
import Players.New
import Players.Models exposing (PlayerId, Player, new)
import Routing exposing (Route(..))

view : Model -> Html Msg
view model =
  div []
      [ page model ]

page : Model -> Html Msg
page model =
  case model.route of
    PlayersRoute ->
      Html.App.map PlayersMsg (Players.List.view model.players)

    PlayerRoute id ->
      playerEditPage model id

    NewPlayerRoute ->
      newPlayerPage

    NotFoundRoute ->
      notFoundView

playerEditPage : Model -> PlayerId -> Html Msg
playerEditPage model playerId =
  let 
      maybePlayer =
        model.players
          |> List.filter (\player -> player.id == playerId)
          |> List.head

  in
     case maybePlayer of
       Just player ->
         Html.App.map  PlayersMsg (Players.Edit.view player)

       Nothing ->
         notFoundView

newPlayerPage : Player -> Html Msg
newPlayerPage =
  --createNewPlayer new
  Html.App.map PlayersMsg ( Players.New.view new )

--createNewPlayer : Player -> Model -> Player
--createNewPlayer player model =
  --|> { id = lastCreatedPlayer.id + 1, name = "Dawg", level = 0 }

lastCreatedPlayer : Player -> Model -> Player
lastCreatedPlayer player model =
  List.sortBy .id model.players
  List.reverse
  List.head
  player

notFoundView : Html msg
notFoundView =
  div []
      [ text "Not found" ]
