provider "aws" { }

resource "aws_instance" "test" {
  ami           = "ami-02de72c5dc79358c9"
  instance_type = "t3.micro"
#public ip와 연결
  associate_public_ip_address = true

#security 그룹 할당
  security_groups = [ aws_security_group.test_security_group.id ]

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
    protocol    = "-1"
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