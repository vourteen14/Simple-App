#!groovy

node {
	stage("Buat Image"){
		script {
			def versi = sh(script: 'git describe --tags --abbrev=0', returnStdout: true)
			if(versi){
				versi = "1.0.0"
			}
			sh 'docker build -t simple-app .'
			sh 'docker tag simple-app vourteen14/simple-app:${versi}'
		}
	}

	stage("Push Image"){
		script {
			def versi = sh(script: 'git describe --tags --abbrev=0', returnStdout: true)
	
			if(versi){
				versi = "1.0.0"
			}
			sh 'docker push vourteen14/simple-app:${versi}'
		}
	}
	
	stage("Deploy Image"){
		script {
			def versi = sh(script: 'git describe --tags --abbrev=0', returnStdout: true)
	
			if(versi){
				versi = "1.0.0"
			}
			sh 'export VERSI=${versi}'
			sh 'microk8s.kubectl apply -f simple-app.yaml'
		}
	}
}
