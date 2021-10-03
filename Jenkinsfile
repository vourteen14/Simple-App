#!groovy

node {
	def versi = sh(script: 'git describe --tags --abbrev=0', returnStdout: true)
	
	if(versi){
		versi = "1.0.0"
	}
	
	stage("Buat Image"){
		sh 'docker build -t simple-app .'
		sh 'docker tag simple-app vourteen14/simple-app:${versi}'
	}

	stage("Push Image"){
		sh 'docker push vourteen14/simple-app:${versi}'
	}
	
	stage("Deploy Image"){
	    sh 'export VERSI=${versi}'
        sh 'microk8s.kubectl apply -f simple-app.yaml'
	}
}
