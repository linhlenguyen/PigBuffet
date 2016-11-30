module Renderer.Resources(
loadResource
)
  where
    import qualified Graphics.Gloss.Data.Bitmap as Gloss
    import qualified Graphics.Gloss.Data.Picture as Gloss
    import Data.Data

    bmpTagMap :: [(SpriteTag, FilePath)]
    bmpTagMap = []

    loadResource :: IO [(SpriteTag, Gloss.Picture)]
    loadResource = loadResource' bmpTagMap

    loadResource' :: [(SpriteTag, FilePath)] -> IO [(SpriteTag, Gloss.Picture)]
    loadResource' [] = return []
    loadResource' ((s,p):xs) = do
      bmp <- Gloss.loadBMP p
      bmps <- loadResource' xs
      return ((s,bmp):bmps)
