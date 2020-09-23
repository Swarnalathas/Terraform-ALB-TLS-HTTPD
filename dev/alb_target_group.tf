# AWS Load Balancer target group
resource "aws_lb_target_group" "target_group" {
  name = "target-group"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.terra_vpc.id

  health_check {
    path = "/"
    protocol = "HTTP"
    matcher = "200"
    interval = 15
    timeout = 3
    healthy_threshold = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_target_group_attachment" "target_group_attachment" {
  count = 2  
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id = aws_instance.webservers[count.index].id
  port = 80
}