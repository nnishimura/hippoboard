resource "aws_route53_record" "hippoboard-web" {
  zone_id = var.zone_id
  name = "www.hippoboard.work"
  type = "A"

  alias {
    name = aws_s3_bucket.hippoboard.website_domain
    zone_id = aws_s3_bucket.hippoboard.hosted_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "hippoboard-api" {
  ## Reusing existing zone this time
  zone_id = var.zone_id
  name = "api.hippoboard.work"
  type = "A"

  alias {
    name                   = aws_elb.hippoboard-elb.dns_name
    zone_id                = aws_elb.hippoboard-elb.zone_id
    evaluate_target_health = true
  }
}
