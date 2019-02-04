# Create the Security Group
resource "aws_security_group" "de_Security_Group" {
  vpc_id       = "${aws_vpc.main.id}"
  name         = "Simeio Office"
  description  = "Allowing simeio offices to access this VPC"
ingress {
    cidr_blocks = ["12.15.84.67/32","219.65.99.90/32","72.142.95.154/32","115.112.52.206/32"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
    egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.main_vpc_cidr}"]
    }
    egress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }

tags = {
        Name = "Simeio Office N/W"
  }
}

