module Players.Models exposing (..)

type alias PlayerId =
  Int

type alias Player =
  { id : PlayerId
  , name : String
  , level : Int
  }

new : Player
new =
  { id = 0
  , name = "New Player"
  , level = 0
  }
