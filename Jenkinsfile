podTemplate {
    node(POD_LABEL) {
        stages {
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
}
