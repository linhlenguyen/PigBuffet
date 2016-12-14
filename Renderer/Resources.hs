module Renderer.Resources(
loadResource
)
  where
    import qualified Graphics.Gloss.Data.Bitmap as Gloss
    import qualified Graphics.Gloss.Data.Picture as Gloss
    import Data.Data
    import qualified Object.Pig as Pig
    import qualified Object.Food as Food
    import qualified Object.Number as Number

    bmpTagMap :: [(SpriteTag, FilePath)]
    bmpTagMap = Number.numberResourceMap ++ Pig.pigResourceMap ++ Food.foodResourceMap ++ [("bg", "bmp/bg2.bmp")]

    loadResource :: IO [(SpriteTag, Gloss.Picture)]
    loadResource = loadResource' bmpTagMap

    loadResource' :: [(SpriteTag, FilePath)] -> IO [(SpriteTag, Gloss.Picture)]
    loadResource' [] = return []
    loadResource' ((s,p):xs) = do
      bmp <- Gloss.loadBMP p
      bmps <- loadResource' xs
      return ((s,bmp):bmps)
