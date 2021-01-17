pipeline {
  agent any
  stages {
  stage('Deploy Non-Prod') {
      when {
          branch 'development'
      }
      steps {
        script {
          sh build_dev.sh
        }
      }
    }
  stage('Deploy Prod') {
      when {
          branch 'master'
      }
      steps {
        script {
          sh build_prod.sh
        }
      }
    }
  }
}
