$env:INSTALL_REGISTRY_USERNAME='iamlizhiyong@outlook.com'
$env:INSTALL_REGISTRY_PASSWORD='Nuonuo-8815'
$env:INSTALL_REGISTRY_HOSTNAME='registry.tanzu.vmware.com'

kubectl create ns tap-install

tanzu secret registry add tap-registry --username 'iamlizhiyong@outlook.com' --password 'Nuonuo-8815' --server 'registry.tanzu.vmware.com' --export-to-all-namespaces --yes --namespace tap-install

tanzu package repository add tanzu-tap-repository --url registry.tanzu.vmware.com/tanzu-application-platform/tap-packages:1.0.0 --namespace tap-install