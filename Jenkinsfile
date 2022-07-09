podTemplate {
    node(POD_LABEL) {
        stage('Build') {
            sh 'echo Building ...'
            updateGitlabCommitStatus name: 'Build', state: 'pending'
            checkout([
                $class: 'GitSCM', branches: [[name: '*/master']],
                userRemoteConfigs: [[url: "https://devops.saraf.io/Projects/CryptoExchange/_git/${env.JOB_NAME.replace('saraf','').replace('.services','').replace('.','/')}" ,credentialsId:'azure_admin']]
            ])
            sh "docker image build --no-cache --pull --tag ${env.JOB_NAME.replace('.','/')}:latest ."
            updateGitlabCommitStatus name: 'Build', state: 'success'
        }
        stage('Run') {
            sh "echo Running starge RUN..."
        }
    }
}
