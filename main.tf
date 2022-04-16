provider "aws" { 
    region = "ap-northeast-2"
}

resource "aws_instance" "test" {
  ami           = "ami-02de72c5dc79358c9"
  instance_type = "t3.micro"
#public ip와 연결
  associate_public_ip_address = true

#security 그룹 할당
  #security_groups = [ "${aws_security_group.test_security_group.id}" ]
  vpc_security_group_ids = [ "${aws_security_group.test_security_group.id}" ]
#key pair 할당
  key_name = "${data.aws_key_pair.my_key.key_name}"

#instance 이름
  tags = {
    Name = "RYU_TEST_INSTANCE"
  }
}

#security group 생성
resource "aws_security_group" "test_security_group" {

  ingress {
    from_port   = 0
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "test_ssh"
  }
}