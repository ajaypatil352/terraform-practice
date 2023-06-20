resource "aws_route53_zone" "route53_zone" {
  name = "aws_route53.com"  
}

resource "aws_route53_record" "route53_record" {
  zone_id = aws_route53_zone.route53_zone.zone_id
  name    = "www.route53.com"  
  type    = "A"
  ttl     = 300

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


