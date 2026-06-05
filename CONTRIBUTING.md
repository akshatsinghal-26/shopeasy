# Contributing to ShopEase

## Branching Strategy (GitFlow)

\`\`\`
main          → Production-ready code only
develop       → Integration branch (default)
feature/*     → New features (branch from develop)
hotfix/*      → Emergency fixes (branch from main)
release/*     → Release preparation
\`\`\`

## Workflow

1. Always branch from \`develop\`
   \`\`\`
   git checkout develop
   git checkout -b feature/your-feature-name
   \`\`\`

2. Make your changes with clear commit messages
   \`\`\`
   git commit -m "feat: description of change"
   \`\`\`

3. Push and open a Pull Request to \`develop\`
   \`\`\`
   git push origin feature/your-feature-name
   \`\`\`

4. \`develop\` → \`main\` only via Release PR

## Commit Message Format (Conventional Commits)

| Prefix | Use for |
|---|---|
| feat: | New feature |
| fix: | Bug fix |
| infra: | Infrastructure changes |
| ci: | CI/CD changes |
| docs: | Documentation |
| chore: | Maintenance tasks |

## Branch Naming

| Type | Format | Example |
|---|---|---|
| Feature | feature/short-description | feature/docker-user-service |
| Infra | infra/short-description | infra/vpc-terraform |
| Fix | fix/short-description | fix/health-endpoint |
| Hotfix | hotfix/short-description | hotfix/rds-connection |
