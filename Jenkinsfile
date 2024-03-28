pipeline {
    agent any

    stages {

        stage('Install Python') {
            steps {
                script {
                    sh 'sudo apt-get update'
                    sh 'sudo apt-get install -y python3 python3-pip'
                }
            }
        }

        stage('git pull') {
            steps {
                git branch: 'main', url: 'https://github.com/Karim-AV/pytest.git'
            }
        }

        stage('running test') {
            steps {
                withAllureUpload(name: '${JOB_BASE_NAME} - #${BUILD_NUMBER}', results: [[path: 'build/allure-results']], projectId: '6702', serverId: 'testing', silent: true,  tags: 'defects') {
                sh '''
                    python -m venv .venv
                    source .venv/bin/activate
                    pip install -r requirements.txt
                    python -m pytest --alluredir allure-results
                '''
            }
        }
    }
}
}