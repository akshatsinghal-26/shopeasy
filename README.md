# ShopEase — Production-Grade E-Commerce Platform on AWS

> A resume-level DevOps project demonstrating real-world infrastructure and CI/CD practices.

## Architecture
Internet → ALB → EKS (Public Subnet) → 3 Microservices (Private Subnet) → RDS MySQL (Isolated Subnet)

## Tech Stack
| Category | Technology |
|---|---|
| Cloud | AWS (Free Tier) |
| IaC | Terraform |
| Containers | Docker + Amazon ECR |
| Orchestration | Amazon EKS (Kubernetes) |
| CI/CD | Jenkins on EC2 |
| Database | Amazon RDS MySQL |
| Monitoring | CloudWatch + Prometheus + Grafana |
| Source Control | GitHub (Mono-repo) |

## Project Phases
- [x] Phase 1 — Git Repository Setup
- [ ] Phase 2 — Dockerize Microservices + ECR
- [ ] Phase 3 — AWS VPC via Terraform
- [ ] Phase 4 — EKS Cluster via Terraform
- [ ] Phase 5 — RDS MySQL via Terraform
- [ ] Phase 6 — Kubernetes Manifests
- [ ] Phase 7 — Jenkins CI/CD Pipeline
- [ ] Phase 8 — Monitoring (CloudWatch + Prometheus + Grafana)

## Repository Structure
\`\`\`
shopease/
├── services/        # Microservice source code
├── infra/           # Terraform infrastructure code
├── k8s/             # Kubernetes manifests
├── jenkins/         # CI/CD pipeline definitions
└── README.md
\`\`\`

## Services
| Service | Port | Endpoints |
|---|---|---|
| user-service | 3001 | /health, /api/users |
| order-service | 3002 | /health, /api/orders |
| inventory-service | 3003 | /health, /api/inventory |
