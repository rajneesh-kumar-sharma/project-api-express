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
    stage("Push to DockerHub"){
      steps{
        sh "docker build -t coolrajnish/project-api-express ."
        sh "echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin"
        sh "docker push coolrajnish/project-api-express"
      }
    }
    stage("Deploy"){
      steps{              
        sh "docker run -d -p 3000:3000 coolrajnish/project-api-express"
      }

    }
  }
}
