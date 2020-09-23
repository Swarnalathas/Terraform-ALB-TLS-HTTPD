# Terraform-ALB-TLS-httpd

Sample Terraform Project to create ALB with two httpd webserver running on Linux environment scaled across 2 avaliable zones.

The web page is secure with Self signed Certificate.

Requirements to Run this Project:
- Terraform in your classpath
- AWS CLI
- AWS Account

Components created using Terraform:
- AWS ALB
- AWS VPC with 2 Subnet
- AWS EC2 Instance - Httpd Server
- Self Signed cerifificate for TLS

How to Execute:
- terraform init
- terraform apply

execute after verify all created successfully if created isntances no longer needed.
- terraform destroy
