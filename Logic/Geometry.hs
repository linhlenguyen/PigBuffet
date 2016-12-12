module Logic.Geometry(
recContain,
recCollide
)
where
  import Data.Data

  recContain :: Rectangle -> Point -> Bool
  recContain ((x,y),(w,h)) (px,py) = (px >= rx0 && px <= rx1 && py >= ry0 && py <= ry1)
    where rx0 = x - w/2
          rx1 = x + w/2
          ry0 = y - h/2
          ry1 = y + h/2

  recPoints :: Rectangle -> [Point]
  recPoints ((x,y),(w,h)) = [(x - w/2, y - w/2), (x - w/2, y + w/2), (x + w/2, y - w/2), (x + w/2, y + w/2)]

  recCollide :: Rectangle -> Rectangle -> Bool
  recCollide r1 r2 = any (\x -> x == True) $ map (recContain r1) $ recPoints r2
