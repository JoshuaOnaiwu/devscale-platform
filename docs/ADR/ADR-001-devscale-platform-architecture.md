# ADR-001: DevScale Platform Architecture

## Status

Accepted

## Context

The DevScale project was created to demonstrate a modern cloud-native DevOps platform architecture capable of provisioning infrastructure, deploying applications, enabling GitOps delivery, and providing observability.

The platform needed to:

* Provision Kubernetes infrastructure automatically
* Support GitOps-based application deployment
* Provide monitoring and observability
* Expose services through a public ingress endpoint
* Integrate CI pipelines for container image builds

## Decision

The following architecture was selected:

Infrastructure provisioning is handled using Terraform.

A Kubernetes cluster is deployed using Amazon Elastic Kubernetes Service (EKS).

GitOps delivery is implemented using Argo CD to synchronize Kubernetes manifests from Git repositories.

Application workloads are deployed using Kubernetes Deployments and Services.

Ingress routing is handled using the NGINX Ingress Controller.

Monitoring and observability are implemented using Prometheus and Grafana.

Continuous Integration pipelines are implemented using GitHub Actions to build Docker images and push them to Amazon Elastic Container Registry (ECR).

## Architecture Flow

Developer Push → GitHub
GitHub Actions → Build Docker Image
Docker Image → Amazon ECR
Argo CD → Sync Git repository
Kubernetes → Deploy workload
Ingress Controller → Public access

## Consequences

This architecture provides:

* Full Infrastructure as Code
* GitOps-based deployment
* Automated CI pipelines
* Scalable Kubernetes workloads
* Observability with metrics and dashboards

The platform closely resembles real-world production DevOps environments used in cloud-native organizations.

## Project Outcome

The DevScale platform successfully demonstrates an end-to-end cloud-native DevOps workflow including:

Infrastructure provisioning
CI pipeline automation
GitOps deployment
Kubernetes orchestration
Observability and monitoring
Public application exposure
