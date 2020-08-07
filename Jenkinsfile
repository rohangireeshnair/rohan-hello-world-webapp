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
	    sh "curl -X POST https://api.flock.com/hooks/sendMessage/a63bec9c-5ef0-4be7-8d65-e195491f6058 -H 'Content-Type: application/json' -d '{"text": "Image Build Succeeded"}'"
        }
        failure {
            echo "Failed"
        }
    }
}
