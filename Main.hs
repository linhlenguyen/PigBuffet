module Main(main)
  where
    import Graphics.Gloss.Interface.Pure.Game
    import Setup
    import Renderer.Renderer
    import Data.Data
    import Renderer.Resources
    import qualified Data.Map.Lazy as Map
    import Control.Control

    update :: Float -> WorldState -> WorldState
    update _ = keyHold

    main :: IO ()
    main = do
      resource <- loadResource
      let resourceMap = Map.fromList resource
      play window background fps initialState (renderGame resourceMap) handleKeyPress update
