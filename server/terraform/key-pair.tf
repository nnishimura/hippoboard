resource "aws_key_pair" "menta" {
  key_name   = "menta-key"
  public_key = file(var.public_key_path)
}
