module Data.Data(
SpriteTag,
SpriteResource,
Width,
Height,
Size,
Rectangle,
ViewPort,
Vector,
Point
)
  where
    import qualified Graphics.Gloss as Gloss
    import qualified Graphics.Gloss.Data.Picture as Gloss
    import qualified Graphics.Gloss.Data.Point as Gloss
    import qualified Data.Map.Lazy as Map

    type SpriteTag = String
    type SpriteResource = Map.Map SpriteTag Gloss.Picture

    type Width = Float
    type Height = Float
    type Size = (Width, Height)
    type Rectangle = (Gloss.Point, Size)
    type ViewPort = Rectangle
    type Vector = (Float,Float)
    type Point = Gloss.Point
