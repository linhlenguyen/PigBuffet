module Object.Food(
Food(..),
foodResourceMap,
newFood
)
where
  import qualified Graphics.Gloss as Gloss
  import Data.Data
  import Object.Object
  import Object.Renderable
  import Object.Step
  import Data.Map.Strict
  import Data.Random

  foodResourceMap :: [(SpriteTag, FilePath)]
  foodResourceMap = []
    -- [("Cake", "bmp/food/cake.bmp"),
    -- ("Carrot", "bmp/food/carrot.bmp")]

  data Food = Food {
    f_pos :: Point,
    f_size :: Size,
    f_mVector :: Vector,
    f_sprite :: SpriteTag
  }

  --Boilerplate
  instance Object Food where
    pos f = f_pos f
    size f = f_size f

  instance Renderable Food where
    render sr f = Gloss.translate x y $ bmp
      where (x,y) = f_pos f
            bmp = Gloss.circle 40 --sr!(f_sprite f)

  instance Step Food where
    step f = f { f_pos = (x',y') }
      where (x,y) = f_pos f
            (vx,vy) = f_mVector f
            (x',y') = (x + vx, y + vy)

  newFood :: SpriteTag -> Float -> Food
  newFood t x = Food {
    f_pos = (x, 400),
    f_size = (32,32),
    f_sprite = t,
    f_mVector = (0,-6.0)
  }
