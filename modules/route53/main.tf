resource "aws_route53_zone" "example" {
  name = var.domain_name
}

resource "aws_route53_record" "routing_policy" {
  zone_id = aws_route53_zone.example.zone_id
  name    = var.record_name
  type    = "A"

  dynamic "weighted_routing_policy" {
    for_each = var.routing_policy_type == "weighted" ? [var.weighted_routing_policy] : []

    content {
      weight = weighted_routing_policy.value.weight
    }
  }

  dynamic "failover_routing_policy" {
    for_each = var.routing_policy_type == "failover" ? [var.failover_routing_policy] : []

    content {
      type             = failover_routing_policy.value.failover_type
      #set_identifier   = failover_routing_policy.value.set_id
      #health_check_id  = failover_routing_policy.value.health_check
    }
  }

  dynamic "geolocation_routing_policy" {
    for_each = var.routing_policy_type == "geolocation" ? [var.geolocation_routing_policy] : []

    content {
      continent = "NA"
      country   = geolocation_routing_policy.value.country_code
    }
  }

  dynamic "latency_routing_policy" {
    for_each = var.routing_policy_type == "latency" ? [var.latency_routing_policy] : []

    content {
      region = latency_routing_policy.value.region
    }
  }

  ttl = 3
}
