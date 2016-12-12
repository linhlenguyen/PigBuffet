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

  --Thought on animation.
  --To avoid snappy animation, possible solutions are (not mutually exclusive)
  --1.Define path of motion or each animation
  --Subdivide path into frames and render

  --2.Each key stroke triggers an animation
  --Animation shouldn't be interupt until it is complete.
  --Time interval should be short to ensure smooth control

  --3.Draw stop frames for every action (a lot of work!)
  --4.Each animation will have frames and path, loopable?
  --5.

  --triggerAnimation :: AnimationType ->

  data PAnimation = StepLeft | StepRight | None (deriving Show)

  pigResourceMap :: [(SpriteTag, FilePath)]
  pigResourceMap = [
    ("StandLeft","bmp/pig/standl.bmp"),
    ("StandRight","bmp/pig/standr.bmp"),
    ("RunLeft1","bmp/pig/rl1.bmp"),
    ("RunLeft2","bmp/pig/rl2.bmp"),
    ("RunRight1","bmp/pig/rr1.bmp"),
    ("RunRight2","bmp/pig/rr2.bmp")]

  data Pig = Pig {
    p_pos :: Point,
    p_size :: Size,
    p_sprite :: SpriteTag,
    p_moveSpeed :: Float,
    p_animationQueue :: [PAnimation]
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
        _ -> p { p_sprite = "StandLeft" }
      where (x,y) = p_pos p
            currentSprite = p_sprite p
            newSpriteL = if currentSprite == "RunLeft1" then "RunLeft2" else "RunLeft1"
            newSpriteR = if currentSprite == "RunRight1" then "RunRight2" else "RunRight1"
    noAction p = p { p_sprite = newSprite }
      where currentSprite = p_sprite p
            newSprite = case currentSprite of { "RunLeft1" -> "StandLeft";
                                                "RunLeft2" -> "StandLeft";
                                                "RunRight1" -> "StandRight";
                                                "RunRight2" -> "StandRight";
                                                _ -> "StandLeft"; }

  newPig :: Pig
  newPig = Pig {
    p_pos = (0,0),
    p_size = (64,64),
    p_sprite = "StandLeft",
    p_moveSpeed = 10.0,
    p_animationQueue = []
  }
