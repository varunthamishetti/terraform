pipeline {
    agent any

    triggers {
        gitlab(
            triggerOnPush: true,
            branchFilterType: 'All',
        )
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: "main",
                    credentialsId: 'none',
                    url: 'https://github.com/varunthamishetti/terraform.git'
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init -input=false'
                    // Optionally handle initialization errors
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    sh "terraform plan -input=false -out tfplan -var 'branch_name=${env.gitlabBranch}'"
                    // Add other variables or workspace selection as needed
                    sh 'terraform show -no-color tfplan > tfplan.txt'
                    // Optionally handle plan errors and warnings
                }
            }
        }

        // Add a stage for manual approval or automated apply based on your needs
    }
}
