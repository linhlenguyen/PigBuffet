module Object.Pig(
newPig,
Pig(..)
)
where
  import Data.Data
  import qualified Graphics.Gloss.Interface.Pure.Game as Gloss
  import qualified Object.Object as Obj
  import Object.Controllable
  import Object.Renderable
  import Data.Map.Strict

  data Action = Stand | RunLeft1 | RunLeft2 | RunRight1 | RunRight2 deriving (Show, Eq, Ord)

  data Pig = Pig {
    pos :: Point,
    action :: Action,
    sprite :: SpriteTag,
    moveSpeed :: Float
  }

  instance Obj.Object Pig where
    pos p = pos p
    size p = (64,64)

  instance Renderable Pig where
    render sr p = Gloss.translate x y $ bmp
      where (x,y) = pos p
            bmp = sr!(show $ action p)

  instance Controllable Pig where
    handleEvent key p =
      case key of
        (Gloss.SpecialKey Gloss.KeyLeft) -> p { action = newActionL,
                                    pos = (x - (moveSpeed p),y)}
        (Gloss.SpecialKey Gloss.KeyRight) -> p { action = newActionR,
                                     pos = (x + (moveSpeed p),y)}
        _ -> p { action = Stand }
      where (x,y) = pos p
            currentAction = action p
            newActionL = if currentAction == RunLeft1 then RunLeft2 else RunLeft1
            newActionR = if currentAction == RunRight1 then RunRight2 else RunRight1
    noAction p = p { action = Stand }

  newPig :: Pig
  newPig = Pig {
    pos = (0,0),
    action = Stand,
    sprite = "",
    moveSpeed = 2.0
  }
