pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven 3.9.6"
    }

    stages {
        stage('Build Maven') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/karthick678/devops-jen-doc']])
                bat 'mvn clean install'
            }
        }
        stage('Build Docker image') {
            steps {
             bat 'docker build -t karthickkumar678/devops-jen-doc .'
            }
        }
        stage('push docker image to docker hub') {
            steps {
                withCredentials([string(credentialsId: 'mypwd', variable: 'myfpwd')]) {
                    bat "docker login -u karthickkumar678 -p ${myfpwd}"
                    bat 'docker push karthickkumar678/devops-jen-doc'
                }
            }
        }
    }
}
