## For this challenge, you will need:
- An AWS account with the IAM permissions listed on the EKS module documentation,
- A configured AWS CLI
- AWS IAM Authenticator
- kubectl
- wget (required for the eks module)
- helm (required for deploy the applications)

## Configfure AWS CLI
```aws configure```

     AWS Access Key ID [None]: YOUR_AWS_ACCESS_KEY_ID
     AWS Secret Access Key [None]: YOUR_AWS_SECRET_ACCESS_KEY
     Default region name [None]: YOUR_AWS_REGION
     Default output format [None]: json

```git clone https://github.com/skeeterx88/terraform-eks```

```cd terraform-eks```

## DESENHO DA ARQUITETURA ###

## List of files and their descriptions
1. vpc.tf provisions a VPC, subnets and availability zones using the AWS VPC Module. 
2. security-groups.tf provisions the security groups used by the EKS cluster.
3. eks-cluster.tf provisions all the resources (AutoScaling Groups, etc...) required to set up an EKS cluster using the AWS EKS Module.
4. outputs.tf defines the output configuration.
5. versions.tf sets the Terraform version to at least 0.14. It also sets versions for the providers used in this challenge. 
6. Variables.tf defines the variables.
7. helm.tf defines the helm configuration.
8. App-01.tf defines the deployment of app-01.
9. App-02.tf defines the deployment of app-02.

## Initialize Terraform workspace
```terraform init```
## Provision the EKS cluster
```terraform apply -auto-approve```
### Configure kubectl
```aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)```

### Get info of the nodes
```kubectl get nodes```

### Get info of the cluster
```kubectl cluster-info```

## Get hostname of applications
### App-01
```curl $(kubectl get service -n app-01 -o jsonpath='{.items[*].status.loadBalancer.ingress[*].hostname})'```

### App-02
```curl $(kubectl get service -n app-02 -o jsonpath='{.items[*].status.loadBalancer.ingress[*].hostname})'```

