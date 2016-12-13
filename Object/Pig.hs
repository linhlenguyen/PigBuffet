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

  data PAnimation = StepLeft | StepRight | None deriving (Show)

  pigResourceMap :: [(SpriteTag, FilePath)]
  pigResourceMap = [
    ("pig", "bmp/pig/p.bmp")]

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
        (Gloss.SpecialKey Gloss.KeyLeft) -> p { p_sprite = "pig",
                                                p_pos = (x - (p_moveSpeed p),y)}
        (Gloss.SpecialKey Gloss.KeyRight) -> p { p_sprite = "pig",
                                                 p_pos = (x + (p_moveSpeed p),y)}
        _ -> p { p_sprite = "pig" }
      where (x,y) = p_pos p

  newPig :: Pig
  newPig = Pig {
    p_pos = (0,0),
    p_size = (164,164),
    p_sprite = "pig",
    p_moveSpeed = 164.0,
    p_animationQueue = []
  }
