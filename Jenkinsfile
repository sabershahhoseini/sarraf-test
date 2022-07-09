podTemplate {
    node(POD_LABEL) {
        stage('Run shell') {
            sh 'echo hello world'
        }
  
        stage('Run') {
            steps {
                sh "echo Running starge RUN..."
            }
        }
        stage('Run') {
                steps {
                    sh "echo Running starge RUN..."
            }
        }
    }
}
