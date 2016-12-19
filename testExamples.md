##Possible unit tests based on event sourcing

###Form
```
should emit xxxxxxxxxx
Given [event(s)]
When [command]
Then [resulting event(s)]
```
###Scenarios
####Happy path - Success states
#####Game creation
```
should emit GameCreated event
Given []
When [GameCreate(Player 1)]
Then [GameCreated(Player 1)]
```
#####Game join
```
should emit GameJoined event
Given [GameCreated(Player 1)]
When [GameJoin(Player 2)]
Then [GameJoined(Player 2)]
```
#####Moves
```
should emit MovePlaced event
Given [GameCreated(Player 1), GameJoined(Player 2)]
When [PlaceMove(1,1,X)]
Then [MovePlaced(1,1,X)]
```
#####O Wins
```
should emit GameWon event
Given [GameCreated(Player 1), MovePlaced(1,1,X), MovePlaced(1,2,O), MovePlaced(0,0,X), MovePlaced(2,2,O), MovePlaced(2,0,X)]
When [PlaceMove(0,2,O)]
Then [GameWon(Player 2)]
```
#####X Wins
```
should emit GameWon event
Given [GameCreated(Player 1), MovePlaced(1,1,X), MovePlaced(2,2,O), MovePlaced(0,1,X), MovePlaced(0,2,O)]
When [PlaceMove(2,1,X)]
Then [GameWon(Player 1)]
```
#####Last move win (only Player 1 can win on last move)
```
should emit GameWon event
Given [GameCreated(Player 1), MovePlaced(2,0,X), MovePlaced(2,2,O), MovePlaced(1,1,X), MovePlaced(0,2,O), MovePlaced(1,2,X), MovePlaced(1,0,O), MovePlaced(0,1,X), MovePlace(0,0,O)]
When [PlaceMove(1,2,X)]
Then [GameWon(Player 1)]
```
#####Horizontal win
```
should emit GameWon event
Given  [GameCreated(Player 1), MovePlaced(0,0,X), MovePlaced(1,1,O), MovePlaced(2,2,X), MovePlaced(1,2,O), MovePlaced(2,1,X)]
When [PlaceMove(0,0,)]
Then [GameWon]
```
#####Vertical win
```
should emit GameWon event
Given  [GameCreated(Player 1), MovePlaced(1,1,X), MovePlaced(0,2,O), MovePlaced(0,1,X), MovePlaced(0,0,O)]
When [PlaceMove(2,1,X)]
Then [GameWon]
```
#####Diagonal win
```
should emit GameWon event
Given [GameCreated(Player 1), MovePlaced(2,2,X), MovePlaced(2,0,O), MovePlaced(1,1,X), MovePlaced(1,0,O)]
When [PlaceMove(0,0,X)]
Then [GameWon]
```
#####Draw
```
should emit GameDraw event
Given [GameCreated(Player 1), MovePlaced(1,1,X), MovePlaced(2,2,O), MovePlaced(0,1,X), MovePlaced(2,1,O), MovePlaced(2,0,X), MovePlaced(0,2,O), MovePlaced(1,2,X), MovePlace(1,0,O)]
When [PlaceMove(0,0,X)]
Then [GameDraw]
```

####Sad path - Failure states
#####Game creation when a game already exists
```
should emit GameAlreadyExists event
Given [GameCreated(Player 1)]
When [GameCreate(Player 1)]
Then [GameAlreadyExists]
```
#####Game join when game is full
```
should emit FullGameJoinAttempted event
Given [GameCreated(Player 1), GameJoined(Player 2)]
When [GameJoin(Player 3)]
Then [FullGameJoinAttempted]
```
#####Game join when player is already in the game
```
should emit AlreadyInGame event
Given [GameJoined(Player 2)]
When [GameJoin(Player 2)]
Then [AlreadyInGame]
```
#####Illegal move when square is already occupied
```
should emit IllegalMove event
Given [MovePlaced(1,1,X)]
When [PlaceMove(1,1,O)]
Then [IllegalMove(Player 2)]
```
#####Move when it is not your turn
```
should emit NotYourMove event
Given [MovePlaced(1,1,X)]
When [PlaceMove(1,0,X)]
Then [NotYourMove(Player 1)]
```
#####Illegal move when trying to place a move after a win
```
should emit GameIsOver event
Given [GameWon]
When [PlaceMove(2,2,X)]
Then [GameIsOver]
```
#####Illegal move when trying to place a move after a draw (should probably throw an IllegalMove event because all squares are full)
```
should emit GameIsOver event
Given [GameDraw]
When [PlaceMove(2,2,X)]
Then [GameIsOver]
```
