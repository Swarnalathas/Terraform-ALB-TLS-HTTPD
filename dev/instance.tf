resource "aws_instance" "webservers" {
	count = length(var.subnets_cidr)
	ami = var.webservers_ami
	instance_type = var.instance_type
	security_groups = ["${aws_security_group.alb_sec_group.id}"]
	subnet_id = element(aws_subnet.public.*.id,count.index)
	user_data = templatefile("install_httpd.sh",{inst="Server-${count.index}"})
	tags = {
	  Name = "Server-${count.index}"
	}
}
