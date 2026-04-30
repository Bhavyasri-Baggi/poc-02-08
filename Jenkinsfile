pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Application') {
            steps {
                sh 'npm install'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonarqube-server') {
                    script {
                        def scannerHome = tool 'SonarScanner'
                        sh """
                        ${scannerHome}/bin/sonar-scanner \
                          -Dsonar.projectKey=poc-02-08 \
                          -Dsonar.sources=. \
                          -Dsonar.language=js
                        """
                    }
                }
            }
        }

        stage('Quality Gate') {
            steps {
                timeout(time: 2, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t poc02-08-app .'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                docker rm -f poc02-08 || true
                docker run -d -p 80:3000 --name poc02-08 poc02-08-app
                '''
            }
        }
    }
}
