node{
  def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line  */

        app = docker.build("2anoopp/sampletomcat")
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-)  */

        app.inside {
            sh 'echo "Tests passed successfully "'
          
        }
    }
  
  stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
          
        }
    }
  
  stage('Create container on k8s') {
           
                    sh "kubectl apply -f tomcat_deploy.yml"
                }
  
  stage('Delete all images and containers'){
    
            sh "docker system prune -a -f"
  }
}
