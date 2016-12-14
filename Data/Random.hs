module Data.Random(
getRandom
)
where
  import System.Random

  getRandom :: Int
  getRandom = getRandomX (0, 400) - 200

  getRandomX :: (Int,Int) -> Int
  getRandomX (x,y) = r
    where g = mkStdGen 77
          (r:rs) = randomRs (x,y) g
