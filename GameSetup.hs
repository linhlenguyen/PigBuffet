module GameSetup(
window,
background,
fps
)
  where
    import qualified Graphics.Gloss as Gloss
    import Data.Data

    window :: Gloss.Display
    window = Gloss.InWindow "Window" (720,480) (10,10)

    background :: Gloss.Color
    background = Gloss.white

    fps = 30::Int
    moveSpeed = 3::Float
