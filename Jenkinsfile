pipeline {
   agent any

   environment {
    // the address of your harbor registry
     REGISTRY = 'https://harbor.tmc.datamarket.local'
     REGISTRY_PATH = 'harbor.tmc.datamarket.local/flask'
     HARBOR = 'harbor'
  }
    stages {
        stage('Github') {
            steps {
                git (
                    url: 'https://github.com/caglayildiz2/flask.git',
                    branch: 'main'
                    )
            }
        }

        stage('Docker Image to Harbor'){
          steps {
            script {
              docker.withRegistry("$REGISTRY", "$HARBOR") {
                def app = docker.build("harbor.tmc.datamarket.local/flask/flask")
                app.push()
              //  sh 'docker image rm harbor.datamarket.local/app/spring-app:${env.BUILD_ID}'
             }
          }
        }
      }


        stage('Trigger ManifestUpdate') {
          steps {
                   echo "triggering updatemanifestjob"
                   build job: 'updatemanifest' /* parameters: [string(name: 'DOCKERTAG', value: '${env.BUILD_ID}')] */
                }
               }
    }
   }
