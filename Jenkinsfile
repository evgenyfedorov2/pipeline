stage('Analyze'){
    node {
        checkout scm
        stash 'everything'
        powershell '.\\build.ps1 -Task \'Analyze\''
    }
}
stage ('Test'){
    node {
        unstash 'everything'
        powershell '.\\build.ps1 -Task \'Test\''
    }
}
stage ('Publish') {
    node {
        unstash 'everything'
        nunit testResultsPattern: '*.xml'
    }
}
stage ('Deploy to DEV') {
    node {
        unstash 'everything'
        powershell '.\\build.ps1 -Task \'DeployToDev\''
    }
}

stage ('Deploy to PROD') {
    input ('Deploy to Production?')
    node {
        unstash 'everything'
        powershell '.\\build.ps1 -Task \'DeployToProd\''
    }
}