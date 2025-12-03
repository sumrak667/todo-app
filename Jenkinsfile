pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                bat 'mvn clean package'
            }
        }

        stage('Docker Build') {
            steps {
                bat 'docker build -t tg/todo-app:1.0 .'
            }
        }

        stage('Test') {
            steps {
                bat 'mvn test'
            }
        }

        stage('Push') {
            steps {
                bat 'docker tag tg/todo-app:1.0 tg/todo-app:1.0'
                bat 'docker push tg/todo-app:1.0'
            }
        }
    }
}
