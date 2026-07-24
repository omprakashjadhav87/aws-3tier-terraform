Security Controls

Network Security
RDS is placed in private subnets.
RDS does not receive direct internet traffic.
Security Groups control inbound and outbound traffic.
Web Tier

Required ports:

HTTP  80
HTTPS 443
SSH   22

However, for a production environment:

SSH should not be open to 0.0.0.0/0

Instead, restrict SSH to:

Your corporate IP
VPN CIDR
Bastion host
AWS Systems Manager Session Manager
Database Security

MySQL port:

3306

should only be allowed from the application security group:

security_groups = [
  aws_security_group.web-sg.id
]

It should not be:

cidr_blocks = ["0.0.0.0/0"]
Secrets

Do not commit:

password = "YourPassword"

to GitHub.

For a production implementation, use:

AWS Secrets Manager
AWS Systems Manager Parameter Store
