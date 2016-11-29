module Controllable()
where
  import Graphics.Gloss

  class (Object a) => Controllable a where
    handleEvent :: Key -> a -> a
    handleEvent k a = a
