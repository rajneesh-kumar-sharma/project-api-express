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
        sh "whoami"
        sh "npm install"
      }
    }
    stage("Push to DockerHub"){
      steps{
        withCredentials([usernamePassword(credentialsId:"dockerHub",passwordVariable:"DOCKERHUB_PASSWORD",usernameVariable:"DOCKERHUB_USERNAME")]){
        sh "docker build -t ${env.DOCKERHUB_USERNAME}/project-api-express ."
        sh "docker login -u ${env.DOCKERHUB_USERNAME} -p ${env.DOCKERHUB_PASSWORD}"
        sh "docker tag project-api-express ${env.DOCKERHUB_USERNAME}/project-api-express:latest"
        sh "docker push ${env.DOCKERHUB_USERNAME}/project-api-express"
        }
      }
    }
    stage("Deploy"){
            steps{
                sh "docker compose down && docker compose up -d"

    }
  }
  }
  post {
    failure  {
      emailext( to: 'coolrajnish.sharma@gmail.com',
           subject: "Build Failed in Jenkins: ${currentBuild.fullDisplayName}",
           body: """Hello Team,

The build for job *${env.JOB_NAME}* failed.
Check console output: ${env.BUILD_URL}console

Regards,
Jenkins
"""
      )
  }
}
}