resource "aws_route53_record" "nnishimura-web" {
  ## Reusing existing zone this time
  zone_id = var.zone_id
  name = "www.nnishimura.work"
  type = "A"
  ttl = "330"
  records = [aws_eip.eip-menta.public_ip]
}
