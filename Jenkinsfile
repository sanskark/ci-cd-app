pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "sanskarkhunt/ci-cd-app"
        DOCKER_TAG   = "${BUILD_NUMBER}"
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
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {
                    sh '''
                    echo $PASS | docker login -u $USER --password-stdin
                    '''
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE:$DOCKER_TAG .'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push $DOCKER_IMAGE:$DOCKER_TAG'
            }
        }

        stage('Deploy to EC2') {
            steps {
                sh 'bash deploy.sh $DOCKER_IMAGE:$DOCKER_TAG'
            }
        }
    }

    post {
        always {
            sh 'docker logout || true'
        }
        success {
            echo "CI/CD pipeline completed successfully"
        }
        failure {
            echo "Pipeline failed"
        }
    }
}
