pipeline {
    agent {
        label 'jenkins-agent'
    }
    stages {
        stage('Publish') {
            steps {
                sh "docker login --username=admin --password=LnWg94fTbyMUFjh6 nexus.sarrafex.com:8087"
                sh "docker build -t nexus.sarrafex.com:8087/repository/nexus-sarrafex/saber-test ."
                sh "docker image push nexus.sarrafex.com:8087/repository/nexus-sarrafex/saber-test"

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
                    sh "docker service update --quiet --detach=true --image registry.saraf.io/${env.JOB_NAME.replace('.','/')}:latest --force ${env.JOB_NAME.replace('saraf.','').replace('.','_')}"
                    updateGitlabCommitStatus name: 'Run', state: 'success'
                    }
                //)
            }
        }
    }
}
