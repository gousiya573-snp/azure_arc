Start-Transcript -Path C:\tmp\dc_deploy.log

# Deploying Azure Arc Data Controller
start Powershell {for (0 -lt 1) {kubectl get pod -n $env:ARC_DC_NAME; sleep 5; clear }}
azdata arc dc create -p azure-arc-eks-private-preview --namespace $env:ARC_DC_NAME --name $env:ARC_DC_NAME --subscription $env:ARC_DC_SUBSCRIPTION --resource-group $env:ARC_DC_RG --location $env:ARC_DC_REGION --connectivity-mode indirect
azdata login -n $env:ARC_DC_NAME

Stop-Transcript

Stop-Process -name powershell -Force
