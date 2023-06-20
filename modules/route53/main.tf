# Create a new Route 53 zone
resource "aws_route53_zone" "example_zone" {
  name = "example.com"  # Replace with your desired domain name
}

# Create an A record pointing to an EC2 instance
resource "aws_route53_record" "example_record" {
  zone_id = aws_route53_zone.example_zone.zone_id
  name    = "www.example.com"  # Replace with your desired record name
  type    = "A"
  ttl     = 300  # Replace with your desired TTL value

  records = [
    aws_instance.example_ec2_instance.public_ip  # Replace with the appropriate resource, e.g., an EC2 instance
  ]
}

# Create a CNAME record pointing to another domain
resource "aws_route53_record" "example_cname" {
  zone_id = aws_route53_zone.example_zone.zone_id
  name    = "blog.example.com"  # Replace with your desired record name
  type    = "CNAME"
  ttl     = 300  # Replace with your desired TTL value

  records = [
    "blog.anotherdomain.com"  # Replace with the target domain you want to point to
  ]
}

# Create an MX record for email routing
resource "aws_route53_record" "example_mx" {
  zone_id = aws_route53_zone.example_zone.zone_id
  name    = "example.com"  # Replace with your domain name
  type    = "MX"
  ttl     = 300  # Replace with your desired TTL value

  records = [
    "10 mail.example.com",  # Replace with the appropriate MX record value
  ]
}
