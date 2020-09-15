pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven3"
    }

    stages {
        stage('Build') {
            steps {
                echo 'building'
            }
        }
    }
    post {
        always {
            emailext body: 'test body', recipientProviders: [recipientList()], subject: 'test subject'
        }
    }
}
