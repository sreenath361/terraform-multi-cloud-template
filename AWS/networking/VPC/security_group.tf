# Create SG
resource "aws_security_group" "Bosch-Dev-SG" {
  name        = "Bosch_Dev_SG"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.Bosch-Dev.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    }
}
