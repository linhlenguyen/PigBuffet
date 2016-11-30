module Object.Object(
Object(..)
)
where
  import Data.Data

  class Object a where
    size :: a -> Size
    pos :: a -> Point
