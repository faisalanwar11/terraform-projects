# ------------------------------------------------------------------------------
# Output: Web Server URL
# Displays the public IP address of the EC2 instance in URL format (http://...)
# ------------------------------------------------------------------------------

output "webserver_url" {
  value       = "http://${aws_instance.webserver.public_ip}"
  description = "The public IP address of the web server"
}
