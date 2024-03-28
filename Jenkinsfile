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
                sh 'python -m pytest --alluredir allure-results'
            }
        }
    }
}
}