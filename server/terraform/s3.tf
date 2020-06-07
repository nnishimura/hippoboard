resource "aws_s3_bucket" "hippoboard" {
  bucket = var.app_name
  acl    = "public-read"
  website {
    index_document = "index.html"
  }
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowPublicReadAccess",
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "s3:GetObject"
      ],
      "Resource": [
        "arn:aws:s3:::${var.app_name}/*"
      ]
    }
  ]
}
POLICY
}
