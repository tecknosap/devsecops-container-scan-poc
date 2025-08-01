# Project 2: Scalable AKS Infrastructure with Terraform Modules

## Overview

This project mirrors infrastructure provisioning at scale within enterprise environments, using Terraform modules to deliver repeatable, secure AKS clusters across multiple environments.

## Business Problem Solved

Manual, inconsistent cluster deployments lead to configuration drift and security vulnerabilities. Enterprises demand modular, version-controlled infrastructure as code with state consistency.

## What You Will Build

- Modular Terraform code for VNet, AKS cluster, and supporting services.
- Remote backend for Terraform state with locking and versioning.
- Private AKS cluster with enforced network policies and NSGs.
- Integration with Azure Policy for compliance baseline enforcement.

## Enterprise Impact

- Guarantees consistent infrastructure deployments.
- Simplifies multi-environment scaling and maintenance.
- Enforces security and compliance through automation.

## Step-by-Step

1. Develop reusable Terraform modules following best practices.
2. Configure Terraform remote backend (e.g., Azure Storage Account).
3. Apply private networking and security configurations.
4. Execute Terraform plan and apply in dev, staging, and production.
5. Use Checkov to scan IaC for misconfigurations before deploy.

## Prerequisites

- Azure subscription
- Terraform and Azure CLI installed

## References

- [Terraform Azure Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Terraform State Management](https://www.terraform.io/language/state/remote)
- [Checkov IaC Security](https://www.checkov.io/)
