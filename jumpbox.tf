resource "aws_key_pair" "ec2key" {
  key_name = "publicKey"
  public_key = "${file(var.public_key_path)}"
}

resource "aws_instance" "testInstance" {
  ami           = "${var.instance_ami}"
  instance_type = "${var.instance_type}"
  subnet_id = "${aws_subnet.subnet7.id}"
  vpc_security_group_ids = ["${aws_security_group.de_Security_Group.id}"]
  key_name = "${aws_key_pair.ec2key.key_name}"
 tags {
  Name = "DevJumpbox"
  "Environment" = "${var.environment_tag}"
 }
}

resource "aws_eip" "jumpbox" {
    instance = "${aws_instance.testInstance.id}"
    vpc = true
}
