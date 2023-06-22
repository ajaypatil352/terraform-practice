output "private_key" {
  description = "Private key of the key pair"
  value       = aws_key_pair.my_key_pair.private_key
}
