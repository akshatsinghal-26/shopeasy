# Security Policy

## Supported Branches

| Branch | Supported |
|---|---|
| main | ✅ Yes |
| develop | ✅ Yes |
| feature/* | ❌ No |

## Reporting a Vulnerability

If you discover a security vulnerability, please do NOT open a public GitHub issue.

Instead:
1. Email the maintainer directly
2. Include a description of the vulnerability
3. Include steps to reproduce
4. You will receive a response within 48 hours

## Security Practices in this Project

- No secrets or credentials are ever committed to this repo
- All sensitive values use AWS Secrets Manager or Kubernetes Secrets
- `.gitignore` blocks `.env` files and Terraform state files
- Branch protection prevents direct pushes to `main` and `develop`
