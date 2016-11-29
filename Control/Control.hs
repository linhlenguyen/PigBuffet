module Control.Control(
handleKey,
handleKeyPress,
resetKey,
keyHold
)
where
  import Graphics.Gloss.Interface.Pure.Game

  handleKey :: Key -> WorldState -> WorldState
  handleKey key ws =
    case key of
      (SpecialKey KeyLeft) -> ws { ws_player = player { c_action = MoveLeft,
                                                        c_position = (x - moveSpeed,y),
                                                        c_currentSprite = nextSprite MoveLeft currentSprite} }
      (SpecialKey KeyRight) -> ws { ws_player = player { c_action = MoveRight,
                                                         c_position = (x + moveSpeed,y),
                                                         c_currentSprite = nextSprite MoveRight currentSprite} }
      _ -> ws

    where player = ws_player ws
          currentSprite = c_currentSprite $ ws_player ws
          (x,y) = c_position $ ws_player ws

  handleKeyPress :: Event -> WorldState -> WorldState
  handleKeyPress (EventKey key Up _ _) ws = ws'
    where
      ws' = resetKey key ws
  handleKeyPress (EventKey key Down _ _) ws = ws'
    where
      keys = ws_keyPressed ws
      ws' = if any (\k -> k == key) keys then handleKey key ws else handleKey key $ ws { ws_keyPressed = key:keys }
  handleKeyPress _ ws = ws

  resetKey :: Key -> WorldState -> WorldState
  resetKey key ws = ws'
    where keys = ws_keyPressed ws
          player = ws_player ws
          ws' = ws { ws_keyPressed = filter (\k -> not (k == key)) keys,
                     ws_player = player {c_action = Stop} }

  keyHold :: WorldState -> WorldState
  keyHold ws = ws'
    where keys = ws_keyPressed ws
          ws' = foldr handleKey ws keys
