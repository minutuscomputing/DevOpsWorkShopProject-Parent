pipeline {
    agent{label 'ws'}

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven 3.4"
    }

    stages {
        stage('Builds') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'arati_ws', url: 'https://github.com/minutuscomputing/DevOpsWorkShopProject-Parent.git'

                // Run Maven on a Unix agent.
                 sh "mvn -Dmaven.test.failure.ignore=true -D\${BUILD_TAG} clean test package deploy -l /tmp/\${BUILD_TAG}.log" 

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }

            post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
                success {
                    junit '**/target/surefire-reports/TEST-*.xml'
                    archiveArtifacts 'target/*.jar'
                }
            }
        }
    }
}
