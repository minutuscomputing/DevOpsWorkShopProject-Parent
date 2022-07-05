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
                // clone code from a GitHub repository
                git branch: 'Neelam_WS', url: 'https://github.com/minutuscomputing/DevOpsWorkShopProject-Parent.git'

                // Run Maven on a Unix agent.
                sh "mvn -Dmaven.test.failure.ignore=true clean test package"

             }
        }
        stage('Maven-Deploy') {
  	    agent
	    {
                label 'ws'
            }
	    steps 
	    {
	        sh 'mvn deploy'
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
     	       git branch: 'Neelam_tools', url: 'https://github.com/minutuscomputing/devops-workshop-tools.git', credentialsId: '8be4d11c-f243-450c-93d0-3e9d1c9abe29'
               sh 'ansible-playbook ./ansible/deploy_neelam.yml'               
            }         
        }

    }
}
