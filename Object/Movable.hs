module Object.Movable(
Movable(..)
)
where
  import Data.Data
  import Object.Object

  class Movable a where
    step :: a -> a
    step a = a
