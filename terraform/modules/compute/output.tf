output "aws_key_pair" {
  value = data.aws_key_pair.default_test_keypair.key_name
}
