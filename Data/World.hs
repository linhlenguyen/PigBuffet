module Data.World(
World(..),
initialState
)
where
  import Graphics.Gloss.Interface.Pure.Game
  import Object.Pig

  data World = World {
    wpig :: Pig,
    wkeyPressed :: [Key]
  }

  initialState :: World
  initialState = World {
    wpig = newPig,
    wkeyPressed = []
  }
