pipeline {
    agent none

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven 3.4"
    }

    stages {
        stage('Build and deploy') {
            agent 
	    {
                label 'ws'
            }
	    steps
	    {
		echo "Build and deploy stage"
                // clone code from a GitHub repository
                git branch: 'Meghana_WS', url: 'https://github.com/minutuscomputing/DevOpsWorkShopProject-Parent.git', credentialsId: '82e7f438-ce2b-4d58-b63d-7db7d51ae55d'

                // Run Maven on a Unix agent.
                sh "mvn -Dmaven.test.failure.ignore=true clean test package deploy"
                //sh "mvn deploy"
             }
	     post
	     {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
                success {
                    junit '**/target/surefire-reports/TEST-*.xml'
                    archiveArtifacts 'target/*.jar'
                }
              }
        }

        stage('Server-Deploy') {
            agent
	    {
               label 'ansible'
            }
	    steps 	   
	    {
	       echo "server deploy stage"
     	       git branch: 'Neelam_tools', url: 'https://github.com/minutuscomputing/devops-workshop-tools.git', credentialsId: '82e7f438-ce2b-4d58-b63d-7db7d51ae55d'
               sh 'ansible-playbook ./playbooks/deploy.yml'               
            }         
        }

    }
}
