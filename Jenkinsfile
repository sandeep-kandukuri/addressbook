pipeline {
    agent any
    parameters {
        string(name:'ENV',defaultValue:'Test',description:'version to deploy')
        booleanParams(name:'executeTests',defaultValue:true,description:'decide to rum tc')
        choice(name:'APPVERSION',choices:['1.1','1.2','1.3'])

    }

    stages {
        stage('Build') {
            steps {
                script {
                    echo "Building the Job"
                }
                
            }

            
        }
        stage('TEST') {
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