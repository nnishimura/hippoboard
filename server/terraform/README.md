# Configure AWS with Terraform

## Getting started

### 1. Create public key for ec2

```
ssh-keygen -t rsa -b 4096 -m PEM -C "<email>"
```

Then update `public_key_path` in `variables.tf`

### 2. Download terraform plugin for aws (first time only)

```
terraform init
```

### 3. Dry-run:

```
terraform plan
```

### 4. Apply changes:

```
terraform apply
```

## 5. Provision the new ec2 instance

Run ansible playbook in `/aws_wordpress`. Make sure to update `hosts` with the new IP / private key path too.

wordpress should be running at https://www.nnishimura.work/ now :tada:

## Reference

* https://github.com/RVIRUS0817/terraform_plaza/tree/master/envs/aws/prd
* https://github.com/mlabouardy/terraform-aws-labs/tree/945a5242405f9faba893fd180f27d82da5ff1c12
