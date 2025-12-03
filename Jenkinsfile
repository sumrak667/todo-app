pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t tg/todo-app:1.0 .'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Push') {
            steps {
                sh 'docker tag tg/todo-app:1.0 tg/todo-app:1.0'
                // sh 'docker push tg/todo-app:1.0'
            }
        }
    }
}
