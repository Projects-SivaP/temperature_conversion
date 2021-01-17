pipeline {
  agent any
  stages {
  stage('Deploy Non-Prod') {
      when {
          branch 'development'
      }
      steps {
        script {
          sh '''
          cd terraform/environments/non-prod
          terraform init
          terraform validate
          if [ $? -eq 0 ]
          then 
          { 
            terraform apply -auto-approve
          }
          else
          {
            echo "Check Terraform Configuration"
            exit 1
          }
          fi
          
          '''
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
