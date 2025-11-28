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
    stage("Deploy"){
      steps{        
        sh "docker build -t project-api-express ."
        sh "docker run -d -p 3000:3000 project-api-express"
      }

    }
  }
}
