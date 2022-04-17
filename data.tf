data "terraform_remote_state" "DevOps" {
  backend = "s3"

  config = {
    bucket = "ryudevopsbucket"
    key    = "DevOps_key.tfstate"
    region = "ap-northeast-2"
  }
}

data "aws_key_pair" "my_key" {
  key_name = "RYU_KEY"
}

data "aws_ami_ids" "ubuntu" {
  owners = ["099720109477"]

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