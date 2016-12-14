module Animation(
Animation(..)
)
where
  import Data.Data
  import Graphics.Gloss

  data Animation = Animation {
    sprite :: SpriteTag,
    spriteSequence :: [SpriteTag]
  }

  class Animatable a where
    draw :: a -> (Picture,a)
