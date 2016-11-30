module Main(main)
  where
    import Graphics.Gloss.Interface.Pure.Game
    import GameSetup
    import Renderer.Renderer
    import Data.Data
    import Data.World
    import Renderer.Resources
    import qualified Data.Map.Lazy as Map
    import Control.Control

    update :: Float -> World -> World
    update _ = keyEvent

    main :: IO ()
    main = do
      resource <- loadResource
      let resourceMap = Map.fromList resource
      play window background fps initialState (renderGame resourceMap) handleKeyPress update
