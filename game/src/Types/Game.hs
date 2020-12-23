module Types.Game (
  Color,
  Role,
  Checker,
  Player,
  CurrentStep,
  GameState,
  initialState
) where

data Color = White | Black 
  deriving (Eq,Show,Read,Enum)

data Role = JustChecker | Queen
  deriving (Eq,Show,Read,Enum)

data Checker = Checker
  { role :: Role,
    x :: Integer,
    -- координата по горизонтали
    y :: Integer
    -- координата по вертикали
  }
    deriving (Eq, Show,Read)



data Player = Player
  { color :: Color,      
    checkersNumber :: Integer,     
    jumpedOver :: Integer 
  } deriving (Eq,Show,Read)


data CurrentStep = CurrentStep 
  { checker :: Checker, 
    x_step :: Integer,
    -- шаг по горизонтали (>0 направо, <0 налево)
    y_step :: Integer
    -- шаг по вертикали 
  } deriving (Eq, Show, Read)


data GameState = GameState
  { board :: [[Maybe Checker]],
    players :: [Player],
    curstep :: CurrentStep
  } deriving (Eq, Show, Read)

n = 8

generateRow = Nothing : generateRow 
generateLine = (take n $ generateRow) : generateLine
generateBoard = take n $ generateLine

initialState :: GameState
initialState = GameState 
    { board = generateBoard, 
      players = [Player White 12 0, Player Black 12 0],
      curstep = CurrentStep (Checker JustChecker 0 0) (-1) (-1)
    }