# Create key pair
resource "aws_key_pair" "my_key_pair" {
  key_name   = "my-key-pair"  # Replace with your desired key pair name
  public_key = file("~/.ssh/id_rsa.pub")  # Replace with the path to your public key file
}



