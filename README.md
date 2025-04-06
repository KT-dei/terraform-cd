# Terraform Continuous Deployment (CD)

This repository contains a Terraform-based solution for automating infrastructure provisioning and deployment. It is designed to integrate seamlessly with CI/CD pipelines, enabling efficient and reliable infrastructure management.

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Usage](#usage)
- [Folder Structure](#folder-structure)
- [Contributing](#contributing)
- [License](#license)

## Overview
The `terraform-cd` project provides a framework for managing infrastructure as code (IaC) using Terraform. It supports modular configurations, environment isolation, and integration with popular CI/CD tools like GitHub Actions, Jenkins, and GitLab CI.

## Features
- **Modular Design**: Reusable Terraform modules for common infrastructure components.
- **Environment Isolation**: Separate configurations for development, staging, and production environments.
- **CI/CD Integration**: Automated deployment workflows for infrastructure changes.
- **State Management**: Remote state storage using bAzure Blob Storage.
- **Scalability**: Supports multi-cloud deployments and hybrid cloud setups.

## Prerequisites
- Terraform (v1.0 or later)
- A supported cloud provider account (e.g., Azure,)
- Access to a CI/CD platform (e.g., GitHub Actions)
- Azure CLI installed and authenticated:
    ```bash
    az login
    az account set --subscription "<SUBSCRIPTION_NAME_OR_ID>"
    az account show --output table
    ```

- Export required environment variables:
    ```bash
    export TF_VAR_subscription_id=$(az account show --query id -o tsv)
    export TF_VAR_tenant_id=$(az account show --query tenantId -o tsv)
    ```

## Setup
1. Clone the repository:
    ```bash
    git clone https://github.com/your-username/terraform-cd.git
    cd terraform-cd
    ```

2. Install Terraform:
    ```bash
    # For macOS
    brew install terraform

    # For other platforms, visit https://www.terraform.io/downloads
    ```

3. Configure backend for remote state:
    Update the `backend.tf` with your remote state details.

4. Initialize Terraform:
    ```bash
    terraform -chdir=azure/workflows/base init
    ```

5. Validate the configuration:
    ```bash
   terraform -chdir=azure/workflows/base validate
    ```

## Usage

1. Plan the infrastructure changes:
    ```bash
    terraform -chdir=azure/workflows/base plan -var="azure_subscription_id_global=$TF_VAR_subscription_id" 
    ```

2. Apply the changes:
    ```bash
    terraform -chdir=azure/workflows/base apply -auto-approve -var="azure_subscription_id_global=$TF_VAR_subscription_id"     
    ```

3. Destroy the infrastructure (if needed):
    ```bash
    terraform -chdir=azure/workflows/base destroy -auto-approve -var="azure_subscription_id_global=$TF_VAR_subscription_id"       
    ```

## Contributing
Contributions are welcome! Please follow these steps:
1. Fork the repository.
2. Create a feature branch.
3. Commit your changes.
4. Submit a pull request.

