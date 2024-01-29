resource "aws_lightsail_instance" "gitlab_test" {
  name              = var.instance_name
  availability_zone = var.availability_zone
  blueprint_id      = var.blueprint_id
  bundle_id         = var.bundle_id
  key_pair_name     = var.key_pair_name
  tags              = var.tags
}

resource "aws_lightsail_instance" "test" {
  name              = var.instance_name
  availability_zone = var.availability_zone
  blueprint_id      = var.blueprint_id
  bundle_id         = var.bundle_id
}

resource "aws_lightsail_instance_public_ports" "test_public_ports" {
  instance_name = aws_lightsail_instance.test.name

  port_info {
    protocol  = var.protocol
    from_port = var.public_port
    to_port   = var.public_port
  }
}

resource "aws_lightsail_key_pair" "lg_key_pair" {
  name = var.key_pair_name
}

# Create a Lightsail bucket
resource "aws_lightsail_bucket" "test" {
  name      = var.bucket_name
  bundle_id = var.bucket_bundle_id
}

# Create a Lightsail bucket access key
resource "aws_lightsail_bucket_access_key" "test" {
  bucket_name = aws_lightsail_bucket.test.name
}

# Grant access to the Lightsail bucket for the Lightsail instance
resource "aws_lightsail_bucket_resource_access" "test" {
  bucket_name   = aws_lightsail_bucket.test.name
  resource_name = aws_lightsail_instance.test.id
}

# Create a Lightsail certificate
resource "aws_lightsail_certificate" "test" {
  name                      = var.certificate_name
  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names
}

# Create a Lightsail database Basic mysql blueprint
resource "aws_lightsail_database" "test" {
  relational_database_name = var.database_name
  availability_zone        = var.availability_zone
  master_database_name     = var.master_database_name
  master_password          = var.master_password
  master_username          = var.master_username
  blueprint_id             = var.database_blueprint_id
  bundle_id                = var.database_bundle_id
}

# Create a Lightsail disk
resource "aws_lightsail_disk" "test" {
  name              = var.disk_name
  size_in_gb        = var.disk_size_in_gb
  availability_zone = data.aws_availability_zones.available.names[0]
}
# main.tf

# Attach the Lightsail disk to the instance
resource "aws_lightsail_disk_attachment" "test" {
  disk_name     = aws_lightsail_disk.test.name
  instance_name = aws_lightsail_instance.test.name
  disk_path     = var.disk_path
}

# Create a Lightsail domain
resource "aws_lightsail_domain" "domain_test" {
  domain_name = var.domain_name
}

# Create a Lightsail domain entry
resource "aws_lightsail_domain_entry" "test" {
  domain_name = aws_lightsail_domain.domain_test.domain_name
  name        = var.entry_name
  type        = var.entry_type
  target      = var.entry_target
}

# Attach the Lightsail instance to the load balancer
resource "aws_lightsail_lb_attachment" "test" {
  lb_name       = aws_lightsail_lb.test.name
  instance_name = aws_lightsail_instance.test.name
}

resource "aws_lightsail_lb" "test" {
  name              = var.load_balancer_name
  health_check_path = var.health_check_path
  instance_port     = var.instance_port
  tags              = var.lb_tags
}

resource "aws_lightsail_lb_certificate" "test" {
  name        = "test-load-balancer-certificate"
  lb_name     = aws_lightsail_lb.test.id
  domain_name = "test.com"
}

# Attach the Lightsail load balancer certificate to the load balancer
resource "aws_lightsail_lb_certificate_attachment" "test" {
  lb_name          = aws_lightsail_lb.test.name
  certificate_name = aws_lightsail_lb_certificate.test.name
}

#Create a Lightsail load balancer HTTPS redirection policy
resource "aws_lightsail_lb_https_redirection_policy" "test" {
  lb_name = aws_lightsail_lb.test.name
  enabled = var.redirection_enabled
}

# Create a Lightsail load balancer stickiness policy
resource "aws_lightsail_lb_stickiness_policy" "test" {
  lb_name         = aws_lightsail_lb.test.name
  cookie_duration = var.stickiness_cookie_duration
  enabled         = var.stickiness_enabled
}

# Create a Lightsail static IP
resource "aws_lightsail_static_ip" "test" {
  name = var.static_ip_name
}

# Attach the Lightsail static IP to the Lightsail instance
resource "aws_lightsail_static_ip_attachment" "test" {
  static_ip_name = var.attachment_static_ip_name
  instance_name  = var.attachment_instance_name
}
