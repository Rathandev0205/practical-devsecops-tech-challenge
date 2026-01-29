terraform {
  backend "s3" {
    bucket       = "devsecops-terraform-state-rathan"
    key          = "docker-swarm/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}