pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        TF_VERSION = '1.6.0'
    }


    stages {
        stage('Checkout Terraform Code') {
            steps {
                git branch: 'main',
                   
                    url: 'https://github.com/TRagavendhirakanna/jenkins-ragava.git'
            }
        }

        stage('Setup AWS Credentials') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'ffa866fe-b3b4-4988-98bd-e6cb578b0343']]) {
                    sh '''
                        export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
                        export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
                        export AWS_DEFAULT_REGION=${AWS_REGION}
                        echo "AWS Credentials Set"
                    '''
                }
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: "Do you want to apply Terraform changes?"
                sh 'terraform apply -auto-approve'
            }
        }
    }

    post {
        failure {
            echo 'Pipeline failed.'
        }
        success {
            echo 'Pipeline completed successfully.'
        }
    }
}
