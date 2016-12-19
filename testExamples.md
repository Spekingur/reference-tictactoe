##Possible unit tests based on event sourcing

###Form
```
Given [event(s)]
When [command]
Then [resulting event(s)]
```
###Scenarios
####Happy path - Success states
#####Game creation
```
Given []
When [GameCreate]
Then [GameCreated]
```
#####Game join
```
Given [GameCreated]
When [GameJoin]
Then [GameJoined]
```
#####Winning scenarios
######O Wins
######X Wins
#####Draw

####Sad path - Failure states
#####Game join
