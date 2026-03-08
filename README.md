# Production Deployment Demo

This project demonstrates a simple **production-style deployment setup** using cloud infrastructure, containerization, CI/CD, and monitoring tools.

## Features

* Application running on **Amazon EC2**
* **Nginx** used as a reverse proxy
* Application containerized using **Docker**
* **CI/CD pipeline** implemented with GitHub Actions
* Monitoring with **Prometheus**, **Grafana**, **Node Exporter**, and **cAdvisor**

## Architecture

```
GitHub → GitHub Actions (CI/CD) → EC2 Server → Nginx → Docker Container → Application
                                               ↓
                                     Prometheus + Grafana Monitoring
```

## Monitoring Stack

* **Prometheus** – collects metrics
* **Grafana** – visualizes metrics with dashboards
* **Node Exporter** – provides system metrics (CPU, memory, disk)
* **cAdvisor** – provides Docker container metrics

## Purpose

This project is mainly for demonstrating:

* Cloud deployment
* Reverse proxy configuration
* Containerized applications
* Automated CI/CD pipelines
* Infrastructure monitoring

## Tools Used

* Amazon EC2
* Docker
* Nginx
* GitHub Actions
* Prometheus
* Grafana
* Node Exporter
* cAdvisor
