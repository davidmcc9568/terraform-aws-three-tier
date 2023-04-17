resource "aws_launch_configuration" "web" {
  name_prefix = "web-lc-"
  image_id    = "ami-007855ac798b5175e" # This is an example Amazon Linux 2 AMI ID; replace it with the appropriate AMI ID for your use case
  instance_type = "t2.micro"

  security_groups = [aws_security_group.web.id]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "web" {
  name_prefix          = "web-asg-"
  launch_configuration = aws_launch_configuration.web.id
  min_size             = 1
  max_size             = 3
  desired_capacity     = 2
  vpc_zone_identifier  = module.vpc.public_subnets

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
