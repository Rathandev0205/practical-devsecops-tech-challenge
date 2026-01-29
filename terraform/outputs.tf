output "node_public_ips" {
  value = aws_instance.docker_nodes[*].public_ip
}

output "node_private_ips" {
  value = aws_instance.docker_nodes[*].private_ip
}