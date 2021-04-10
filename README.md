For this challenge, you will need:
an AWS account with the IAM permissions listed on the EKS module documentation,
a configured AWS CLI
AWS IAM Authenticator
kubectl
wget (required for the eks module)
helm (required for deploy the applications)

Configfure AWS CLI
aws configure

AWS Access Key ID [None]: YOUR_AWS_ACCESS_KEY_ID
AWS Secret Access Key [None]: YOUR_AWS_SECRET_ACCESS_KEY
Default region name [None]: YOUR_AWS_REGION
Default output format [None]: json
git clone https://projeto/natura
cd natura/eks
### DESENHO DA ARQUITETURA ###
1. vpc.tf provisions a VPC, subnets and availability zones using the AWS VPC Module. 
2. security-groups.tf provisions the security groups used by the EKS cluster.
3. eks-cluster.tf provisions all the resources (AutoScaling Groups, etc...) required to set up an EKS cluster using the AWS EKS Module.
4. outputs.tf defines the output configuration.
5. versions.tf sets the Terraform version to at least 0.14. It also sets versions for the providers used in this challenge. 
6. Variables.tf defines the variables.
7. App-01.tf defines the deployment of app-01.
8. App-02.tf defines the deployment of app-02.
»Initialize Terraform workspace
terraform init
»Provision the EKS cluster
terraform apply
»Configure kubectl
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
kubectl get nodes

kubectl cluster-info
