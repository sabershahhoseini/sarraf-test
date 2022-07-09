pipeline {
    agent {
        label 'jenkins-agent'
    }
    stages {
        stage('Publish') {
            steps {
                sh "docker login --username=$username --password=$password nexus.sarrafex.com:8087"
                sh "docker build -t ${env.JOB_NAME.replace('.','/')}:latest ."
            }
        }
        stage('Publish') {
            steps {
                sh "docker image tag ${env.JOB_NAME.replace('.','/')}:latest nexus.sarrafex.com:8087/repository/nexus-sarrafex/${env.JOB_NAME.replace('.','/')}:latest"
                sh "docker image push nexus.sarrafex.com:8087/repository/nexus-sarrafex/${env.JOB_NAME.replace('.','/')}:latest"
                sh "docker rmi -f ${env.JOB_NAME.replace('.','/')}:latest nexus.sarrafex.com:8087/repository/nexus-sarrafex/${env.JOB_NAME.replace('.','/')}:latest"

                updateGitlabCommitStatus name: 'Publish', state: 'success'
            }
        }
        stage('Run') {
            environment {
                DOCKER_TLS_VERIFY = 1
                DOCKER_HOST = 'tcp://nodemanager.saraf.io:2376'
            }
            steps {

                    updateGitlabCommitStatus name: 'Run', state: 'pending'
                    withCredentials([dockerCert(credentialsId: 'saraf.nodemanager.remote',
                             variable: 'DOCKER_CERT_PATH')]) {
                    sh "docker service update --quiet --detach=true --image nexus.sarrafex.com:8087/repository/nexus-sarrafex/${env.JOB_NAME.replace('.','/')}:latest --force ${env.JOB_NAME.replace('saraf.','').replace('.','_')}"
                    updateGitlabCommitStatus name: 'Run', state: 'success'
                    }
                //)
            }
        }
    }
}
