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

| File         | Description                             |
|--------------|-----------------------------------------|
| main.tf      | EC2 instance and Apache setup           |
| vpc.tf       | VPC, subnets, IGW, and route table      |
| security.tf  | Security group for EC2                  |
| provider.tf  | AWS provider configuration              |
| outputs.tf   | Useful output values (e.g., web URL)    |
| README.md    | Project documentation                   |

---

📷 Terraform Webpage Screenshot

![Terraform Webpage](https://github.com/faisalanwar11/terraform-projects/blob/5e88ef69ddf9a72a6ffc9255efde879b3c88beb1/Terraform%20Deployment.jpg)

