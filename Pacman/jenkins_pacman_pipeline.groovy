pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/masonicGIT/pacman.git'
    }

    tools {
        nodejs 'NodeJS-20.10' // The name specified in the Global Tool Configuration
    }

    stages {
        stage('Clone Git repo') {
            steps {
                checkout scm: [
                    $class: 'GitSCM',
                    branches: [[name: 'master']],
                    userRemoteConfigs: [[url: env.GIT_REPO]]
                ]
            }
        }

        stage('List files in pacman directory') {
            steps {
                sh '''
                ls -lah
                '''
            }
        }

        stage('Install dependencies') {
            steps {
                sh '''
                npm install next
                npm install
                '''
            }
        }

        stage('Build the app') {
            steps {
                sh '''
                npm run build
                '''
            }
        }

        stage('Launch the app with timeout') {
            steps {
                timeout(time: 5, unit: 'MINUTES') {
                    sh '''
                    npm run dev
                    '''
                }
            }
        }
    }
}
