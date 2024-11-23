pipeline {
    agent any
    tools {
        jdk 'myjava'
        maven 'mymaven'
    }
    stages {
        stage('Compile') {
            
            steps {
                script {
                    echo "Compiling the Job"
                    sh 'mvn compile'
                }
                
            }

            
        }
        stage('UnitTEST') {
           
            steps {
                script {
                    echo "UnitTesting the Job"
                    sh 'mvn test'
                }
                
            }

            
        }
        stage('Package') {
           
            steps {
                script {
                    echo "Packaging the Job"
                    sh 'mvn package'
                }
                
            }

            
        }
    }
}
