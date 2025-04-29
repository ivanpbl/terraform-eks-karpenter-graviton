# 🚀 EKS with Karpenter (x86 + Graviton Support)

This repository provides Terraform code to deploy an Amazon EKS cluster with [Karpenter](https://karpenter.sh), AWS's dynamic node autoscaler. The setup supports provisioning both x86 (`amd64`) and Graviton (`arm64`) EC2 instances, including Spot and On-Demand capacity types.

---

## 🛠️ What It Does

- Creates a new dedicated VPC with public/private subnets
- Deploys an EKS cluster (latest version)
- Installs and configures Karpenter for autoscaling
- Sets up two Karpenter provisioners:
  - x86 + Spot support
  - arm64 (Graviton) + Spot support

---

## 📦 Prerequisites

- Terraform ≥ 1.3
- AWS CLI configured (`aws configure`)
- `kubectl` and `helm` installed and in `$PATH`

---

## 🚀 How to Deploy

```bash
# Clone the repo
git clone https://github.com/your-org/eks-karpenter.git
cd eks-karpenter

# Initialize Terraform
terraform init

# Plan the infrastructure
terraform plan

# Apply the infrastructure
terraform apply

# Update kubeconfig
aws eks update-kubeconfig --region us-east-1 --name karpenter-demo

# To deploy a pod to EKS cluster x86 nodepool run the following command
kubectl apply -f ./pod-x86.yaml

# To deploy a pod to EKS cluster arm64 nodepool run the following command
kubectl apply -f ./pod-arm64.yaml
