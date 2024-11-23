pipeline {
    agent any
    parameters {
        string(name:'ENV',defaultValue:'Test',description:'version to deploy')
        booleanParam(name:'executeTests',defaultValue:true,description:'decide to rum tc')
        choice(name:'APPVERSION',choices:['1.1','1.2','1.3'])

    }
    environment {
        NEW_Version = '2.1'
    }

    stages {
        stage('Build') {
            input {
                message "select the version"
                ok "Version selected"
                parameters{
                    choice(name:'Build Version',choices:['1.1','1.2','1.3'])
                }
            }
            steps {
                script {
                    echo "Building the Job"
                    echo "Build the app with ${NEW_Version}"
                }
                
            }

            
        }
        stage('TEST') {
            when {
                expression {
                    params.executeTests == true
                }
                    
            }
            steps {
                script {
                    echo "UnitTesting the Job"
                    
                }
                
            }

            
        }
        stage('DEPLOY') {
           
            steps {
                script {
                    echo "Deploying the Job"
                    echo "Deploying to the environment:${params.ENV}"
                    echo "Application version is: ${params.APPVERSION}"
                }
                
            }

            
        }
    }
}
