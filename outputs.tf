output "vpc_id" {
  value = aws_vpc.main.id
}

output "keyName" {
  value = data.aws_key_pair.my_key.key_name
}

output "instance_id" {
  value = aws_instance.test.id
}

output "subnet_id" {
  value = aws_subnet.main.id
}

output "security_group_id" {
  value = aws_security_group.test_security_group.id
}