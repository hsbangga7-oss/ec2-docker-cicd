# DevOps EC2 Docker Deployment

A production-style DevOps deployment demonstrating containerization, reverse proxy configuration, CI/CD automation, and monitoring.

---

## 🚀 Tech Stack

* AWS EC2
* Docker
* Nginx
* GitHub Actions
* Prometheus
* Grafana

---

## 🏗 Architecture

Internet
│
▼
Nginx Reverse Proxy
│
▼
Docker Container (Application)
│
▼
Monitoring Stack

Prometheus → Grafana

---

## ⚙️ Features

* Containerized application deployment
* Reverse proxy using Nginx
* Automated CI/CD pipeline with GitHub Actions
* Infrastructure hosted on AWS EC2
* Monitoring with Prometheus and Grafana
* Container metrics using cAdvisor and Node Exporter

---

## 📦 Project Structure

```
devops-ec2-docker-deployment/
│
├── app/                    # Application source code
├── docker/                 # Docker configuration
│   ├── Dockerfile
│   └── docker-compose.yml
│
├── nginx/                  # Reverse proxy configuration
│   └── nginx.conf
│
├── monitoring/             # Monitoring stack
│   ├── prometheus.yml
│   └── docker-compose.yml
│
├── .github/
│   └── workflows/
│       └── deploy.yml      # CI/CD pipeline
│
├── docs/                   # Documentation
│   └── architecture.md
│
├── .gitignore
└── README.md
```

---

## 🔄 CI/CD Pipeline

1. Developer pushes code to GitHub
2. GitHub Actions workflow triggers
3. Docker image is built
4. Deployment executed on EC2 server
5. Containers restarted automatically

---

## 📊 Monitoring

The monitoring stack includes:

* Prometheus for metrics collection
* Grafana for dashboards
* cAdvisor for container metrics
* Node Exporter for system metrics

---

## 🖥 Deployment

Clone the repository:

```
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git
```

Run containers:

```
docker compose up -d
```

---

## 📌 Future Improvements

* Infrastructure as Code using Terraform
* Log monitoring with ELK stack
* Kubernetes deployment

---

## 👨‍💻 Author

DevOps learning project demonstrating cloud deployment, CI/CD automation, and monitoring.
