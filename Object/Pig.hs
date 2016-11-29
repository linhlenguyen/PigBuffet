module Object.Pig()
where
  import Graphics.Gloss

  data Action = Stand | RunLeft1 | RunLeft2 | RunRight1 | RunRight2 deriving (Show, Eq, Ord)

  data Pig = Pig {
    c_position :: Point,
    c_action :: Action,
    c_currentSprite :: Tag
  }

  renderCharacter :: SpriteResource -> Character -> Picture
  renderCharacter sr c = translate x y $ bmp
    where (x,y) = c_position c
          action = c_action c
          currentSprite = c_currentSprite c
          bmp = sr!currentSprite
