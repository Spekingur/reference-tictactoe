## Me on the project
I started out with everything on Windows, which was a mistake. I got sick the following week which stopped from keeping up with everything.
I've currently started everything locally from scratch three times now.

## URLs and access
1. Jenkins URL and username and password.
  * http://82.221.22.62:8080/
  * `kennari/CL4PTR4P`

2. Game URL (AWS)
  * Production server (always up):
  * 52.212.119.153

## Scripts

Outline what script files you created and the purpose of each file. Each file should be commented. This could be

- Build everything
  * https://github.com/Spekingur/reference-tictactoe/blob/master/buildall.sh
  * Builds everything in one go, both project and docker image. Uploads the result to dockerhub.

- Code build
  * https://github.com/Spekingur/reference-tictactoe/blob/master/build.sh
  * The dissection of the build script in package.json

- Project build
  * https://github.com/Spekingur/reference-tictactoe/blob/master/build-app.sh
  * Builds the project itself.

- Prepare docker build
  * https://github.com/Spekingur/reference-tictactoe/blob/master/docker-prepare.sh
  * It adds git info to files and copies directories needed for a docker build.

- Docker build
  * https://github.com/Spekingur/reference-tictactoe/blob/master/docker-build.sh
  * Creates a docker image and uploads to dockerhub.

- Docker compose
  * https://github.com/Spekingur/reference-tictactoe/blob/master/docker-compose.yml
  * Putting two containers into one for the purpose of deploying joined container to testing or production.

- Docker remove
  * https://github.com/Spekingur/reference-tictactoe/blob/master/.bin/docker-remove.sh
  * Removes all containers and images.

- AWS Provisioning
  * https://github.com/Spekingur/reference-tictactoe/tree/master/provisioning
  * Yes and no. I've made scripts but they are unused, untested and use docker-machine.

- Other scripts
  * https://github.com/Spekingur/reference-tictactoe/tree/master/.bin
  * I've put a bunch of scripts in here that are not really used (except for docker-remove.sh) but are there for ease of access.


## Testing & logic

Outline what tests you created.

- UnitTests, server logic TDD (Git commit log)

  * No.

- API Acceptance test - fluent API

  * No.

- Load test loop

  * No.

- UI TDD

  * No.

- Is the game playable?

  * No.



## Data migration

Did you create a data migration.

- Migration up and down

  * For the aggregate_id column I added this file: https://github.com/Spekingur/reference-tictactoe/blob/master/server/migrations/20161217195742-add-aggregate_id-column.js


## Jenkins

Do you have the following Jobs and what happens in each Job:

- Commit Stage

  * Yes. Commit stage builds app, creates a docker image and uploads it to dockerhub. It is missing unit testing. For now.

- Acceptance Stage

  * No.

- Capacity Stage

  * No.

- Other

  * Deployment stage. Deploys ready file by pulling it from dockerhub and setting it up on an always-running AWS server.


Did you use any of the following features in Jenkins?

- Schedule or commit hooks

  * I used commit hooks. I installed a service in Github called 'Jenkins (Github plugin)'.

- Pipeline
  * No. I have one but have not finished setting it up.

- Jenkins file
  * Yes. But not complete.

- Test reports
  * No.

- Other
  * No.


## Monitoring

Did you do any monitoring?

- URL to monitoring tool. Must be open or include username and pass.
  * No.


## Other

Anything else you did to improve you deployment pipeline of the project itself?
  * No.
