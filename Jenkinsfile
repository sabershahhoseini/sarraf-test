podTemplate {
    node(POD_LABEL) {
        stage('Build') {
            sh 'echo Building ...'
            sh "docker login --username=$nexus_username --password=$nexus_password nexus.sarrafex.com:8087"
            sh "docker image build --no-cache --pull --tag ${env.JOB_NAME.replace('.','/')}:latest ."
            updateGitlabCommitStatus name: 'Build', state: 'success'
        }
        stage('Run') {
            sh "echo Running starge RUN..."
        }
    }
}
