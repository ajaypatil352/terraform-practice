output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.my_vpc.id
}

output "subnet_id" {
  description = "ID of the created subnet"
  value       = aws_subnet.my_subnet.id
}

output "route_table_id" {
  description = "ID of the created route table"
  value       = aws_route_table.my_route_table.id
}

output "internet_gateway_id" {
  description = "ID of the created internet gateway"
  value       = aws_internet_gateway.my_internet_gateway.id
}

output "route_table_association_id" {
  description = "ID of the created route table association"
  value       = aws_route_table_association.my_route_table_association.id
}
