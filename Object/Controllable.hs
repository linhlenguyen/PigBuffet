module Object.Controllable(
Controllable(..)
)
where
  import Graphics.Gloss.Interface.Pure.Game

  class Controllable a where
    handleEvent :: Float -> Key -> a -> a
    handleEvent t k a = a
    noAction :: a -> a
    noAction a = a
