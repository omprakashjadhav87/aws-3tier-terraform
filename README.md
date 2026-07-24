# aws-3tier-terraform
AWS Three-Tier Architecture –Project (Increment and Decrement Counter application.)


aws-3tier-architecture/
│
├── README.md
├── architecture/
│   └── aws-3tier-architecture.drawio
│
├── docs/
│   ├── technical-design.md
│   ├── architecture-decisions.md
│   ├── security-controls.md
│   └── operational-considerations.md
│
├── terraform/
│   ├── provider.tf
│   ├── variables.tf
│   |___IGW.tf
│   ├── VPC.tf
│   ├── Subnets.tf
│   ├── sg.tf
│   ├── rt.tf
│   ├── ec2.tf
│   ├── rdsdb.tf
│   ├── ld.tf
│   ├── data1.sh
│   ├── data2.sh
│   \ __ ec2.tf   
│
└── .gitignore


Deployment Instructions.

Prerequisites
terraform version
aws --version

Configure AWS credentials:

aws configure

Verify:

aws sts get-caller-identity


Deploy

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

http://<ALB-DNS-NAME>

Destroy

terraform destroy
