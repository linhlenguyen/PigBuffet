module Object.Pig(
pigResourceMap,
newPig,
Pig(..)
)
where
  import Data.Data
  import qualified Graphics.Gloss.Interface.Pure.Game as Gloss
  import Object.Object
  import Object.Controllable
  import Object.Renderable
  import Data.Map.Strict

  pigResourceMap :: [(SpriteTag, FilePath)]
  pigResourceMap = [
    ("Stand","bmp/pig/stand.bmp"),
    ("RunLeft1","bmp/pig/rl1.bmp"),
    ("RunLeft2","bmp/pig/rl2.bmp"),
    ("RunRight1","bmp/pig/rr1.bmp"),
    ("RunRight2","bmp/pig/rr2.bmp")]

  data Pig = Pig {
    p_pos :: Point,
    p_size :: Size,
    p_sprite :: SpriteTag,
    p_moveSpeed :: Float
  }

  --Boilerplate
  instance Object Pig where
    pos p = p_pos p
    size p = p_size p

  instance Renderable Pig where
    render sr p = Gloss.translate x y $ bmp
      where (x,y) = p_pos p
            bmp = sr!(p_sprite p)

  instance Controllable Pig where
    handleEvent key p =
      case key of
        (Gloss.SpecialKey Gloss.KeyLeft) -> p { p_sprite = newSpriteL,
                                                p_pos = (x - (p_moveSpeed p),y)}
        (Gloss.SpecialKey Gloss.KeyRight) -> p { p_sprite = newSpriteR,
                                                 p_pos = (x + (p_moveSpeed p),y)}
        _ -> p { p_sprite = "Stand" }
      where (x,y) = p_pos p
            currentSprite = p_sprite p
            newSpriteL = if currentSprite == "RunLeft1" then "RunLeft2" else "RunLeft1"
            newSpriteR = if currentSprite == "RunRight1" then "RunRight2" else "RunRight1"
    noAction p = p { p_sprite = "Stand" }

  newPig :: Pig
  newPig = Pig {
    p_pos = (0,0),
    p_size = (64,64),
    p_sprite = "Stand",
    p_moveSpeed = 2.0
  }
