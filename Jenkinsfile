pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = '705d8e32-8df2-4be1-9aac-96dbfa5ad670'
        IMAGE_NAME = 'summmrak/todo-app'
        IMAGE_TAG = '1.0'
    }
    stages {
        stage('Build') {
            steps {
                bat 'mvn clean package'
            }
        }
        stage('Docker Build') {
            steps {
                bat "docker build -t %IMAGE_NAME%:%IMAGE_TAG% ."
            }
        }
        stage('Test') {
            steps {
                bat 'mvn test'
            }
        }
        stage('Push') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKERHUB_CREDENTIALS) {
                        bat "docker login -u %DOCKERHUB_USERNAME% -p %DOCKERHUB_PASSWORD%"
                        bat "docker push %IMAGE_NAME%:%IMAGE_TAG%"
                    }
                }
            }
        }
    }
}
