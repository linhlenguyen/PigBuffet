module Logic.Geometry(
recContain
)
where
  import Data.Data
  import Graphics.Gloss

  recContain :: Rectangle -> Point -> Bool
  recContain ((x,y),(w,h)) (px,py) = if (px >= rx0 && px <= rx1 && py >= ry0 && py <= ry1)
    where rx0 = x - w/2
          rx1 = x + w/2
          ry0 = y - h/2
          ry1 = y + h/2
