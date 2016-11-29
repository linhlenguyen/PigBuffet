module Renderer.Renderer(
renderCharacter,
renderGame,
nextSprite
)
  where
    import Graphics.Gloss
    import Data.Data
    import Data.Map.Strict

    renderGame :: SpriteResource -> WorldState -> Picture
    renderGame sr ws = pictures [
      --sr!Background,
      renderCharacter sr (ws_player ws)]
