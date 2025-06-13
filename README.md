# 🌐 Terraform AWS VPC + EC2 Web Server Deployment

This project uses **Terraform** to provision a basic web server infrastructure on **AWS**, including a custom VPC, public subnet, routing, and an EC2 instance with Apache installed. A styled `index.html` page is served to verify successful deployment.

---

## 🧱 Infrastructure Components

- **VPC** with CIDR `10.0.0.0/16`
- **1 Public Subnet** (`10.0.1.0/24`) with internet access
- **Internet Gateway** for public internet access
- **Route Table** with route to IGW
- **Security Group** allowing:
  - Port 22 (SSH)
  - Port 80 (HTTP)
  - Port 443 (HTTPS)
- **EC2 Instance** (Amazon Linux 2) with:
  - Apache (httpd) installed and enabled
  - Custom HTML page indicating successful Terraform provisioning

---

## 📁 Project Structure



├── main.tf              # EC2 instance and Apache setup<br>
├── vpc.tf               # VPC, subnets, IGW, and route table<br>
├── security.tf          # Security group for EC2<br>
├── provider.tf          # AWS provider configuration<br>
├── outputs.tf           # Useful output values (e.g., web URL)<br>
└── README.md            # Project documentation<br>

📷 Webpage Screenshot

![Image alt](https://github.com/faisalanwar11/terraform-projects/blob/main/images/webpage.png?raw=true)

