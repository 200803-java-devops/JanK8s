pipeline {

    agent any

    stages {
        stage('Preparation') { // for display purposes
            agent{docker 'maven:3-alpine'}
            // Get some code from a GitHub repository
            
            // Get the Maven tool.
            // ** NOTE: This 'M3' Maven tool must be configured
            // **       in the global configuration.
            mvnHome = tool 'M3'
        }
        stage('Build') {
            // Run the maven build
        }
        stage('Results') {
            
        }
        stage('Build Image'){
    
        }
        stage('Push Image'){

        }
        stage('Deploy to K8S'){

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
