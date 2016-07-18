module Players.Update exposing (..)

import Navigation
import Players.Messages exposing (Msg(..))
import Players.Models exposing (Player)
import Players.Commands exposing (save, create)
import Players.Models exposing (Player, PlayerId, new)

updatePlayer : Player -> List Player -> List Player
updatePlayer updatedPlayer = 
  let
      select existingPlayer =
        if existingPlayer.id == updatedPlayer.id then
           updatedPlayer
        else
          existingPlayer
  in
     List.map select

createPlayer : Player -> List Player -> List Player
createPlayer player players =
  player :: players

changeLevelCommands : PlayerId -> Int -> List Player -> List (Cmd Msg)
changeLevelCommands playerId howMuch =
  let
      cmdForPlayer existingPlayer =
        if existingPlayer.id == playerId then
          save { existingPlayer | level = existingPlayer.level + howMuch }
        else 
          Cmd.none
  in
     List.map cmdForPlayer

createPlayerCommands : Player -> Cmd Msg
createPlayerCommands =
  create

update : Msg -> List Player -> ( List Player, Cmd Msg )
update action players =
  case action of
    FetchAllDone newPlayers ->
      ( newPlayers, Cmd.none )

    FetchAllFail error ->
      ( players, Cmd.none )

    ShowPlayers ->
      ( players, Navigation.modifyUrl "#players" )

    ShowPlayer id ->
      ( players, Navigation.modifyUrl ( "#players/" ++ (toString id)) )

    ChangeLevel id howMuch ->
      ( players, changeLevelCommands id howMuch players |> Cmd.batch )

    SaveSuccess updatedPlayer ->
      ( updatePlayer updatedPlayer players, Cmd.none )

    SaveFail error ->
      ( players, Cmd.none )

    NewPlayer ->
      ( players, Navigation.modifyUrl ( "#new-player/" ) )

    CreatePlayer newPlayer ->
      ( createPlayer newPlayer players, Cmd.none )

    CreateSuccess createdPlayer ->
      ( createPlayer createdPlayer players, Cmd.none )

    CreateFail error ->
      ( players, Cmd.none )
