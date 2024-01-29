# variables.tf

variable "instance_name" {
  description = "The name of the Lightsail instance"
  type        = string
  default     = "custom_gitlab"
}

variable "availability_zone" {
  description = "The availability zone for the Lightsail instance"
  type        = string
  default     = "us-east-1b"
}

variable "blueprint_id" {
  description = "The blueprint ID for the Lightsail instance"
  type        = string
  default     = "amazon_linux_2"
}

variable "bundle_id" {
  description = "The bundle ID for the Lightsail instance"
  type        = string
  default     = "nano_1_0"
}

variable "key_pair_name" {
  description = "The key pair name for the Lightsail instance"
  type        = string
  default     = "some_key_name"
}

variable "tags" {
  description = "Tags for the Lightsail instance"
  type        = map(string)
  default     = {
    foo = "bar"
  }
}

variable "protocol" {
  description = "The protocol for the port_info"
  type        = string
  default     = "tcp"  # You can set your default protocol here
}

variable "public_port" {
  description = "Public port for the Lightsail instance"
  default     = 80
}

variable "pgp_key" {
  description = "The PGP key for the Lightsail key pair"
  type        = string
  default     = "keybase:keybaseusername"
}

variable "public_key_path" {
  description = "The path to the public key file for the Lightsail key pair"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "bucket_bundle_id" {
  description = "The bundle ID for the Lightsail bucket"
  type        = string
  default     = "small_1_0"
}

# Define variables for Lightsail bucket creation
variable "bucket_name" {
  description = "The name of the Lightsail bucket"
  type        = string
  default     = "mytestbucket"
}

# Define variables for Lightsail certificate creation
variable "certificate_name" {
  description = "The name of the Lightsail certificate"
  type        = string
  default     = "test"
}

variable "domain_name" {
  description = "The domain name for the Lightsail certificate"
  type        = string
  default     = "testdomain.com"
}

variable "subject_alternative_names" {
  description = "The subject alternative names for the Lightsail certificate"
  type        = list(string)
  default     = ["www.testdomain.com"]
}

# Define variables for Lightsail database creation
variable "database_name" {
  description = "The name of the Lightsail database"
  type        = string
  default     = "test"
}

variable "master_database_name" {
  description = "The master database name for the Lightsail database"
  type        = string
  default     = "testdatabasename"
}

variable "master_password" {
  description = "The master password for the Lightsail database"
  type        = string
  default     = "testdatabasepassword"
}

variable "master_username" {
  description = "The master username for the Lightsail database"
  type        = string
  default     = "test"
}

variable "database_blueprint_id" {
  description = "The blueprint ID for the Lightsail database"
  type        = string
  default     = "mysql_8_0"
}

variable "database_bundle_id" {
  description = "The bundle ID for the Lightsail database"
  type        = string
  default     = "micro_1_0"
}

# Define variables for Lightsail disk creation
variable "disk_name" {
  description = "The name of the Lightsail disk"
  type        = string
  default     = "test"
}

variable "disk_size_in_gb" {
  description = "The size of the Lightsail disk in gigabytes"
  type        = number
  default     = 8
}

variable "disk_path" {
  description = "The path for attaching the Lightsail disk to the instance"
  type        = string
  default     = "/dev/xvdf"
}

# Define variables for Lightsail domain entry
variable "entry_name" {
  description = "The name of the Lightsail domain entry"
  type        = string
  default     = "www"
}

variable "entry_type" {
  description = "The type of the Lightsail domain entry"
  type        = string
  default     = "A"
}

variable "entry_target" {
  description = "The target IP address or value for the Lightsail domain entry"
  type        = string
  default     = "127.0.0.1"
}

# variables.tf

# Define variables for Lightsail load balancer creation
variable "load_balancer_name" {
  description = "The name of the Lightsail load balancer"
  type        = string
  default     = "test-load-balancer"
}

variable "health_check_path" {
  description = "The health check path for the Lightsail load balancer"
  type        = string
  default     = "/"
}

variable "instance_port" {
  description = "The port on the instances to route traffic from the Lightsail load balancer"
  type        = string
  default     = "80"
}

variable "load_balancer_tags" {
  description = "Tags for the Lightsail load balancer"
  type        = map(string)
  default     = {
    foo = "bar"
  }
}

variable "certificate_lb_name" {
  description = "The name of the Lightsail load balancer for the certificate"
  type        = string
  #default     = aws_lightsail_lb.test.id
}

# Define variables for Lightsail load balancer HTTPS redirection policy


variable "redirection_enabled" {
  description = "Whether HTTPS redirection policy is enabled"
  type        = bool
  default     = true
}

# Define variables for Lightsail load balancer stickiness policy


variable "stickiness_cookie_duration" {
  description = "The duration of stickiness for the Lightsail load balancer in seconds"
  type        = number
  default     = 900
}

variable "stickiness_enabled" {
  description = "Whether stickiness policy is enabled for the Lightsail load balancer"
  type        = bool
  default     = true
}

# Define variables for Lightsail static IP creation
variable "static_ip_name" {
  description = "The name of the Lightsail static IP"
  type        = string
  default     = "example"
}

variable "attachment_instance_name" {
  description = "The name of the Lightsail instance for attachment"
  type        = string
  #default     = aws_lightsail_instance.test.id
}

# Define variables for Lightsail static IP attachment
variable "attachment_static_ip_name" {
  description = "The name of the Lightsail static IP for attachment"
  type        = string
  #default     = aws_lightsail_static_ip.test.id
}

variable "lb_tags" {
  description = "Tags for the Lightsail Load Balancer"
  default     = {
    foo = "bar"
  }
}