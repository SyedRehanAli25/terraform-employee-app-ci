@Library('terraform-shared-lib-ci@main') _

pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('AWS-secret-key')
        AWS_DEFAULT_REGION    = 'us-east-1'
        TF_ENV                = 'dev'   // or 'qa' depending on branch/environment
    }

    options {
        skipDefaultCheckout(true) // We'll do a custom checkout
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/SyedRehanAli25/terraform-employee-app-ci.git'
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    terraformInit(path: 'src/terraform/wrapper') // call the vars script
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                script {
                    terraformValidate(path: 'src/terraform/wrapper') // call the vars script
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    terraformPlan(path: 'src/terraform/wrapper', env: env.TF_ENV) // call the vars script
                }
            }
        }

        stage('Archive Plan') {
            steps {
                archiveArtifacts artifacts: '**/*.tfplan', allowEmptyArchive: true
            }
        }
    }

    post {
        success {
            echo "CI Pipeline completed successfully."
        }
        failure {
            echo "CI Pipeline failed. Check logs."
        }
    }
}
