pipeline {
    agent any

    tools {
        maven "default"
    }

    stages {
        stage('Clean & Compile') {
            agent any
		
	    steps
	    {
		echo "Build stage"
               
                git branch: 'main', url: 'https://github.com/minutuscomputing/sample-java-application.git', credentialsId:'github_meghana'

                sh "mvn -Dmaven.test.failure.ignore=true clean compile "
             }
        }

        stage('Test') {
            agent any
		
	    steps
	    {
		echo "test stage"
               
                git branch: 'main', url: 'https://github.com/minutuscomputing/sample-java-application.git', credentialsId:'github_meghana'

                sh "mvn -Dmaven.test.failure.ignore=true test"
             }
        }
        
        stage('Package') {
            agent any
		
	    steps
	    {
		echo "package stage"
               
                git branch: 'main', url: 'https://github.com/minutuscomputing/sample-java-application.git', credentialsId:'github_meghana'

                sh "mvn -Dmaven.test.failure.ignore=true package"
             }
        }

        stage('Install') {
            agent any
		
	    steps
	    {
		echo "install stage"
               
                git branch: 'main', url: 'https://github.com/minutuscomputing/sample-java-application.git', credentialsId:'github_meghana'

                sh "mvn -Dmaven.test.failure.ignore=true install"
             }
        }
       

        stage('Deploy') {
          agent any
	    steps 	   
	    {
	        sshagent(['tomcat']) {
	          sh "scp -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/deploy@2/target/studentapp-2.5-SNAPSHOT.war ec2-user@18.220.31.206:/opt/tomcat/webapps"
	        }
	    }
         }
    }
}
