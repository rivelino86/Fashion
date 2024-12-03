pipeline{
    agent any
    stages{
        stage("Build image"){
            steps{
                script{
                echo '******* Death gonna be easy life is hard *******'
                sh 'docker build -t fashion-app:2.0.4 .'
                sh 'docker tag fashion-app:latest 655040006853.dkr.ecr.us-east-1.amazonaws.com/fashion-app:latest'
                sh 'docker tag fashion-app:2.0.4 655040006853.dkr.ecr.us-east-1.amazonaws.com/fashion-app:2.0.4'
               
            }
        }
        stage("push to ECR"){
            steps{
 withDockerRegistry(credentialsId: 'ecr:us-east-1:fashion_app', url: 'https://655040006853.dkr.ecr.us-east-1.amazonaws.com/') {
                 sh 'docker push 655040006853.dkr.ecr.us-east-1.amazonaws.com/fashion-app:latest'
                 sh 'docker push 655040006853.dkr.ecr.us-east-1.amazonaws.com/fashion-app:2.0.4'
        }
    }
  } 
 }
}
}