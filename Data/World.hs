module Data.World(
World(..),
initialState
)
where
  import Graphics.Gloss.Interface.Pure.Game
  import Object.Pig
  import Object.Food

  data World = World {
    wpig :: Pig,
    wfood :: [Food],
    wkeyPressed :: [Key],
    counter :: Int,
    wt :: Int
  }

  initialState :: World
  initialState = World {
    wpig = newPig,
    wfood = [newFood "" 100],
    wkeyPressed = [],
    counter = 0,
    wt = 0
  }
