node {
    stage("Ambil repo"){
       git branch: 'master', credentialsId: 'AKUN_GITHUB', url: 'https://github.com/vourteen14/Simple-App.git'
    }
    stage("Buat Image"){
        sh 'docker build -t simple-app .'
        sh 'docker tag simple-app vourteen14/simple-app:v4'
    }
    withCredentials([string(credentialsId: 'DOCKERHUB_PASSWD', variable: 'PASSWORD')]) {
        sh 'docker login -u vourteen14 -p $PASSWORD'
    }
    stage("Push Image"){
        sh 'docker push vourteen14/simple-app:v4'
    }
	stage("Deploy ke Kubernetes"){
		sh 'microk8s.kubectl set image deployment/simple-app-production simple-app-production=vourteen14/simple-app:v3'
	}
}
