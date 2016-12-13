module Control.Control(
handleKeyPress,
keyEvent
)
where
  import Graphics.Gloss.Interface.Pure.Game
  import Data.Data
  import Data.World
  import Object.Controllable

  handleKey :: Key -> World -> World
  handleKey key ws = ws { wpig = handleEvent key p
  } where p = wpig ws

  handleKeyPress :: Event -> World -> World
  handleKeyPress (EventKey key Up _ _) ws = ws'
    where
      ws' = resetKey key ws
  handleKeyPress (EventKey key Down _ _) ws = ws'
    where
      keys = wkeyPressed ws
      ws' = if any (\k -> k == key) keys then handleKey key ws else handleKey key $ ws { wkeyPressed = key:keys }
  handleKeyPress _ ws = ws

  resetKey :: Key -> World -> World
  resetKey key ws = ws'
    where keys = wkeyPressed ws
          ws' = ws { wkeyPressed = filter (\k -> not (k == key)) keys }

  keyEvent :: Float -> World -> World
  keyEvent t ws = ws'
    where keys = wkeyPressed ws
          p = wpig ws
          ct = wt ws
          wt' = if mod ct 5 == 0 then 0 else ct + 1
          ws' = if mod ct 5 == 0 then
                  if null keys then ws { wpig = noAction p, wt = wt' }
                  else foldr handleKey ws keys
                else ws { wt = wt'}
