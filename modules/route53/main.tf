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
     set_identifier  = weighted_routing_policy.value.set_identifier
      records         = weighted_routing_policy.value.records
    }
  }

  dynamic "failover_routing_policy" {
    for_each = var.routing_policy_type == "failover" ? [var.failover_routing_policy] : []

    content {
      type    = failover_routing_policy.value.type
     # set_identifier  = failover_routing_policy.value.set_identifier
      #records         = failover_routing_policy.value.records
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
  dynamic "alias" {
    for_each = var.routing_policy_type == "alias" ? [true] : []
    content {
      name                   = "example.com" # Replace with your target alias record name
      zone_id                = "ZONE_ID"     # Replace with your target zone ID
      evaluate_target_health = true          # Set to true if you want Route 53 to evaluate the health of the target record
    }
  }
  
ttl = 60
}
