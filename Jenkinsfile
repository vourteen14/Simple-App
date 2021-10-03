#!groovy

def Test(){
    echo "aa"
}

node {
    stage ("Test") {
        sh 'git rev-parse --abbrev-ref HEAD'
    }
}