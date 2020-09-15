pipeline {

    agent any

    stages {
        stage('Build') {
            // Run the maven build
            steps {
                echo 'building..'
            }
        }
        stage('Test') {
            steps {
                echo 'testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'deploying..'
            }
        }
    }
    post {
    //See Jenkinsfile in the project reppo instead, not needed here
       // only triggered when blue or green sign
       success {
           slackSend(color: '#BDFFC3', message: 'The build and Deployment is Successful')
       }
       // triggered when red sign
       failure {
           slackSend(color: '#FF0000', message: 'The Build and Deployment Failed, Please Check Console')
       }
       // trigger every-works
       always {
           emailext body: 'testing', recipientProviders: [developers(), culprits()], subject: 'testing'
           slackSend(color: '#D4DADF', message: 'Program is Running')
       }
    }
    
}
