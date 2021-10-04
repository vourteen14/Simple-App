#!groovy

node {
	def versi = sh(script: 'git describe --tags --abbrev=0', returnStdout: true)
	def image = "vourteen14/simple-app:${versi}"
	
	if(versi){
		versi = "1.0.0"
	}
	
	stage("Buat Image"){
		echo "Versi: ${versi}"
		sh "docker build -t simple-app ."
		sh "docker tag simple-app vourteen14/simple-app:${versi}"
	}

	stage("Push Image"){
		withCredentials([string(credentialsId: 'DOCKER_PASSWORD', variable: 'PW')]) {
			sh "docker login -u vourteen14 -p ${PW}"
			sh "docker push vourteen14/simple-app:${versi}"
		}
	}
	
	stage("Deploy Image"){
		script {
			sh """
				sed -i "s|{{IMAGE}}|${image}|" simple-app.yaml
				microk8s.kubectl apply -f simple-app.yaml
			"""
		}
	}
}
