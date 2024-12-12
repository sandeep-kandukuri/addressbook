pipeline {
    agent none
    tools {
        jdk 'myjava'
        maven 'mymaven'
    }
    environment {
        BUILD_SERVER = 'ec2-user@172.16.0.22'
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
            agent {label 'linux_slave'}
            steps {
                script {
                    sshagent(['Slave2']) {
                    echo "UnitTesting the Job"
                    sh 'mvn test'
                    }
                }

                
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }

            
        }
        stage('Package') {
            sshagent(['Build']) {
            steps {
                script {
                    echo "Packaging the Jobs"
                    sh "scp -o StrictHostKeyChecking=no server-script.sh ${BUILD_SERVER}:/home/ec2-user"
                    sh "ssh -o StrictHostKeyChecking=no ${BUILD_SERVR} 'bash ~/server-script.sh'"
                
                }
                
            }

            
        }
    }
}
