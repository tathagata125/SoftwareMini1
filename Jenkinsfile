pipeline {
	agent any




    environment {
		DOCKER_IMAGE_NAME = 'calculator2'
        DOCKER_HUB_REPO = 'tathagata125/calculator2'
        GITHUB_REPO_URL = 'https://github.com/tathagata125/SoftwareMini1.git'

    }

    stages {
		stage('Checkout') {
			steps {
				script {
					// Clone GitHub repo
                    git branch: 'main', url: "${GITHUB_REPO_URL}"
                }
            }
        }
		stage('Build and Test with Maven') {
			steps {
				sh 'mvn clean test'
            }
        }
        stage('Build Docker Image') {
			steps {
				script {
					// Build Docker image using Dockerfile

                      sh "docker build -t ${DOCKER_IMAGE_NAME} ."
                }
            }
        }

        stage('Push Docker Images') {
			steps {
				script{
					withCredentials([string(credentialsId: 'DockerHubCred', variable: 'DOCKER_HUB_PASSWORD')]) {
						sh "echo '${DOCKER_HUB_PASSWORD}' | docker login -u 'tathagata125' --password-stdin"
                    	sh 'docker tag calculator2 tathagata125/calculator2:latest'
                    	sh 'docker push tathagata125/calculator2:latest'
                    }
                 }
            }
        }
       stage('Run Ansible Playbook') {
			steps {
				script {



                        // Run the Ansible playbook
                        ansiblePlaybook(
                            playbook: 'deploy.yml',
                            inventory: 'inventory'
                        )

                }
            }
       }
       /*stage('Cleanup Docker Images') {
           steps {
               script {
                   // Remove the built image locally
                   sh "docker rmi -f ${DOCKER_IMAGE_NAME}"


               }
           }
       }*/

    }
       post {
			always {
				cleanWs()
			}
		}

}





