# 📦 Project 2: DevSecOps Container Scan Pipeline (POC)

## 📘 Overview

This project is part of a 10-project DevSecOps blueprint designed to help organisations adopt secure, scalable, and auditable CI/CD practices in Azure. Each project builds on the previous one, progressively enabling secretless authentication, security enforcement, runtime governance, and enterprise-grade automation.

This Proof of Concept (POC) demonstrates how to enforce container and Infrastructure as Code (IaC) security gates in a CI/CD pipeline before publishing images to Azure Container Registry (ACR). It builds directly on Project 1 by using OpenID Connect (OIDC) for secretless authentication and introduces automated scanning, policy validation, and evidence capture.

---

## ❗ Problem Statement

Many pipelines push unscanned or misconfigured containers into production, leading to:

- Vulnerabilities in deployed workloads  
- Misconfigured infrastructure due to unchecked IaC  
- Manual security reviews that slow down delivery  

This project introduces automated security gates and artefact capture to enforce compliance before deployment.

---

## 🎯 Goals

- Enforce container and IaC security gates in CI/CD  
- Implement secretless authentication using OIDC  
- Capture SBOM, SARIF, and scan logs as evidence  
- Push only compliant images to ACR  

---

## 🧩 Key Components

| Component               | Description                                                                 |
|------------------------|-----------------------------------------------------------------------------|
| GitHub Actions          | CI/CD engine for build, scan, and push                                      |
| Trivy                   | Container vulnerability scanner (filesystem + image)                        |
| Checkov                | IaC policy scanner for Terraform                                             |
| TFLint                 | Terraform linter for syntax and style                                        |
| Azure Container Registry| Secure image registry with Admin disabled                                   |
| Terraform              | Used for ACR provisioning and validation                                     |
| OIDC Federation        | Secretless authentication from GitHub to Azure                               |

---

## ⚙️ Implementation Steps

### 1. Repository & Workflow Setup
- Create GitHub repository and define `.github/workflows/container-scan.yml`  
- Enable OIDC federation with Azure AD  
- Configure branch protection and required status checks  

### 2. Azure Resource Provisioning
- Deploy ACR via Terraform (Admin disabled, private access)  
- Assign least-privilege role to GitHub federated identity  

### 3. Container Build & Scan
- Add Dockerfile for sample application  
- Build image using Docker in GitHub Actions  
- Scan filesystem and image with Trivy  
- Generate SBOM (CycloneDX or SPDX) and SARIF report  

### 4. IaC Validation
- Run `terraform init`, `validate`, and `plan`  
- Execute TFLint and Checkov  
- Block pipeline on:  
  - Trivy CRITICAL/HIGH vulnerabilities  
  - Checkov HIGH/CRITICAL findings  
  - TFLint errors  

### 5. Evidence Capture
- Upload SBOM and SARIF to GitHub Security tab  
- Retain logs and artefacts for ≥14 days  
- Capture pipeline screenshots (fail → pass)  

### 6. Secure Image Deployment
- Authenticate to Azure via OIDC (no secrets)  
- Push compliant image to ACR  
- Confirm image digest and tag in registry  

---

## 🚀 Usage

Once configured:

- Developers push changes to the target branch  
- GitHub Actions triggers automatically  
- The pipeline builds, scans, and validates the image and IaC  
- Only compliant images are pushed to ACR  
- Security artefacts are retained for audit and compliance  

---

## 📋 Prerequisites

- Azure subscription with admin access  
- GitHub repository with admin permissions  
- Familiarity with GitHub Actions, Docker, and Terraform  

---

## ✅ Project Completion Checklist

| Area                        | Task                                                                                   | Status |
|-----------------------------|----------------------------------------------------------------------------------------|--------|
| 🔧 Repository Setup         | GitHub repository created and workflow file added under `.github/workflows/`         | ☐      |
| 🔐 OIDC Federation          | Azure AD App Registration configured with federated credential                        | ☐      |
|                             | GitHub Actions authenticated to Azure via OIDC (no secrets)                           | ☐      |
| ☁️ Azure Provisioning       | Azure Container Registry (ACR) deployed via Terraform                                 | ☐      |
|                             | ACR Admin user disabled and public access restricted                                  | ☐      |
|                             | Least-privilege role assigned to federated identity                                   | ☐      |
| 🐳 Container Pipeline       | Dockerfile added and image build step implemented                                     | ☐      |
|                             | Trivy scan executed on filesystem and image                                           | ☐      |
|                             | SBOM and SARIF artefacts generated                                                    | ☐      |
| 🌍 IaC Validation           | Terraform `init`, `validate`, and `plan` executed                                     | ☐      |
|                             | TFLint and Checkov scans completed                                                    | ☐      |
| 🔐 Security Gates           | Pipeline blocks on Trivy CRITICAL/HIGH findings                                       | ☐      |
|                             | Pipeline blocks on Checkov HIGH/CRITICAL findings                                     | ☐      |
|                             | Pipeline blocks on TFLint errors                                                      | ☐      |
| 📁 Evidence Capture         | SBOM and SARIF uploaded to GitHub Security tab                                        | ☐      |
|                             | Logs and artefacts retained for ≥14 days                                              | ☐      |
| 📦 Image Deployment         | Image pushed to ACR using OIDC authentication                                         | ☐      |
|                             | Image digest verified in ACR                                                          | ☐      |
| 📸 Documentation            | Pipeline screenshots captured (fail → pass)                                           | ☐      |
|                             | README finalised with architecture and flow diagram                                   | ☐      |

---

## 📈 Business Impact

- Enforces build-time security gates before deployment  
- Removes embedded secrets from CI/CD pipelines  
- Provides audit-ready evidence for compliance teams  
- Enables scalable DevSecOps adoption across environments  

---

## 📚 References

- [Trivy Documentation](https://aquasecurity.github.io/trivy/)  
- [Checkov Documentation](https://www.checkov.io/)  
- [TFLint Documentation](https://github.com/terraform-linters/tflint)  
- [Azure AD Workload Identity Federation](https://learn.microsoft.com/en-us/entra/identity-platform/workload-identity-federation)  
- [GitHub Actions: Azure Login](https://github.com/Azure/login)

---

## 📄 Licence

This project is licensed under the MIT Licence. You are free to use, modify, and distribute it in accordance with the licence terms.#
