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
        sh 'docker build -t $DOCKER_IMAGE .'
      }
    }

    stage('Docker Image Push') {
      steps {
        script {
          docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_credentials') {
            docker.image("$DOCKER_IMAGE:${env.BUILD_NUMBER}").push()
            docker.image("$DOCKER_IMAGE:latest").push('latest')
          }
        }

      }
    }

  }
  environment {
    DOCKER_IMAGE = 'langrenn/cicd-pipeline-image'
  }
}