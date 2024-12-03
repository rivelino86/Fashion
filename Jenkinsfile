pipeline {
    agent any
    environment{
        SONAR_SCANNER = tool 'Sonar'
    }
    stages {
        stage("Sonar scanner"){
            steps{
                script{
                
                  withSonarQubeEnv(credentialsId: 'Sonar_cred') {
                   echo '*********echo ${SONAR_SCANNER}********'
                  sh '${SONAR_SCANNER}/bin/sonar-scanner'
                  sh '-Dsonar.projectKey=fashion_app'
                  sh '-Dsonar.sources= .'
                  sh '-Dsonar.java.binaries=.'
               }
            }
         }
     }
        stage("scan file by trivy"){
            steps{
                  sh "trivy fs --format table -o fashionapp-scan-report.html ."
            }
        }
        stage("Trivy scan the docker image"){
            steps{
                 echo "Scanning Docker image with Trivy"
                sh "trivy image --severity HIGH,CRITICAL fashion-app:2.0.4"
 
            }
        }
        stage("Build image") {
            steps {
                script {
                    echo '******* Death gonna be easy life is hard *******'
                    sh 'docker build -t fashion-app:2.0.4 .'
                    sh 'docker tag fashion-app:latest 655040006853.dkr.ecr.us-east-1.amazonaws.com/fashion-app:latest'
                    sh 'docker tag fashion-app:2.0.4 655040006853.dkr.ecr.us-east-1.amazonaws.com/fashion-app:2.0.4'
                }
            }
        }
        stage("Push to ECR") {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'ecr:us-east-1:fashion_app', url: 'https://655040006853.dkr.ecr.us-east-1.amazonaws.com/') {
                        sh 'docker push 655040006853.dkr.ecr.us-east-1.amazonaws.com/fashion-app:latest'
                        sh 'docker push 655040006853.dkr.ecr.us-east-1.amazonaws.com/fashion-app:2.0.4'
                    }
                }
            }
        }
    }
}
