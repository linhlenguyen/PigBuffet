module Data.World()
where
  import qualified Graphics.Gloss.Interface.Pure.Game as Gloss
  import Object.Pig

  data World = World {
    wcontrollable :: [a],
    wbackground :: [b]
    wkeyPressed :: [Gloss.Key]
  }
