# 🚀 Cloud-Native Application — Deployment & Monitoring on AWS EC2

A production-style DevOps project demonstrating containerised application deployment on AWS with full CI/CD automation and real-time infrastructure monitoring.

---

## 📌 What This Project Does

- Deploys a **Flask web application** inside Docker on AWS EC2
- Automates the entire **build → test → deploy** lifecycle using GitHub Actions
- Routes external traffic securely through **Nginx** as a reverse proxy
- Monitors infrastructure and container health in real time using **Prometheus + Grafana**
- Provisions all AWS infrastructure as code using **Terraform**

---

## 🏗️ Architecture

```
                        ┌─────────────────────────────────────────┐
                        │              AWS EC2 Instance           │
                        │                                         │
  Internet Traffic ────▶│  Nginx (Port 80)                        │
                        │      │                                  │
                        │      ▼                                  │
                        │  Flask App (Docker Container)           │
                        │                                         │
                        │  Prometheus (Port 9090) ◀── Node        │
                        │      │                      Exporter    │
                        │      │                  ◀── cAdvisor    │
                        │      ▼                                  │
                        │  Grafana Dashboard (Port 3000)          │
                        │                                         │
                        └─────────────────────────────────────────┘
                                        ▲
                              GitHub Actions CI/CD
                              (Auto-deploys on push)

Infrastructure provisioned by Terraform
```

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|-----------|
| Application | Python Flask |
| Containerisation | Docker, Docker Compose |
| Web Server | Nginx (reverse proxy) |
| CI/CD | GitHub Actions |
| Cloud | AWS EC2 (Ubuntu 22.04, t2.micro) |
| Infrastructure as Code | Terraform |
| Monitoring | Prometheus, Grafana |
| Metrics Collection | Node Exporter, cAdvisor |

---

## ⚡ CI/CD Pipeline

Every push to `main` branch triggers the following automated pipeline:

```
Push to main
     │
     ▼
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Build     │────▶│    Test     │────▶│   Deploy   │
│             │     │             │     │             │
│ Docker      │     │ Health      │     │ SSH into    │
│ image built │     │ check       │     │ EC2         │
│             │     │ passes      │     │ Pull latest │
└─────────────┘     └─────────────┘     │ image       │
                                        │ Restart     │
                                        │ containers  │
                                        └─────────────┘

Deployment time: ~3 minutes (down from ~25 minutes manual)
```

---

## 📊 Monitoring Dashboard

Real-time Grafana dashboard tracking 8 infrastructure metrics:

- CPU usage %
- Memory usage %
- Disk I/O
- Network traffic (inbound/outbound)
- Container CPU usage
- Container memory usage
- Container restart count
- System uptime

## 🏗️ Infrastructure as Code (Terraform)

All AWS infrastructure is defined as code — no manual console clicks required.

**What Terraform provisions:**
- EC2 instance (t2.micro, Ubuntu 22.04)
- Security group (ports 22, 80, 3000, 9090)
- Fully reproducible environment

```bash
# Deploy infrastructure
cd terraform
terraform init
terraform plan
terraform apply

# Destroy when done
terraform destroy
```

---

## 🚀 How To Run This Yourself

### Prerequisites
- AWS account (free tier works)
- Terraform installed
- Docker installed
- GitHub account

### Step 1 — Provision Infrastructure
```bash
git clone https://github.com/hsbangga7-oss/ec2-docker-cicd
cd ec2-docker-cicd/terraform

# Add your IP and key pair name in variables.tf
terraform init
terraform apply
```

### Step 2 — Configure GitHub Secrets
Add these secrets to your GitHub repository:

| Secret | Value |
|--------|-------|
| `EC2_HOST` | Your EC2 public IP |
| `EC2_USER` | `ubuntu` |
| `EC2_SSH_KEY` | Contents of your .pem file |

### Step 3 — Deploy
```bash
git push origin main
# GitHub Actions handles everything from here
```

### Step 4 — Access Services
| Service | URL |
|---------|-----|
| Flask App | `http://YOUR_EC2_IP` |
| Grafana | `http://YOUR_EC2_IP:3000` |
| Prometheus | `http://YOUR_EC2_IP:9090` |

---

## 📁 Project Structure

```
ec2-docker-cicd/
├── app/
│   ├── app.py              # Flask application
│   ├── requirements.txt    # Python dependencies
│   └── Dockerfile          # Container definition
├── nginx/
│   └── nginx.conf          # Reverse proxy config
├── monitoring/
│   └──prometheus.yml      # Scrape config
├── screenshots/           # Screenshots of working project
├── terraform/
│   ├── main.tf             # EC2 + security group
│   ├── variables.tf        # Config variables
│   └── outputs.tf          # IP and SSH command
├── docker-compose.yml      # All services together
├── .github/
│   └── workflows/
│       └── deploy.yml      # CI/CD pipeline
└── README.md
```

---

## 💡 What I Learned

**The hard parts:**
- Configuring Nginx as a reverse proxy to correctly route traffic to the Flask container took several attempts — port binding conflicts were the main issue
- GitHub Actions SSH into EC2 required careful handling of the PEM key as a secret — newlines in the key caused silent failures
- Prometheus scrape configs needed exact container names to discover targets correctly

**What this taught me:**
- How production CI/CD pipelines actually work end to end
- The difference between container networking on localhost vs EC2
- Why Infrastructure as Code matters — rebuilding the whole environment takes 2 minutes with Terraform vs hours manually
- How to think about monitoring proactively, not just after things break

---

## 🔜 Planned Improvements

- [ ] Add Kubernetes deployment with Minikube
- [ ] Add HTTPS with Let's Encrypt
- [ ] Add Grafana alerting (Slack notifications on high CPU)
- [ ] Add Terraform remote state with S3 backend
- [ ] Add automated testing stage to CI/CD pipeline

---

## 👤 Author

**Harshpreet Singh Bangga**
- GitHub: [@hsbangga7-oss](https://github.com/hsbangga7-oss)
- LinkedIn: [hsbangga7](https://www.linkedin.com/in/hsbangga7)
- Email: hsbangga7@gmail.com
- 📍 Delhi, India — Immediately available to join

---