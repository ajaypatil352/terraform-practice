resource "aws_route53_zone" "route53_zone" {
  name = "aws_route53.com"  # Replace with your desired domain name
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


