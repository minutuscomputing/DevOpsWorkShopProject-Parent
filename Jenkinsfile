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
                git branch: 'arati_ws', url: 'https://github.com/minutuscomputing/DevOpsWorkShopProject-Parent.git'

                // Run Maven on a Unix agent.
                sh "mvn -Dmaven.test.failure.ignore=true -Djob_name=${JOB_NAME} -Dv=${BUILD_NUMBER} clean test package deploy"
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
     	       git branch: 'Arati_tools', url: 'https://github.com/minutuscomputing/devops-workshop-tools.git', credentialsId: 'a14eada6-39ac-4905-a061-267629059913'
	       sh 'ansible-galaxy install geerlingguy.java'   
	       sh "ansible-playbook ./ansible/test.yml"
            }         
        }

    }
}
