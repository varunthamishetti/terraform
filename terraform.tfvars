instance_name       = "custom_gitlab"
availability_zone   = "ap-south-1"
blueprint_id        = "amazon_linux_2"
bundle_id           = "nano_1_0"
key_pair_name       = "some_key_name"
protocol    = "tcp"
public_port         = 80
pgp_key       = "keybase:keybaseusername"
tags = {
  foo = "bar"
}
public_key_path = "~/.ssh/id_rsa.pub"
bucket_name      = "mytestbucket"
bucket_bundle_id = "small_1_0"
certificate_name           = "test"
domain_name                = "testdomain.com"
subject_alternative_names  = ["www.testdomain.com"]
database_name             = "test"
master_database_name      = "testdatabasename"
master_password           = "testdatabasepassword"
master_username           = "test"
database_blueprint_id     = "mysql_8_0"
database_bundle_id        = "micro_1_0"
disk_name        = "test"
disk_size_in_gb  = 8
disk_path             = "/dev/xvdf"
entry_name  = "www"
entry_type  = "A"
entry_target = "127.0.0.1"
load_balancer_name = "test-load-balancer"
health_check_path  = "/"
instance_port      = "80"
load_balancer_tags = {
  foo = "bar"
}
redirection_enabled  = true

stickiness_cookie_duration     = 900
stickiness_enabled              = true
static_ip_name = "example"
attachment_instance_name = "test"
attachment_static_ip_name = "test"
certificate_lb_name = "test"



