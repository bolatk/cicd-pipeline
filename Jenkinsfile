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
          sh """
          docker build -t ${DOCKER_IMAGE}:${BUILD_VERSION} .
          """
        }

      }
    }

    stage('Docker Image Push') {
      steps {
        script {
          docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_credentials') {
            docker.image("$DOCKER_IMAGE:$BUILD_VERSION").push()
          }
        }

      }
    }

  }
  environment {
    DOCKER_IMAGE = 'langrenn/cicd-pipeline-image'
    BUILD_VERSION = '${BUILD_NUMBER}'
  }
}