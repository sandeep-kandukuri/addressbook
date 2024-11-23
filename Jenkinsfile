pipeline {
    agent none
    tools {
        jdk 'myjava'
        maven 'mymaven'
    }
    stages {
        stage('Compile') {
            agent any
            steps {
                script {
                    echo "Compiling the Job"
                    sh 'mvn compile'
                }
                
            }

            
        }
        stage('UnitTEST') {
            agent any
            steps {
                script {
                    echo "UnitTesting the Job"
                    sh 'mvn test'
                }
                
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }

            
        }
        stage('Package') {
            agent {label 'linux_slave'}
            steps {
                script {
                    echo "Packaging the Job"
                    sh 'mvn package'
                }
                
            }

            
        }
    }
}
