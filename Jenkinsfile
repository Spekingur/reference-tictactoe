#!groovy

node {
  stage('Commit') {
    checkout scm
  }
  stage('UnitTests') {
  // Performed on build server before building

  }
  stage('Build') {
  // Don't build unless UnitTests were successful

  }
  stage('DockerHubUpload') {
  // Don't upload to docker unless build was successful

  }
  stage('AcceptanceTests'){
  // Don't run unless everything previous was successful

  }
  stage('LoadTests') {
  // Run at the same time as deploying to Production, should not break pipeline if these fail

  }
  stage('Production') {

  }
}
