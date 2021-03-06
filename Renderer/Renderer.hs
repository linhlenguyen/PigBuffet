module Renderer.Renderer(
renderGame
)
  where
    import Graphics.Gloss
    import Data.Data
    import Data.World
    import Data.Map.Strict
    import Object.Renderable
    import Object.Pig

    renderGame :: SpriteResource -> World -> Picture
    renderGame sr ws = pictures $ [
       sr!"bg",
       render sr (wpig ws)
       ] ++ Prelude.map (render sr) (wfood ws)
