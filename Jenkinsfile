pipeline{
    agent any
    stages{
        stage("Build & push to ECR"){
            steps{
                echo '******* Death gonna be easy life is hard *******'
                sh 'docker build -t fashion-app .'
                sh 'docker tag fashion-app:classicfashion 655040006853.dkr.ecr.us-east-1.amazonaws.com/fashion-app:classicfashion'
                sh 'docker tag fashion-app:latest 655040006853.dkr.ecr.us-east-1.amazonaws.com/fashion-app:latest'
              //  sh 'docker push 655040006853.dkr.ecr.us-east-1.amazonaws.com/fashion-app:latest'
            }
        }
    }
}