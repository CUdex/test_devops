data "aws_key_pair" "my_key" {
  key_name = "RYU_KEY"
}

data "aws_ami" "ubuntu" {
  owners = ["099720109477"]
  
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/ubuntu-*-*-amd64-server-*"]
  }

  filter {
      name   = "virtualization-type"
      values = ["hvm"]
  }
}


# data "aws_key_pair" "example" {
#   key_name = "test"
#   filter {
#     name   = "tag:Component"
#     values = ["web"]
#   }
# }

# output "fingerprint" {
#   value = data.aws_key_pair.example.fingerprint
# }

# output "name" {
#   value = data.aws_key_pair.example.key_name
# }

# output "id" {
#   value = data.aws_key_pair.example.id
# }