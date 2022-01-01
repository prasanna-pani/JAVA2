pipeline {
	agent any
  stages {

    stage('CheckOut') {
      steps {
         git branch: 'main', url: 'https://github.com/prasanna-pani/JAVA2.git'
         bat 'checkout.bat'
      }
    }

    stage('Build') {
      steps {
          bat 'build.bat'
      }
    }

    stage('Run') {
      steps {
      		bat 'run.bat'
      }
    }

   } 

  post {
    success {
      echo "SUCCESS"
    }
    failure {
      echo "FAILURE"
    }
    changed {
      echo "Status Changed will run"
    }
    always {
	echo "This will always run"
        }
      }
    }