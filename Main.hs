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
    import Object.Step
    import Logic.Geometry
    import Object.Pig
    import Object.Food

    stepGame :: World -> World
    stepGame w = w { wfood = wfood' } where wfood' = map step $ wfood w

    checkCollision :: World -> World
    checkCollision w = w { wfood = f' }
      where p = wpig w
            f = wfood w
            pRec = (p_pos p, p_size p)
            f' = filter (\x -> not $ recCollide pRec (f_pos x, f_size x)) f

    generateFood :: Float -> World -> World
    generateFood t w = w

    update :: Float -> World -> World
    update t = (keyEvent t).stepGame.(generateFood t)

    main :: IO ()
    main = do
      resource <- loadResource
      let resourceMap = Map.fromList resource
      play window background fps initialState (renderGame resourceMap) handleKeyPress update
