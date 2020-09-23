# Create a new load balancer
resource "aws_lb" "terra_alb" {
  name               = "terra-alb"
  internal           = false
  load_balancer_type = "application"
  subnets = aws_subnet.public[*].id
  security_groups = ["${aws_security_group.alb_sec_group.id}"]

  enable_deletion_protection = false

  tags ={
    Name = "terraform_alb"
  }
}

output "alb-dns-name" {
  value = "${aws_lb.terra_alb.dns_name}"
}
