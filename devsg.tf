# Create the Security Group
resource "aws_security_group" "dev_sg" {
  vpc_id       = "${aws_vpc.main.id}"
  name         = "Dev Network"
  description  = "Allowing Dev network to access this"
ingress {
    cidr_blocks = ["10.0.0.0/16"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
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
        Name = "Dev N/W SG"
  }
}

