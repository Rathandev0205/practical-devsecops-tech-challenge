# practical-devsecops-tech-challenge

Access the website using below url
http://practical_devsecops_demo.rathandevops.site/

Architecture of this project

![image alt](https://github.com/Rathandev0205/practical-devsecops-tech-challenge/blob/master/diagram-export-29-01-2026-19_37_29.png?raw=true)

## What This Project Demonstrates
	•	End-to-end infrastructure provisioning using Terraform
	•	Secure and practical access patterns using IAM and SSM
	•	Real multi-node container orchestration with Docker Swarm
	•	Overlay networking and cross-node service communication
	•	DNS-based service discovery using Consul
	•	Production-oriented security and networking decisions
	•	Hands-on debugging across infrastructure, networking, and containers


## Design Decisions and Best Practices

This project was approached as a real-world environment rather than a demo setup. The focus was on building something functional, secure, and debuggable instead of just making it work once.

### Infrastructure as Code

All infrastructure components were provisioned using Terraform, including networking, EC2 instances, security groups, and IAM roles. No resources were created manually in the AWS console after the initial setup. This ensures repeatability and avoids configuration drift.

### Terraform State Management

Terraform state is stored remotely in an S3 bucket with encryption enabled. Native state locking is used to prevent concurrent modifications and state corruption. This mirrors how Terraform is typically used in shared or team environments.

### Secure Access to EC2

Direct SSH access is not required for day-to-day operations. Instances are accessed using AWS SSM Session Manager with an IAM role attached to the EC2 instances. This avoids exposing SSH broadly and removes the need for key distribution.

### Docker Host Security

The Docker daemon is not left exposed over an unsecured TCP socket. TLS-based communication is configured for the Docker API, and certificates are generated per node. This prevents unauthorized access to the Docker daemon and aligns with Docker security recommendations.

### Container Orchestration

Docker Swarm is used to manage a multi-node setup with clear manager and worker roles. Services are deployed using Swarm primitives instead of standalone containers to better reflect a clustered environment.

### Overlay Networking

An overlay network is used to allow containers running on different nodes to communicate with each other. Containers do not rely on host networking or static IPs, and all cross-node communication happens through the Swarm network layer.

### Service Discovery

Consul is deployed as a Swarm service and used for internal service discovery. Containers communicate using service names rather than IP addresses. This removes hard dependencies on network addressing and makes the setup more flexible.

### Ingress and Exposure

External traffic is routed through Docker Swarm’s ingress mechanism. Only required ports are exposed at the AWS security group level, and services are explicitly published through Swarm. There is a clear separation between infrastructure-level access and application-level exposure.

### DNS and Public Validation

A self-managed domain is configured with an A record pointing to the Swarm ingress endpoint. This provides a simple way to validate that the system is reachable end-to-end without requiring access to the internal infrastructure.


## Validation and Evidence

Command outputs validating the setup (Swarm nodes, overlay networking, service communication, and ingress access) are included in the evidence/ directory. These are raw outputs captured during implementation.
