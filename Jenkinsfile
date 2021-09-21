node {
    stage("Ambil repo"){
       git branch: 'master', credentialsId: 'AKUN_GITHUB', url: 'https://github.com/vourteen14/Simple-App.git'
    }
    stage("Buat Image"){
        sh 'docker build -t simple-app .'
        sh 'docker tag simple-app vourteen14/simple-app:v2'
    }
    withCredentials([string(credentialsId: 'DOCKERHUB_PASSWD', variable: 'PASSWORD')]) {
        sh 'docker login -u vourteen14 -p $PASSWORD'
    }
    stage("Push Image"){
        sh 'docker push vourteen14/simple-app:v2'
    }
	stage("Deploy ke Kubernetes"){
		sh 'microk8s.kubectl create -f simple-app.yaml'
	}
}
