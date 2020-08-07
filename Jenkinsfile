pipeline {
    agent any

    tools {
        dockerTool "docker"

    }

    stages {
        stage('VersioControl') {
            steps {
                git 'https://github.com/rohangireeshnair/rohan-hello-world-webapp.git'
            }
        }
        stage('DockerBuild') {
            steps {
                script {
                    withDockerRegistry(
                        credentialsId: '**my-cred**',toolName: 'docker') {
                        def helloWorldBuild = docker.build("rohangireeshnair/hello-world-app:latest");
                        credentialsId.push();
                    }
                }
            }
        }
    }
    post {
        success {
            echo "Success"
	    sh "curl -X POST <Incoming Webhook URL> -H 'Content-Type: application/json' -d '{"text": "Image Build Succeeded"}'"
        }
        failure {
            echo "Failed"
        }
    }
}
