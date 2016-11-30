module Object.Moving(
Moving(..)
)
where
  import Data.Data
  import Object.Object

  class Moving a where
    step :: a -> a
    step a = a
