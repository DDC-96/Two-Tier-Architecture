resource "aws_key_pair" "productionkey" {
  key_name   = "productionkey"
  public_key = file(var.pub_key_path)
}