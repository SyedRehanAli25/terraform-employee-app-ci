// Jenkinsfile for Employee App CI Only
@Library('terraform-shared-lib-ci@main') _

pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        AWS_DEFAULT_REGION    = 'us-east-1'
        TF_ENV = 'dev' // CI usually targets dev
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                terraformInit(path: 'src/terraform/wrapper')
            }
        }

        stage('Terraform Validate') {
            steps {
                terraformValidate(path: 'src/terraform/wrapper')
            }
        }

        stage('Terraform Plan') {
            steps {
                terraformPlan(path: 'src/terraform/wrapper', env: env.TF_ENV)
            }
        }
    }

    post {
        success {
            echo "CI pipeline completed successfully ✅"
        }
        failure {
            echo "CI pipeline failed ❌"
        }
    }
}
