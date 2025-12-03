pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'summmrak/todo-app'
        DOCKER_TAG   = '1.0'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/sumrak667/todo-app.git', branch: 'master'
            }
        }

        stage('Build') {
            steps {
                bat 'mvn clean package'
            }
        }

        stage('Docker Build') {
            steps {
                bat "docker build -t %DOCKER_IMAGE%:%DOCKER_TAG% ."
            }
        }

        stage('Test') {
            steps {
                bat 'mvn test'
            }
        }

        stage('Push') {
            steps {
                // Используем Jenkins credentials через ID
                withCredentials([usernamePassword(
                    credentialsId: '705d8e32-8df2-4be1-9aac-96dbfa5ad670', 
                    usernameVariable: 'DOCKER_USERNAME', 
                    passwordVariable: 'DOCKER_PASSWORD'
                )]) {
                    // Логинимся через password-stdin, безопасно
                    bat 'echo %DOCKER_PASSWORD% | docker login -u %DOCKER_USERNAME% --password-stdin'
                    // Пушим образ
                    bat "docker push %DOCKER_IMAGE%:%DOCKER_TAG%"
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished'
        }
        success {
            echo 'Build and Push successful!'
        }
        failure {
            echo 'Something went wrong...'
        }
    }
}
