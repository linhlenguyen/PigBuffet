module Object.Renderable(
Renderable(..)
)
where
  import Graphics.Gloss
  import Data.Data
  import Object.Object
  import Logic.Geometry

  class (Object a) => Renderable a where
    render :: SpriteResource -> a -> Picture
    isVisible :: ViewPort -> a -> Bool
    isVisible v@((x,y),(w,h)) a = True
      -- if (px >= x) && (py >= y) then recContain v (c1x,c1y)
      --                             else if (px >= x) && (py <= y) then recContain v (c2x,c2y)
      --                             else if (px <= x) && (py >= y) then recContain v (c3x, c3y)
      --                             else if (px <= x) && (py <= y) then recContain v (c4x, c4y)
      --                             where (px,py) = pos a
      --                                   (sx,sy) = size a
      --                                   (c1x,c1y) = (px - sx/2, py - sy/2)
      --                                   (c2x,c2y) = (px - sx/2, py + sy/2)
      --                                   (c3x,c3y) = (px + sx/2, py - sy/2)
      --                                   (c4x,c4y) = (py + sx/2, py + sy/2)
