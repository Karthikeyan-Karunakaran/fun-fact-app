pipeline {
    agent {
        docker {
            image 'docker:latest'  // Use an image that has Docker CLI
            args '--privileged -v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    environment {
        IMAGE_NAME = "fun-fact-app"
        CONTAINER_NAME = "fun-fact-container"
    }

    stages {
        stage("Clone Repository") {
            steps {
                git branch: 'main', url: 'https://github.com/Karthikeyan-Karunakaran/fun-fact-app.git'
            }
        }

        stage("Build Docker Image") {
            steps {
                script {
                    def dockerImage = docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage("Run Docker Container") {
            steps {
                script {
                    def container = docker.image(IMAGE_NAME).run("-p 8090:8080 -d --name ${CONTAINER_NAME}")
                }
            }
        }

        stage("Cleanup") {
            steps {
                script {
                    docker.image(IMAGE_NAME).stop()
                    docker.image(IMAGE_NAME).remove()
                }
            }
        }
    }
}
