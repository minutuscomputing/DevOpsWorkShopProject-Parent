pipeline {
    agent none

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven 3.4"
    }

    stages {
        stage('Build') {
            agent 
	    {
                label 'ws'
            }
	    steps
	    {
		echo "Build stage"
                // clone code from a GitHub repository
                git branch: 'Meghana_WS', url: 'https://github.com/minutuscomputing/DevOpsWorkShopProject-Parent.git'

                // Run Maven on a Unix agent.
                sh "mvn -Dmaven.test.failure.ignore=true deploy"

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
    }
        stage('Server-Deploy') {
            agent
	    {
               label 'ansible'
            }
	    steps 	   
	    {
	       echo "server deploy stage"
     	       git branch: 'Meghana_tools', url: 'https://github.com/minutuscomputing/devops-workshop-tools.git', credentialsId: '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'
	       sh 'ansible-galaxy install geerlingguy.java'
               sh 'ansible-playbook ./playbooks/deploy.yml'               
            }         
        }

}
