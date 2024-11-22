pipeline {
    agent any
    parameters {
        string(name:'ENV',defaultValue:'Test',description:'version to deploy')
        booleanParam(name:'executeTests',defaultValue:true,description:'decide to rum tc')
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
            when {
                expression {
                    BRANCH_NAME == 'PROD'
                }
            }
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
