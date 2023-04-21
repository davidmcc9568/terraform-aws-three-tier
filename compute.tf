resource "aws_launch_template" "web" {
  name_prefix   = "web-lt-"
  image_id      = "ami-007855ac798b5175e" # AMI ID for Ubuntu 22.04; replace it with the appropriate AMI ID for your use case
  instance_type = var.web_instance_type   #change instance size to your specifications in .tfvars file, such as M5 General

  vpc_security_group_ids = [aws_security_group.web.id]

  user_data = base64encode(templatefile("${path.module}/userdata_web.tpl", {}))

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "web" {
  name_prefix          = "web-asg-"
  launch_configuration = aws_launch_template.web.id
  min_size             = 1
  max_size             = 4
  desired_capacity     = 2
  vpc_zone_identifier  = module.vpc.public_subnets
  target_group_arns    = [aws_lb_target_group.web.arn]

  tag {
    key                 = "Name"
    value               = "web"
    propagate_at_launch = true
  }

  tag {
    key                 = "Terraform"
    value               = "true"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "dev"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_template" "app" {
  name_prefix   = "app-lt-"
  image_id      = "ami-007855ac798b5175e" # AMI ID for Ubuntu 22.04; replace it with the appropriate AMI ID for your use case
  instance_type = var.web_instance_type   #change instance size to your specifications in .tfvars file, such as M5 General

  vpc_security_group_ids = [aws_security_group.web.id]

  user_data = base64encode(templatefile("${path.module}/userdata_app.tpl", {}))

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "app" {
  name_prefix          = "app-asg"
  vpc_zone_identifier  = module.vpc.private_subnets
  launch_configuration = aws_launch_template.app.id
  target_group_arns    = [aws_lb_target_group.app.arn]

  min_size         = 1
  max_size         = 3
  desired_capacity = 2

  tag {
    key                 = "Name"
    value               = "app"
    propagate_at_launch = true
  }

  tag {
    key                 = "Terraform"
    value               = "true"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "dev"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb" "web" {
  name               = "web-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web.id]
  subnets            = module.vpc.public_subnets

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_lb_target_group" "web" {
  name     = "web-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}

resource "aws_lb_listener" "web" {
  load_balancer_arn = aws_lb.web.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web.arn
  }
}

resource "aws_lb" "app" {
  name               = "app-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.app.id]
  subnets            = module.vpc.private_subnets

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_lb_target_group" "app" {
  name     = "app-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}

resource "aws_lb_listener" "app" {
  load_balancer_arn = aws_lb.app.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app.arn
  }
}