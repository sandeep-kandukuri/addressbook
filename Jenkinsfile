pipeline {
    agent none
    tools {
        jdk 'myjava'
        maven 'mymaven'
    }
    environment {
        TEST_SERVER = 'ec2-user@172.16.0.22'
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
                    sshagent(['Slave2']) {
                    echo "UnitTesting the Job"
                    sh "scp -o StrictHostKeyChecking=no server-script.sh ${TEST_SERVER}:/home/ec2-user"
                    sh "ssh -o StrictHostKeyChecking=no ${TEST_SERVER} 'bash ~/server-script.sh'"
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
            agent {label 'linux_slave'}
            steps {
                script {
                    echo "Packaging the Jobs"
                    sh 'mvn package'
                }
                
            }

            
        }
    }
}
