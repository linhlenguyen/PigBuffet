module Object.Controllable(
Controllable(..)
)
where
  import Graphics.Gloss.Interface.Pure.Game

  class Controllable a where
    handleEvent :: Key -> a -> a
    handleEvent k a = a
    noAction :: a -> a
    noAction a = a
