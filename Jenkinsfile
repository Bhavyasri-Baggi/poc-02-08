pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build App') {
            steps {
                sh 'npm install'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t poc02-08-app .'
            }
        }

        stage('Deploy Container') {
            steps {
                sh '''
                docker stop poc02-08 || true
                docker rm poc02-08 || true
                docker run -d -p 3000:3000 --name poc02-08 poc02-08-app
                '''
            }
        }
    }
}

