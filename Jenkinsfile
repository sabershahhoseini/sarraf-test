pipeline {
    agent {
        label 'jenkins-agent'
    }
    stages {
        stage('Build') {
            steps {
                checkout([
                    $class: 'GitSCM', branches: [[name: '*/main']],
                    userRemoteConfigs: [[url: "https://github.com/sabershahhoseini/sarraf-test"]]
                ])
                
                sh "docker image build --no-cache --pull --tag ${env.JOB_NAME.replace('.','/')}:latest ."
            }
        }
        stage('Publish') {
            steps {
                updateGitlabCommitStatus name: 'Publish', state: 'pending'

                sh "docker image tag ${env.JOB_NAME.replace('.','/')}:latest nexus.sarrafex.com:8087/repository/nexus-sarrafex/${env.JOB_NAME.replace('.','/')}:latest"
                sh "docker image push nexus.sarrafex.com:8087/repository/nexus-sarrafex/${env.JOB_NAME.replace('.','/')}:latest"
                sh "docker rmi -f ${env.JOB_NAME.replace('.','/')}:latest nexus.sarrafex.com:8087/repository/nexus-sarrafex/${env.JOB_NAME.replace('.','/')}:latest"

                updateGitlabCommitStatus name: 'Publish', state: 'success'
            }
        }
    }
}
