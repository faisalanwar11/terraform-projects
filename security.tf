# ------------------------------------------------------------------------------
# Security Group: web_sg
# This security group allows inbound access to HTTP (80), HTTPS (443), and SSH (22)
# and permits all outbound traffic from the EC2 instance to the internet.
# ------------------------------------------------------------------------------

resource "aws_security_group" "web_sg" {
  vpc_id      = aws_vpc.web_vpc.id
  name        = "web-sg"
  description = "Allow HTTP, HTTPS, and SSH access"

  # ------------------------
  # Inbound Rules
  # ------------------------

  # Allow HTTP (port 80) access from anywhere (for web traffic)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTPS (port 443) access from anywhere (for secure web traffic)
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow SSH (port 22) access from anywhere (for remote login)
  # ⚠️ Consider restricting this to your IP in production
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # ------------------------
  # Outbound Rules
  # ------------------------

  # Allow all outbound traffic to any destination
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}
