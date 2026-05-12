pipeline {
    agent any

    environment {
        AWS_REGION     = 'us-east-1'
        AWS_ACCOUNT_ID = '156041401287'
        ECR_REPO       = 'ci-cd-app'
        IMAGE_TAG      = "${env.BUILD_NUMBER}"
        ECR_REGISTRY   = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com"
        FULL_IMAGE     = "${ECR_REGISTRY}/${ECR_REPO}:${IMAGE_TAG}"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master',
                    url: 'https://github.com/sanskark/ci-cd-app.git'
            }
        }

        stage('Docker login') {
            steps {
                sh '''
                    aws ecr get-login-password --region $AWS_REGION | \
                    docker login --username AWS --password-stdin $ECR_REGISTRY
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $FULL_IMAGE .'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh '''
                    docker push $FULL_IMAGE
                    docker tag $FULL_IMAGE $ECR_REGISTRY/$ECR_REPO:latest
                    docker push $ECR_REGISTRY/$ECR_REPO:latest
                '''
            }
        }

        stage('Deploy to EC2') {
            steps {
                sh 'bash deploy.sh $FULL_IMAGE'
            }
        }
    }

    post {
        always {
            sh 'docker rmi $FULL_IMAGE || true'
        }
        success {
            echo "Build & push successful: ${FULL_IMAGE}"
        }
        failure {
            echo "Pipeline failed"
        }
    }
}
