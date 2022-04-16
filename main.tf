provider "aws" { 
    region = "ap-northeast-2"
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
    Name = "perm_ssh"
  }
}

resource "aws_instance" "test" {

  ami           = "ami-0454bb2fefc7de534"
  instance_type = "t3.micro"
#public ip와 연결
  associate_public_ip_address = true

#security 그룹 할당
  #security_groups = [ "${aws_security_group.test_security_group.id}" ]
  vpc_security_group_ids = [ aws_security_group.test_security_group.id ]
#key pair 할당
  key_name = data.aws_key_pair.my_key.key_name
  
  subnet_id = aws_subnet.main.id

#instance 이름
  tags = var.tags_map
}

resource "aws_vpc" "main" {
  cidr_block = "172.30.0.0/16"

  tags = {
    Name = "RYU_VPC"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "172.30.1.0/24"

  tags = {
    Name = "RYU_SUBNET"
  }
}