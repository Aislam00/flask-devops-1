# Flask App on AWS with Terraform and Docker

This project demonstrates deploying a containerized Flask application to AWS EC2 using:

- **Terraform** for provisioning infrastructure
- **Docker** for containerization
- **AWS EC2** for hosting the app

## Quick Steps

- Build and push Docker image:
# Flask App on AWS with Terraform and Docker

This project demonstrates deploying a containerized Flask application to AWS EC2 using:

- **Terraform** for provisioning infrastructure
- **Docker** for containerization
- **AWS EC2** for hosting the app

## Quick Steps

- Build and push Docker image:
docker buildx build --platform linux/amd64 -t aislam00/my-flask-app:latest --push .

diff
Copy
Edit

- Deploy infrastructure:
cd terraform
terraform init
terraform apply

markdown
Copy
Edit

- Access the Flask app via EC2 Public IP on port 5000.

## Notes

- `.terraform` and sensitive files are excluded using `.gitignore`.
- SSH key: `alamin-devops-key.pem` (not included in the repo).

