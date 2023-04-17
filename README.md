# AWS Three Tier Architecture with Terraform

Still in development<br>

main.tf includes provider (aws), and credential profile. You will need to set your <br>
own credentials if using this code. <br>

network.tf has configuration of VPC, security groups and subnets <br>

compute.tf currently hold only an aoutscaling group for the web tier <br>

database.tf has configuration of RDS, set multi_az = true to enable. Currently false<br>