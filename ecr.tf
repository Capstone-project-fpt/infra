resource "aws_ecr_repository" "backend_repository" {
  name = "backend-repo"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    name = "backend-repo"
  }
}

output "ecr_repo_url" {
  value = aws_ecr_repository.backend_repository.repository_url
}