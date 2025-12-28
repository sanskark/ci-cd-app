# **Project Overview**

This project demonstrates a production-style CI/CD pipeline that automates the entire application delivery lifecycle using Jenkins, Docker, and AWS EC2.
***
Whenever a developer pushes code to GitHub, Jenkins automatically

1. Pulls the latest code
2. Builds a Docker image
3. Pushes the image to Docker Hub
4. Deploys the updated application as a Docker container on AWS EC2

The goal of his project is to showcase hands-on DevOps skills, including CI/CD automation, containerization, secure credential handling, and cloud deployment.
### **CI/CD Flow**
1. Code Commit
   * Developer pushes code to a public GitHub repository.
2. Webhook Trigger
   * GitHub webhook notifies Jenkins on every push.
3. Source Checkout
   * Jenkins clones the latest code from GitHub.
4. Docker Authentication
   * Jenkins logs in to Docker Hub using stored credentials.
5. Docker Image Build
   * Application is containerized using a Dockerfile.
6. Docker Image Push
   * Built image is pushed to Docker Hub with a unique build tag.
7. Deployment
   * Jenkins runs a deployment script that stops the old container
   * Starts a new container with the latest image
8. Application Availability
   * Application is accessible via EC2 public IP on port 5000.

### **Tech Framework**

| Category             | Tools        |
| -------------------- | ------------ |
| CI/CD                | Jenkins      |
| Source Control       | GitHub       |
| Containerization     | Docker       |
| Cloud Platform       | AWS EC2      |
| OS                   | Amazon Linux |
| Programming Language | Python       |
| Web Framework        | Flask        |
| Container Registry   | Docker Hub   |
