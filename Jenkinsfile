pipeline {
    agent none
    tools {
        jdk 'myjava'
        maven 'mymaven'
    }
    environment {
        BUILD_SERVER = 'ec2-user@10.0.0.75'
        IMAGE_NAME = 'sandeep888/repo1:$BUILD_NUMBER'
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
        stage('Package+Bulid the docker image and push to dockerhub') {
            agent any
            steps {
                script {
                    sshagent(['Build']) {
                        withCredentials([usernamePassword(credentialsId: 'dockerlogin', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
                            echo "Packaging the Jobs"
                            sh "scp -o StrictHostKeyChecking=no server-script.sh ${BUILD_SERVER}:/home/ec2-user"
                            sh "ssh -o StrictHostKeyChecking=no ${BUILD_SERVR} 'bash ~/server-script.sh'"
                            sh "ssh ${BUILD_SERVR} sudo docker build -t ${IMAGE_NAME} /home/ec2-user/addressbook"
                            sh "ssh ${BUILD_SERVR} sudo docker login -u $USERNAME -p $PASSWORD"
                            sh "ssh ${BUILD_SERVR} sudo docker push ${IMAGE_NAME}"
                        }
                    }
                
                }
                
            }

            
        }
    }
}
