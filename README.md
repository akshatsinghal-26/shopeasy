# 🛒 ShopEase — Production-Grade E-Commerce Platform on AWS

> A fully automated, cloud-native e-commerce platform built to demonstrate
> real-world DevOps engineering practices on AWS.

![AWS](https://img.shields.io/badge/AWS-FF9900?style=flat&logo=amazonaws&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=flat&logo=terraform&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=flat&logo=kubernetes&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat&logo=docker&logoColor=white)
![Jenkins](https://img.shields.io/badge/Jenkins-D24939?style=flat&logo=jenkins&logoColor=white)

---

## 📐 Architecture

\`\`\`
                          ┌─────────────────────────────────────┐
                          │             AWS Cloud                │
                          │                                      │
Internet ──► Route53 ──► ALB (Public Subnet)                    │
                          │                                      │
                          ▼                                      │
                 ┌────────────────┐                             │
                 │  EKS Cluster   │  (Private Subnet)           │
                 │                │                             │
                 │ ┌────────────┐ │                             │
                 │ │user-service│ │                             │
                 │ └────────────┘ │                             │
                 │ ┌─────────────┐│                             │
                 │ │order-service││                             │
                 │ └─────────────┘│                             │
                 │ ┌──────────────┤                             │
                 │ │inventory-svc │                             │
                 │ └──────────────┤                             │
                 └───────┬────────┘                             │
                         │                                      │
                         ▼                                      │
                 ┌───────────────┐                              │
                 │  RDS MySQL    │  (Isolated Private Subnet)   │
                 └───────────────┘                              │
                         │                                      │
                 NAT Gateway ──► Internet (outbound only)       │
                          └─────────────────────────────────────┘
\`\`\`

---

## 🧰 Tech Stack

| Category | Technology | Purpose |
|---|---|---|
| ☁️ Cloud | AWS (Free Tier) | Infrastructure hosting |
| 🏗️ IaC | Terraform | Infrastructure as Code |
| 🐳 Containers | Docker + Amazon ECR | Containerization + Registry |
| ☸️ Orchestration | Amazon EKS v1.31 | Kubernetes cluster |
| 🔁 CI/CD | Jenkins on EC2 | Automated pipelines |
| 🗄️ Database | Amazon RDS MySQL 8.0 | Managed database |
| 📊 Monitoring | CloudWatch + Prometheus + Grafana | Observability |
| 📁 Source Control | GitHub (Mono-repo) | Version control |

---

## 🚀 Project Phases

| Phase | Description | Status |
|---|---|---|
| 1 | Git Repository Setup | ✅ Complete |
| 2 | Dockerize Microservices + ECR | ✅ Complete |
| 3 | AWS VPC via Terraform | ✅ Complete |
| 4 | EKS Cluster via Terraform | ✅ Complete |
| 5 | RDS MySQL via Terraform | ✅ Complete |
| 6 | Kubernetes Manifests | ✅ Complete |
| 7 | Jenkins CI/CD Pipeline | 🔄 In Progress |
| 8 | Monitoring Stack | ⏳ Pending |

---

## 📁 Repository Structure

\`\`\`
shopease/
├── services/                    # Microservice source code
│   ├── user-service/            # User management service (port 3001)
│   ├── order-service/           # Order processing service (port 3002)
│   ├── inventory-service/       # Inventory tracking service (port 3003)
│   └── mysql-init/              # RDS schema + seed data
├── infra/                       # Terraform infrastructure code
│   ├── vpc/                     # VPC, Subnets, IGW, NAT, Route Tables, SGs, NACLs
│   ├── eks/                     # EKS Cluster + Node Groups + IAM + ALB Controller
│   ├── rds/                     # RDS MySQL + Subnet Groups + Secrets Manager
│   └── jenkins/                 # Jenkins EC2 instance (Phase 7)
├── k8s/                         # Kubernetes manifests
│   ├── namespace.yaml           # shopease namespace
│   ├── configmap.yaml           # Non-sensitive config
│   ├── secret.yaml.example      # Secret template (actual secret gitignored)
│   ├── ingress.yaml             # ALB Ingress with path-based routing
│   ├── user-service/            # Deployment, Service, HPA
│   ├── order-service/           # Deployment, Service, HPA
│   └── inventory-service/       # Deployment, Service, HPA
├── jenkins/                     # Jenkinsfile pipelines (Phase 7)
├── CONTRIBUTING.md              # Branching + contribution guide
├── SECURITY.md                  # Security policy
└── README.md
\`\`\`

---

## 🔬 Microservices

| Service | Port | Endpoints | Description |
|---|---|---|---|
| user-service | 3001 | GET /health, GET /api/users | User management |
| order-service | 3002 | GET /health, GET /api/orders | Order processing |
| inventory-service | 3003 | GET /health, GET /api/inventory | Inventory tracking |

---

## ☸️ Kubernetes Resources

| Resource | Name | Purpose |
|---|---|---|
| Namespace | shopease | Resource isolation |
| ConfigMap | shopease-config | DB host, port, name |
| Secret | shopease-secrets | DB credentials |
| Deployment | user/order/inventory-service | 2 replicas each |
| Service | user/order/inventory-service | ClusterIP internal routing |
| Ingress | shopease-ingress | ALB path-based routing |
| HPA | per service | Auto-scale 2-5 pods at 70% CPU |

---

## 🏗️ Infrastructure

| Resource | Details |
|---|---|
| VPC | 10.0.0.0/16, ap-south-1 |
| Public Subnets | 10.0.1.0/24, 10.0.2.0/24 (ALB) |
| Private Subnets | 10.0.3.0/24, 10.0.4.0/24 (EKS) |
| Isolated Subnets | 10.0.5.0/24, 10.0.6.0/24 (RDS) |
| EKS | v1.31, t3.medium nodes |
| RDS | MySQL 8.0, db.t3.micro |

---

## 🔐 Branching Strategy

\`\`\`
main        → Production-ready (protected)
develop     → Integration branch (default, protected)
feature/*   → All development work
hotfix/*    → Emergency production fixes
\`\`\`

---

## ⚙️ Local Development

\`\`\`bash
# Clone the repo
git clone https://github.com/<your-username>/shopease.git
cd shopease

# Run all services locally with Docker Compose
docker compose up --build

# Test endpoints
curl http://localhost:3001/health
curl http://localhost:3002/health
curl http://localhost:3003/health
\`\`\`

---

## 👤 Author

Built as a hands-on DevOps portfolio project.
Demonstrates: AWS, Terraform, Docker, Kubernetes, Jenkins, and Monitoring.

