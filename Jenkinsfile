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
        sh 'docker build -t $DOCKER_IMAGE:$DOCKER_IMAGE_TAG .'
      }
    }

    stage('Docker Image Push') {
      steps {
        script {
          docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_credentials') {
            docker.image("$DOCKER_IMAGE:$DOCKER_IMAGE_TAG").push()
            docker.image("$DOCKER_IMAGE:$DOCKER_IMAGE_TAG").push('latest')
          }
        }

      }
    }

  }
  environment {
    DOCKER_IMAGE = 'langrenn/cicd-pipeline-image'
    DOCKER_IMAGE_TAG = '$BUILD_NUMBER'
  }
}