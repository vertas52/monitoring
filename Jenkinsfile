@Library('mainlib@0.2.0') _

pipeline {
    agent none
    stages {
        stage('lint') {
            agent {
                kubernetes simplePod(image: 'dldt_checks/prometheus:0.1.0')
            }
            steps {
                checkout scm
                sh label: 'Verify Prometheus config',
                script: 'promtool check config prometheus/prometheus.yml'

                sh label: 'Verify Alertmanager config',
                   script: 'amtool check-config alertmanager/config.yml'

            }
        }
        stage('reload_configs') {
            when {
                branch 'master'
            }
            agent {
                label 'nnlvdp-mon03'
            }
            steps {
                sh 'cd /node_monitoring && ./reload_config.sh'
            }
        }
        stage('restart') {
            when {
                allOf {
                    branch 'master'
                    changeset 'docker-compose.yml'
                }
            }
            agent {
                label 'nnlvdp-mon03'
            }
            steps {
                sh 'cd /node_monitoring && ./run.sh'
            }
        }
    }
}
