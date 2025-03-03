pipeline {
  agent any
  stages {
    stage('Application Build') {
      steps {
        sh 'script scripts/build.sh'
      }
    }

    stage('Tests') {
      steps {
        sh 'script scripts/test.sh'
      }
    }

    stage('Docker Image Build') {
      steps {
        script {
          def dockerImageTag = "${env.BUILD_NUMBER}"
          sh """
          docker build -t ${DOCKER_IMAGE}:${dockerImageTag} .
          """
        }

      }
    }

    stage('Docker Image Push') {
      steps {
        script {
          docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_credentials') {
            docker.image("$DOCKER_IMAGE:11").push()

          }
        }

      }
    }

  }
  environment {
    DOCKER_IMAGE = 'langrenn/cicd-pipeline-image'
  }
}