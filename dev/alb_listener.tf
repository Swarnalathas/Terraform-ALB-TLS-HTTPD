
resource "aws_alb_listener" "https" {
 
  default_action {
    target_group_arn = aws_lb_target_group.target_group.id
    type             = "forward"
  }

  load_balancer_arn = aws_lb.terra_alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.cert.arn
}

resource "aws_lb_listener" "http" {

  load_balancer_arn = aws_lb.terra_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}


