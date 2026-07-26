# AWS-3tier-terraform

#AWS Three-Tier Architecture –Project (Increment and Decrement Counter application.)

```text

Internet
   |
   v
Application Load Balancer
   |
   v
Auto Scaling Group
   |
   +── EC2 Web Instance 1
   |
   +── EC2 Web Instance 2
   |
   v
RDS MySQL

```text


## Repository Structure

```text
aws-3tier-terraform/
│
├── README.md
├── .gitignore
│
├── architecture/
│   ├── aws-3tier-architecture.drawio
│   └── aws-3tier-architecture.png
│
├── screenshots/
│   ├── terraform-apply-success.png
│   ├── vpc.png
│   ├── subnets.png
│   ├── ec2-instances.png
│   ├── alb-targets-healthy.png
│   ├── rds-available.png
│   └── application.png
│
├── docs/
│   ├── technical-design.md
│   ├── architecture-decisions.md
│   ├── security-controls.md
│   └── operational-considerations.md
│
└── terraform/
    ├── provider.tf
    ├── variables.tf
    ├── VPC.tf
    ├── Subnets.tf
    ├── IGW.tf
    ├── sg.tf
    ├── rt.tf
    ├── ec2.tf
    ├── asg.tf
    ├── cloudwatch.tf
    ├── rdsdb.tf
    ├── lb.tf
    ├── data1.sh
    

```


#Deployment Instructions.

Prerequisites
terraform version
aws --version

Configure AWS credentials:

aws configure

#Verify:

aws sts get-caller-identity


#Deploy

terraform init
terraform validate
terraform plan
terraform apply

Enter:
Yes

Access Application.

After deployment:

terraform output

Copy:

lb_dns_name

Open:

#http://<ALB-DNS-NAME>

Destroy

terraform destroy
