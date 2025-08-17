# 📦 Project 2: DevSecOps Container Scan Pipeline (POC)

## 🧭 Overview
This Proof of Concept (POC) demonstrates a **secure CI/CD pipeline** that enforces vulnerability scanning and policy validation before container images are published to Azure Container Registry (ACR).  

The pipeline integrates **Trivy**, **Checkov**, and **TFLint** into **GitHub Actions**, using **OIDC-based authentication** to Azure (no secrets).  

> Only safe, compliant images are allowed to reach ACR. Unsafe artifacts are blocked automatically, with evidence captured in GitHub Security and pipeline artifacts.

---

## 🚀 Objectives
* Enforce **security gates** for container and IaC validation.
* Implement **secretless authentication** (OIDC → Azure).
* Capture **evidence artifacts** (SBOM, SARIF, logs).
* Provide a minimal, reproducible POC flow.

---

## 🛠️ Toolchain
* **CI/CD:** GitHub Actions
* **Container Security:** Trivy
* **IaC Security:** Checkov
* **IaC Linting:** TFLint
* **Registry:** Azure Container Registry (ACR)
* **Infrastructure as Code:** Terraform (init/validate/plan only)

---

## 📝 POC Implementation Steps
1. **Repository & Pipeline Setup**
   * Configure GitHub Actions workflow
   * Enable OIDC federation with Azure
2. **Azure Resources**
   * Deploy Azure Container Registry (ACR)
   * Disable Admin user (OIDC only)
3. **Container Pipeline**
   * Build container image
   * Scan with Trivy (filesystem + image)
   * Generate SBOM and SARIF artifacts
4. **Terraform Validation**
   * Run `terraform init/validate/plan`
   * Run TFLint and Checkov
5. **Security Gates**
   * Block on HIGH/CRITICAL findings (Trivy, Checkov)
   * Block on TFLint errors
6. **Artifact Handling**
   * Upload SBOM and SARIF to GitHub Security tab
   * Retain logs and artifacts for ≥14 days
7. **Image Publish**
   * Authenticate via OIDC (no secrets)
   * Push only compliant images to ACR

---

## 🔐 Security Gates
* **Trivy:** Block on CRITICAL/HIGH findings
* **Checkov:** Block on HIGH/CRITICAL for Terraform
* **TFLint:** Block on lint errors
* **Branch protection:** PR required, status checks required
* **Auth:** OIDC → Azure only, no static secrets

---

## 📊 Evidence & Deliverables
* Pipeline run (failing → passing) screenshots
* SARIF alerts in GitHub Security tab
* SBOM artifact in workflow artifacts
* ACR repository showing clean image digest
* Logs & artifacts retained for ≥14 days

---

## 📈 Flow Diagram
```mermaid
flowchart TD
    A[Code Push / PR] --> B[GitHub Actions Workflow]
    B --> C[Build Container Image]
    C --> D[Trivy Scan (FS + Image)]
    B --> E[Terraform Validate + TFLint + Checkov]
    D -->|Pass| F[OIDC Login to Azure]
    E -->|Pass| F
    F --> G[Push to ACR]
    D -->|Fail| H[Pipeline Blocked]
    E -->|Fail| H
    G --> I[Evidence: SBOM + SARIF + Logs]
````

---

## ✅ Acceptance Checklist

| Step                         | Status |
| ---------------------------- | ------ |
| Repo & Workflow Setup        | ✅      |
| OIDC Federation              | ✅      |
| Container Image Build        | ✅      |
| Trivy Scan                   | ✅      |
| Terraform Init/Validate/Plan | ✅      |
| TFLint & Checkov             | ✅      |
| Security Gates Passed        | ✅      |
| SBOM & SARIF Uploaded        | ✅      |
| Image Pushed to ACR          | ✅      |

---

## 🧠 Lessons & Next Steps

* Security gates can be embedded early in the pipeline with minimal friction.
* Future Enhancements:

  * Image signing & attestation (Cosign + Key Vault)
  * Terraform remote state with immutability
  * AKS deployment with admission policies
  * Azure Policy enforcement at subscription level

---

## 📅 POC Timeline

* **Day 1:** Repo setup, OIDC federation, ACR deploy
* **Day 2:** Configure scans + fail thresholds, SARIF & SBOM
* **Day 3:** Run tests (fail → pass), capture evidence, finalize README

---

## 📊 Strategic Impact

* Demonstrates **DevSecOps integration** in CI/CD
* Enforces **cloud-native security** at build-time
* Implements **secure, secretless Azure integration**
* Showcases **architect thinking** in pipeline design

```
