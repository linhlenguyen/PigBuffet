module Object.Object(
Object(..)
)
where
  class Object a where
    size :: a -> Size
    position :: a -> Point
