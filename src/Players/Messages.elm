module Players.Messages exposing (..)

import Http
import Players.Models exposing (PlayerId, Player)

type Msg
  = FetchAllDone (List Player)
  | ChangeLevel PlayerId Int
  | SaveSuccess Player
  | SaveFail Http.Error
  | FetchAllFail Http.Error
  | ShowPlayers
  | ShowPlayer PlayerId
  | NewPlayer
  | CreatePlayer Player
  | CreateSuccess Player
  | CreateFail Http.Error
