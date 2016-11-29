module Data(
SpriteResource
)
  where
    import qualified Graphics.Gloss.Data.Picture as Gloss
    import qualified Graphics.Gloss.Data.Point as Gloss
    import qualified Data.Map.Lazy as Map

    type Tag = String
    type SpriteResource = Map.Map Tag Gloss.Picture

    type Width = Float
    type Height = Float
    type Size = (Width, Height)
    type Rectangle = (Gloss.Point, Size)
    type ViewPort = Rectangle
    type Vector = (Float,Float)
