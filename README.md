# AWS simpel Web Server Infrastructure with Terraform

This project creates a complete web server infrastructure on AWS using Terraform, including VPC, subnet, security group, and EC2 instance with Apache web server.

## 🏗️ Infrastructure Components

- **VPC**: Custom Virtual Private Cloud (10.0.0.0/16)
- **Subnet**: Public subnet (10.0.0.0/24) with auto-assign public IP
- **Internet Gateway**: For internet access
- **Route Table**: Routes traffic to the internet gateway
- **Security Group**: Allows HTTP (port 80) and SSH (port 22) access
- **EC2 Instance**: t2.micro Amazon Linux 2 instance with Apache web server

## 📋 Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed (version >= 1.0)
- AWS Key Pair created in your target region (default: "my-key")

## 🚀 Quick Start

1. **Clone this repository**
   ```bash
   git clone https://github.com/yourusername/aws-terraform-webserver.git
   cd aws-terraform-webserver
   ```

2. **Initialize Terraform**
   ```bash
   terraform init
   ```

3. **Plan the deployment**
   ```bash
   terraform plan
   ```

4. **Apply the configuration**
   ```bash
   terraform apply
   ```

5. **Access your web server**
   - Use the public IP address shown in the output
   - Open `http://<public-ip>` in your browser

## 🔧 Configuration Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `aws_region` | AWS region | `us-east-1` |
| `instance_type` | EC2 instance type | `t2.micro` |
| `key_name` | AWS key pair name | `my-key` |
| `vpc_cidr` | CIDR block for VPC | `10.0.0.0/16` |
| `subnet_cidr` | CIDR block for subnet | `10.0.0.0/24` |

## 📤 Outputs

- `instance_public_ip`: Public IP address of the EC2 instance
- `instance_public_dns`: Public DNS of the EC2 instance
- `vpc_id`: ID of the created VPC
- `subnet_id`: ID of the created subnet
- `web_url`: Direct URL to access the web server
- ### ✅ Example Output

![Terraform Apply Output](https://github.com/kerolos-10/aws-terraform-simple-webserver/blob/6fe82ebe90e2406544ffd7beab18405612b11b61/terraform-output.png.png)


## 🧹 Cleanup

To destroy the infrastructure:
```bash
terraform destroy
```

## 🔒 Security Notes

- This configuration allows SSH and HTTP access from anywhere (0.0.0.0/0)
- For production use, restrict access to specific IP ranges
- Consider using AWS Systems Manager Session Manager instead of SSH

## 📁 Project Structure

```
aws-terraform-webserver/
├── main.tf                 # Main infrastructure resources
├── variables.tf            # Input variables
├── outputs.tf              # Output values
├── providers.tf            # Provider configuration
├── .gitignore             # Git ignore file
└── README.md              # This file
```

## 📝 License

This project is licensed under the MIT License.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📞 Support

If you encounter any issues, please create an issue in the GitHub repository.
