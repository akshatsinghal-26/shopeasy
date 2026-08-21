resource "aws_iam_role" "jenkins_role" {
  name = "${var.project_name}-jenkins-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
    }]
  })

  tags = {
    Name        = "${var.project_name}-jenkins-role"
    Environment = var.environment
  }
}

# ECR push/pull for build stage
resource "aws_iam_role_policy_attachment" "ecr_power_user" {
  role       = aws_iam_role.jenkins_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
}

# Read RDS credentials from Secrets Manager (for migrations/smoke tests)
resource "aws_iam_role_policy" "secrets_read" {
  name = "${var.project_name}-jenkins-secrets-read"
  role = aws_iam_role.jenkins_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["secretsmanager:GetSecretValue"]
      Resource = "arn:aws:secretsmanager:${var.aws_region}:*:secret:shopease/rds/credentials-*"
    }]
  })
}

# Describe EKS cluster (needed for `aws eks update-kubeconfig`)
resource "aws_iam_role_policy" "eks_describe" {
  name = "${var.project_name}-jenkins-eks-describe"
  role = aws_iam_role.jenkins_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["eks:DescribeCluster", "eks:ListClusters"]
      Resource = "*"
    }]
  })
}

resource "aws_iam_instance_profile" "jenkins_profile" {
  name = "${var.project_name}-jenkins-profile"
  role = aws_iam_role.jenkins_role.name
}