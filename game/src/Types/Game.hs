module Types.Game (
  Checker,
  Cell,
  Board,
  Player,
  CurrentStep,
  GameState,
  initialState
) where

data Checker = White | Black
  deriving (Eq,Show,Read,Enum)


data Cell = Checker | Empty
  deriving (Eq,Show,Read,Enum)


data Board = Board [[Cell]] 
             deriving (Eq,Show,Read)


data Player = Player
  { checkersColor :: Checker,      
    checkersNumber :: Integer,     
    jumpedOver :: Integer 
  } deriving (Eq,Show,Read)


data CurrentStep = CurrentStep 
  { checker :: Checker, 
    x :: Integer,
    y :: Integer
  } deriving (Eq, Show, Read)


data GameState = GameState
  { board :: Board,
    players :: [Player],
    curstep :: CurrentStep
  } deriving (Eq, Show, Read)

n = 8

generateRow = Empty : generateRow 
generateLine = (take n $ generateRow) : generateLine
generateBoard = take n $ generateLine

initialState :: GameState
initialState = GameState 
    { board = Board (generateBoard), 
      players = [Player White 12 0, Player Black 12 0],
      curstep = CurrentStep White (-1) (-1)
    }