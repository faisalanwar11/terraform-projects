# ---------------------------------------------------------------------------
# EC2 Instance Configuration
# Creates a public EC2 instance in the specified subnet, installs Apache,
# and serves a custom HTML page indicating Terraform provisioning success.
# ---------------------------------------------------------------------------


resource "aws_instance" "webserver" {
  # Use an Amazon Linux 2 AMI (HVM) in the desired region (change if needed)
  ami           = "ami-0b09627181c8d5778"
  instance_type = "t2.micro"  # Free-tier eligible instance type

  # Launch the instance in the public subnet
  subnet_id = aws_subnet.public_subnet.id

  # Associate the EC2 instance with the appropriate security group
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  # Assign a public IP so the instance is reachable from the internet
  associate_public_ip_address = true

  # Add tags for identification and tracking
  tags = {
    Name      = "webserver"
    Terraform = "True"
  }

  # User data script to install Apache (httpd), start the service,
  # enable it on boot, and deploy a styled HTML page to the web root
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y httpd
              sudo systemctl start httpd
              sudo systemctl enable httpd

              # Create an index.html file to verify successful provisioning
              sudo cat <<EOT > /var/www/html/index.html
              <!DOCTYPE html>
              <html lang="en">
              <head>
                <meta charset="UTF-8">
                <title>Terraform Deployment</title>
                <style>
                  body {
                    background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
                    font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
                    color: #fff;
                    text-align: center;
                    padding-top: 100px;
                    margin: 0;
                  }
                  h1 {
                    font-size: 48px;
                    margin-bottom: 20px;
                    color: #00ffcc;
                  }
                  p {
                    font-size: 20px;
                    margin-bottom: 30px;
                  }
                  .terraform {
                    font-weight: bold;
                    color: #7f52ff;
                    background-color: #ffffff22;
                    padding: 10px 20px;
                    border-radius: 8px;
                    display: inline-block;
                    box-shadow: 0 0 10px #00ffcc66;
                  }
                  footer {
                    position: fixed;
                    bottom: 20px;
                    width: 100%;
                    font-size: 14px;
                    color: #aaa;
                  }
                </style>
              </head>
              <body>
                <h1>🚀 Welcome to Terraform Deployment!</h1>
                <p>This page is <span class="terraform">provisioned via Terraform</span>.</p>
                <p>If you're seeing this, your infrastructure is working as expected. ✅</p>
                <footer>&copy; 2025 | Terraform Testing Page</footer>
              </body>
              </html>
              EOT
              EOF
}
