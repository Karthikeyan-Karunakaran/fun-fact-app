pipeline {
    agent any

    environment {
        IMAGE_NAME = "fun-fact-app"
        CONTAINER_NAME = "fun-fact-container"
    }

    stages {
        stage("Clone Repository") {
            steps {
                sh "rm -rf fun-fact-app && git clone https://github.com/Karthikeyan-Karunakaran/fun-fact-app.git"
            }
        }

        stage("Build Docker Image") {
            steps {
                script {
                    def dockerImage = docker.build(IMAGE_NAME)
                }
            }
        }

        stage("Run Docker Container") {
            steps {
                script {
                    def container = docker.image(IMAGE_NAME).run("--name ${CONTAINER_NAME} -p 8090:8080 -d")
                }
            }
        }

        stage("Cleanup") {
            steps {
                sh "rm -rf fun-fact-app"
            }
        }
    }
}
