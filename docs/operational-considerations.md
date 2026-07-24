Monitoring

Recommended services:

Amazon CloudWatch
ALB access logs
EC2 status checks
RDS monitoring
Backup

RDS should use:

backup_retention_period = 7

For production:

Automated backups
Point-in-time recovery
Manual snapshots
Disaster Recovery

Possible improvements:

Multi-AZ RDS
Terraform code stored in Git
Database backups
Cross-region backup strategy
Cost Management

After testing:

terraform destroy

This is important because EC2, RDS, ALB and other AWS services may incur charges.
