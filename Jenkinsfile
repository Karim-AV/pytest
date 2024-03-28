pipeline {
    agent any

    stages {

        stage('git pull') {
            steps {
                git branch: 'main', url: 'https://github.com/Karim-AV/pytest.git'
            }
        }

        stage('running test') {
            steps {
                withAllureUpload(name: '${JOB_BASE_NAME} - #${BUILD_NUMBER}', results: [[path: 'build/allure-results']], projectId: '6702', serverId: 'testing', silent: true,  tags: 'defects') {
                sh '''
                    /usr/bin/python3 -m venv .venv
                    source .venv/bin/activate
                    /usr/bin/python3 -m pytest --alluredir allure-results
                '''
            }
        }
    }
}
}