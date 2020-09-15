pipeline {

    agent none

    stage('Preparation') { // for display purposes
        agent{docker 'maven:3-alpine'}
        // Get some code from a GitHub repository
        //git 'https://github.com/jglick/simple-maven-project-with-tests.git'
        // Get the Maven tool.
        // ** NOTE: This 'M3' Maven tool must be configured
        // **       in the global configuration.
        mvnHome = tool 'M3'
    }
    stage('Build') {
        // Run the maven build
        agent { }
        withEnv(["MVN_HOME=$mvnHome"]) {
            if (isUnix()) {
                sh '"$MVN_HOME/bin/mvn" -Dmaven.test.failure.ignore clean package'
            } else {
                bat(/"%MVN_HOME%\bin\mvn" -Dmaven.test.failure.ignore clean package/)
            }
        }
    }
    stage('Results') {
        junit '**/target/surefire-reports/TEST-*.xml'
        archiveArtifacts 'target/*.jar'
    }
    stage('Build Image'){
        sh "docker build -t xxxxxx"
    }
    stage('Push Image'){

    }
    stage('Deploy to K8S'){

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
           slackSend(color: '#D4DADF', message: 'Program is Running')
           emailext body: '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS:\n\nCheck console output at $BUILD_URL to view the results.', recipientProviders: [developers(), culprits()], subject: '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!'
       }
    }
    
}
