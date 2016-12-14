module Control.Control(
handleKeyPress,
keyEvent
)
where
  import Graphics.Gloss.Interface.Pure.Game
  import Data.Data
  import Data.World
  import Object.Controllable

  handleKey :: Float -> Key -> World -> World
  handleKey t key ws = ws { wpig = handleEvent t key p
  } where p = wpig ws

  handleKeyPress :: Event -> World -> World
  handleKeyPress (EventKey key Up _ _) ws = ws'
    where
      ws' = resetKey key ws
  handleKeyPress (EventKey key Down _ _) ws = ws'
    where
      keys = wkeyPressed ws
      ws' = if any (\k -> k == key) keys then ws else ws { wkeyPressed = key:keys }
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
          ws' = if null keys then ws { wpig = noAction p }
                else foldr (handleKey t) ws keys
