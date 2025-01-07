pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Clonar el repositorio desde GitHub, especificando la rama 'main'
                git url: 'https://github.com/haroldcutti/Demo-Proveedor.git', branch: 'main'
            }
        }
        stage('Install Dependencies') {
            steps {
                script {
                    // Instalar dependencias de Node.js con --legacy-peer-deps para evitar conflictos
                    bat 'npm install --force'
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    // Compilar el proyecto (en este caso, el frontend)
                    bat 'npm run build --prod'
                }
            }
        }
        stage('Dockerize') {
            steps {
                script {
                    // Crear la imagen Docker
                    bat '''
                    docker build -t demo-jenkins .
                    '''
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    // Ejecutar el contenedor Docker en el puerto 8081
                    bat '''
                    docker run -d -p 8081:80 demo-jenkins
                    '''
                }
            }
        }
    }
}
