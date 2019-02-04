resource "aws_key_pair" "devkey" {
  key_name = "devserverKey"
  public_key = "${file(var.public_key_path)}"
}

resource "aws_instance" "Dev01" {
  ami           = "${var.instance_ami}"
  instance_type = "${var.instance_type}"
  subnet_id = "${aws_subnet.subnet1.id}"
  vpc_security_group_ids = ["${aws_security_group.dev_sg.id}"]
  key_name = "${aws_key_pair.devkey.key_name}"
 tags {
  Name = "Dev01"
  "Environment" = "${var.environment_tag}"
 }
}

#resource "aws_eip" "jumpbox" {
#    instance = "${aws_instance.testInstance.id}"
#    vpc = true
#}
