🌐 Terraform Project: To host a application with operational overload

Welcome to my Terraform project! This repository contains Terraform scripts to set up an EC2 instance on AWS using Amazon Linux, along with necessary networking components such as VPC, Subnets, Internet Gateway, NAT Gateway, Route Tables, Security Groups, and an Application Load Balancer. 🚀

## 📝 Project Overview

This project demonstrates the creation and management of AWS infrastructure using Terraform. The key components of the infrastructure are:

- **VPC**: Virtual Private Cloud to host the resources.
- **Subnets**: Public and Private subnets for better segregation and security.
- **Security Groups**: To manage inbound and outbound traffic rules.
- **Internet Gateway and NAT Gateway**: For internet connectivity of public and private subnets.
- **Route Tables**: To manage the routing within the VPC.
- **EC2 Instance**: Amazon Linux instance for hosting the application.
- **Application Load Balancer**: To distribute incoming traffic across multiple instances.

## 🛠️ Installation

1. **Install Terraform**:
   ```bash
   sudo yum install -y yum-utils shadow-utils
   sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
   sudo yum -y install terraform
   ```
   ![2 terraform_verify](https://github.com/user-attachments/assets/a6d03930-6a4a-40b8-ac85-6c32969b3995)


2. **Clone the Repository**:
   ```bash
   git clone https://github.com/ALAMANDABHASAKAR09/Terraform_Project.git
   cd Terraform_Project
   ```

3. **Set Up Working Directory**:
   ```bash
   mkdir main_project
   cd main_project
   echo $"export PATH=\$PATH:$(pwd)" >> ~/.bash_profile
   source ~/.bash_profile
   ```
   ![1 terraform_installation](https://github.com/user-attachments/assets/15e8af80-d090-4520-a5fe-fb128d1781e7)


## 🚀 Usage

1. **Initialize Terraform**:
   ```bash
   terraform init
   ```
   

2. **Apply Terraform Configuration**:
   ```bash
   terraform apply
   ```

3. **Destroy Infrastructure** (when no longer needed):
   ```bash
   terraform destroy
   ```

## ⚙️ Configuration

Ensure you update the `provider.tf` file with your AWS credentials and region:

```hcl
provider "aws" {
  region     = "ap-northeast-1"
  access_key = "<YOUR_ACCESS_KEY>"
  secret_key = "<YOUR_SECRET_KEY>"
}
```

## 🔄 Workflow

1. **Initialize Terraform**:
   ```bash
   terraform init
   ```
   ![3 Terraform_intialization](https://github.com/user-attachments/assets/a3f7244c-c120-405b-b587-4b491cf3fb90)

2. **Plan and Review**:
   ```bash
   terraform plan
   ```
   ![5 Terraform_plan](https://github.com/user-attachments/assets/f690c1e0-6211-48d7-9e0e-8aa03502ce2b)

3. **Creation & Validation of Scripts**:
   ```bash
   terraform validate
   ```
   ![4 Files_creation_validation](https://github.com/user-attachments/assets/c5b345a9-6a48-423d-bc0e-a0bbb98d6897)

4. **Apply Configuration**:
   ```bash
   terraform apply --auto-approve
   ```
   ![7 Resource_creation](https://github.com/user-attachments/assets/e1ea2f93-1d7b-4973-b55b-586741ddc7d7)

5. **Verify Resources**:
   - Check the AWS Management Console to verify the created resources.
   - Access the EC2 instance via the public IP to ensure the web server is running.

   ![7 Resource_creation](https://github.com/user-attachments/assets/dcb3e737-8d21-4038-a461-14dc24fe06fe)

6. **Clean Up**:
   ```bash
   terraform destroy --auto-approve
   ```
   ![Screenshot 2024-07-22 145857](https://github.com/user-attachments/assets/5459bf2d-eadd-430b-90c2-a0344ca51309)

## 🤝 Contributing

Contributions are welcome! Please fork this repository, create a new branch, and submit a pull request.

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Developed by Bhaskar 🌟
```

Feel free to customize the content further based on your preferences and specific project details!
