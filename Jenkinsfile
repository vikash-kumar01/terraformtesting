pipeline{
    
    agent any 

    environment {

        ACCESS_KEY = credentials('AWS_ACCESS_KEY_ID')
        SECRET_KEY = credentials('AWS_SECRET_KEY_ID')
    }
    
    stages{
        
        stage('git checkout'){
            
            steps{

                git branch: 'main', url: 'https://github.com/vikash-kumar01/terraformtesting.git'
            }
        }
        stage('terraform init'){
            
            steps{

                sh 'terraform init'
            }
        }
        stage('terraform plan'){
            
            steps{

                sh """
                 terraform plan -var 'access_key=${ACCESS_KEY}' -var 'secret_key=${SECRET_KEY}' --var-file=./config/dev.tfvars
                """
            }
        }
    }
}