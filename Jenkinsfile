pipeline {
    agent{label 'ws'}

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven 3.4"
    }

    stages {
       stage('env'){
          steps{
	     sh 'printenv'
	     }
	     }

        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'Meghana_WS', url: 'https://github.com/minutuscomputing/DevOpsWorkShopProject-Parent.git'
                // Run Maven on a Unix agent.
                sh "mvn -Dmaven.test.failure.ignore=true clean package deploy"
                 //Clean package
                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package deploy "
            }
	}
	stage('Deploy') {	
	    steps {
                // Get some code from a GitHub repository
                  withCredentials([gitUsernamePassword(credentialsId: 'my-credentials-id', git branch: 'Meghana_tools', gitToolName:'https://github.com/minutuscomputing/devops-workshop-tools'')]) 
                // Run Maven on a Unix agent.
                sh "mvn -Dmaven.test.failure.ignore=true deploy"
                 //Clean package
                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package deploy "
            }
	}
	 stage('post') {
	     steps {
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
}
