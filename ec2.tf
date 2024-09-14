resource "aws_security_group" "redis_sg" {
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "redis-sg"
  }
}

resource "aws_instance" "redis_instance" {
  ami = "ami-04a5ce820a419d6da"
  instance_type = "t2.micro"
  key_name = "capstone-redis-keypair"
  vpc_security_group_ids = [aws_security_group.redis_sg.id]
  subnet_id = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  tags = {
    Name = "redis"
  }
}