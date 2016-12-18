## Me on the project
I started out with everything on Windows, which was a mistake. I got sick the following week which stopped from keeping up with everything.
I've currently started everything locally from scratch three times now.

## URLs and access
1. Jenkins URL and username and password.

http://82.221.22.62:8080/ - kennari/CL4PTR4P

2. Game URL (AWS)

Production server (always up):


## Scripts

Outline what script files you created and the purpose of each file. Each file should be commented. This could be

- Build everything

https://github.com/Spekingur/reference-tictactoe/blob/master/buildall.sh

Builds everything in one go, both project and docker image. Uploads the result to dockerhub.

- Project build

Builds the project itself.

- Docker build

Creates a docker image but does not upload it to dockerhub.

- Docker compose

https://github.com/Spekingur/reference-tictactoe/blob/master/docker-compose.yml

Putting two containers into one for the purpose of deploying joined container to testing or production

- AWS Provisioning

- Other scripts

In  the /.bin/ folder I put in various scripts that I might or might not need. May include general install scripts. Some are no more than one line.


## Testing & logic

Outline what tests you created.

- UnitTests, server logic TDD (Git commit log)

- API Acceptance test - fluent API

- Load test loop

- UI TDD

- Is the game playable?



## Data migration

Did you create a data migration.

- Migration up and down



## Jenkins

Do you have the following Jobs and what happens in each Job:

- Commit Stage

- Acceptance Stage

- Capacity Stage

- Other



Did you use any of the following features in Jenkins?

- Schedule or commit hooks

- Pipeline

- Jenkins file

- Test reports

- Other



## Monitoring

Did you do any monitoring?

- URL to monitoring tool. Must be open or include username and pass.



## Other

Anything else you did to improve you deployment pipeline of the project itself?
