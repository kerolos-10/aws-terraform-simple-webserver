markdown# AWS Web Server Infrastructure with Terraform

This project creates a complete web server infrastructure on AWS using Terraform, including VPC, subnet, security group, and EC2 instance with Apache web server.

## 🏗️ Infrastructure Components

- **VPC**: Custom Virtual Private Cloud with DNS support
- **Subnet**: Public subnet with auto-assign public IP
- **Internet Gateway**: For internet access
- **Route Table**: Routes traffic to the internet gateway
- **Security Group**: Allows HTTP (port 80) and SSH (port 22) access
- **EC2 Instance**: Amazon Linux 2 instance with Apache web server

## 📋 Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed (version >= 1.0)
- AWS Key Pair created in your target region

## 🚀 Quick Start

1. **Clone this repository**
   ```bash
   git clone https://github.com/kerolos-10/aws-terraform-webserver.git
   cd aws-terraform-webserver

Initialize Terraform
bashterraform init

Review and modify variables (optional)
bashcp terraform.tfvars.example terraform.tfvars
nano terraform.tfvars

Plan the deployment
bashterraform plan

Apply the configuration
bashterraform apply

Access your web server

Use the public IP address shown in the output
Open http://<public-ip> in your browser



🔧 Configuration
Variables
VariableDescriptionDefaultRequiredaws_regionAWS regionus-east-1Noinstance_typeEC2 instance typet2.microNokey_nameAWS key pair namemy-keyYesvpc_cidrCIDR block for VPC10.0.0.0/16Nosubnet_cidrCIDR block for subnet10.0.0.0/24No
Outputs
OutputDescriptioninstance_public_ipPublic IP address of the EC2 instanceinstance_public_dnsPublic DNS of the EC2 instancevpc_idID of the created VPCsubnet_idID of the created subnetsecurity_group_idID of the security groupweb_urlDirect URL to access the web server
🧹 Cleanup
To destroy the infrastructure:
bashterraform destroy
🔒 Security Notes

This configuration allows SSH and HTTP access from anywhere (0.0.0.0/0)
For production use, restrict access to specific IP ranges
Consider using AWS Systems Manager Session Manager instead of SSH

📝 License
This project is licensed under the MIT License - see the LICENSE file for details.
🤝 Contributing

Fork the repository
Create a feature branch
Commit your changes
Push to the branch
Create a Pull Request

📞 Support
If you encounter any issues, please create an issue in the GitHub repository.