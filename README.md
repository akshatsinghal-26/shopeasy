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
| ☸️ Orchestration | Amazon EKS | Kubernetes cluster |
| 🔁 CI/CD | Jenkins on EC2 | Automated pipelines |
| 🗄️ Database | Amazon RDS MySQL | Managed database |
| 📊 Monitoring | CloudWatch + Prometheus + Grafana | Observability |
| 📁 Source Control | GitHub (Mono-repo) | Version control |

---

## 🚀 Project Phases

| Phase | Description | Status |
|---|---|---|
| 1 | Git Repository Setup | ✅ Complete |
| 2 | Dockerize Microservices + ECR | 🔄 In Progress |
| 3 | AWS VPC via Terraform | ⏳ Pending |
| 4 | EKS Cluster via Terraform | ⏳ Pending |
| 5 | RDS MySQL via Terraform | ⏳ Pending |
| 6 | Kubernetes Manifests | ⏳ Pending |
| 7 | Jenkins CI/CD Pipeline | ⏳ Pending |
| 8 | Monitoring Stack | ⏳ Pending |

---

## 📁 Repository Structure

\`\`\`
shopease/
├── services/                    # Microservice source code
│   ├── user-service/            # User management service (port 3001)
│   ├── order-service/           # Order processing service (port 3002)
│   └── inventory-service/       # Inventory tracking service (port 3003)
├── infra/                       # Terraform infrastructure code
│   ├── vpc/                     # VPC, Subnets, IGW, NAT, Route Tables
│   ├── eks/                     # EKS Cluster + Node Groups + IAM
│   ├── rds/                     # RDS MySQL + Subnet Groups + Secrets
│   └── jenkins/                 # Jenkins EC2 instance
├── k8s/                         # Kubernetes manifests
│   ├── user-service/            # Deployments, Services, HPA
│   ├── order-service/
│   └── inventory-service/
├── jenkins/                     # Jenkinsfile pipelines
├── CONTRIBUTING.md              # Branching + contribution guide
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

# Always branch from develop
git checkout develop
git checkout -b feature/your-feature
\`\`\`

---

## 👤 Author

Built as a hands-on DevOps portfolio project.  
Demonstrates: AWS, Terraform, Docker, Kubernetes, Jenkins, and Monitoring.

