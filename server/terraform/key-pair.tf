resource "aws_key_pair" "hippoboard" {
  key_name   = "hippoboard-key"
  public_key = file(var.public_key_path)
}
