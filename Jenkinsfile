#!groovy

node {
	def versi = sh(script: 'git describe --tags --abbrev=0', returnStdout: true)
	def image = "vourteen14/simple-app:${versi}"
	
	stage("Buat Image"){
		sh "docker build -t simple-app ."
		sh "docker tag simple-app vourteen14/simple-app:latest"
	}

	stage("Push Image"){
		withCredentials([string(credentialsId: 'DOCKER_PASSWORD', variable: 'PW')]) {
			sh "docker login -u vourteen14 -p ${PW}"
			sh "docker push vourteen14/simple-app:latest"
		}
	}
	
	stage("Deploy Image"){
		microk8s.kubectl apply -f simple-app.yaml
	}
}
