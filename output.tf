output "ecs_cluster_name" {
  value = aws_ecs_cluster.backend_ecs_cluster.name
}

output "ecs_service_name" {
  value = aws_ecs_service.backend_service.name
}

output "redis_instance_public_ip" {
  value = aws_instance.redis_instance.public_ip
}

output "ecr_repository_url" {
  value = aws_ecr_repository.backend_repository.repository_url
}
