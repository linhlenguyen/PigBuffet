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

  keyEvent :: World -> World
  keyEvent ws = ws'
    where keys = wkeyPressed ws
          p = wpig ws
          ws' = if null keys then ws { wpig = noAction p }
                else foldr handleKey ws keys
