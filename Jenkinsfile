pipeline {
  agent any
  stages{
    stage("code"){
      steps{
        git url: "https://github.com/rajneesh-kumar-sharma/project-api-express.git", branch: "master"
      }
    }
    stage("Build"){
      steps{
        sh "npm install"
      }
    }
    
  }
}
