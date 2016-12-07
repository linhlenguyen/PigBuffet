module Object.Step(
Moving(..)
)
where
  import Data.Data
  import Object.Object

  class Step a where
    step :: a -> a
    step a = a
