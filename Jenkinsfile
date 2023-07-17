pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Venugopal1998/Terraform_VM.git']]])
            }
        }
        
        stage('Build and Publish Terraform Configuration') {
            steps {
                bat 'terraform init'
                bat 'terraform plan -out=tfplan'
                archiveArtifacts artifacts: 'tfplan', fingerprint: true
            }
        }
        
        stage('Create VM') {
            environment {
                GOOGLE_APPLICATION_CREDENTIALS = credentials('Terraform-vm')
            }
            
            steps {
                withCredentials([file(credentialsId: 'Terraform-vm', variable: 'GOOGLE_APPLICATION_CREDENTIALS')]) {
                    //bat 'gcloud auth activate-service-account --key-file=${GOOGLE_APPLICATION_CREDENTIALS}'
                    //bat 'gcloud config set project harbata-test-392010'
                    //bat 'gcloud config set compute/zone us-central1-a'
                    bat 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }
}
