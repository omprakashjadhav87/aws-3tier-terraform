# AWS Three-Tier Architecture – Technical Design Document 

## 1. Executive Summary

This solution implements a three-tier web application architecture on Amazon Web Services using Terraform as Infrastructure as Code.

The architecture separates the application into three logical layers:

1. Presentation/Web Tier – Amazon EC2 instances hosting the web application.(sample Increment and Decrement Counter web application)
2. Application/Traffic Distribution Tier – Application Load Balancer distributing traffic across EC2 instances.
3. Data Tier – Amazon RDS for MySQL deployed in private subnets.

The infrastructure is designed to be reproducible, configurable, and deployable into another AWS account using Terraform.

## 2. Architecture Overview

The solution is deployed within a dedicated Amazon VPC.

Internet traffic enters through an Internet Gateway and is directed to an internet-facing Application Load Balancer deployed across two public subnets. The Load Balancer distributes requests to two EC2 instances.

The database layer is isolated within private subnets. Amazon RDS MySQL is deployed using a DB subnet group containing private subnets.

## 3. Components

### VPC

A dedicated VPC provides network isolation for the application infrastructure.

### Public Subnets

Two public subnets are used for the Application Load Balancer and EC2 instances that require internet access.

### Private Subnets

Private subnets are used for the database tier. The RDS database does not require direct internet access.

### Internet Gateway

The Internet Gateway provides internet connectivity to resources in public subnets.

### Application Load Balancer

The ALB distributes HTTP traffic across multiple EC2 instances and provides a single DNS endpoint for users.

### EC2 Instances

Two EC2 instances host the web application. The application is installed using EC2 user data scripts.

### Amazon RDS

Amazon RDS for MySQL provides the managed relational database layer.

## 4. Traffic Flow

The request flow is:

User → Internet → Internet Gateway → Application Load Balancer → EC2 Instances → Database Layer.

The ALB performs health checks against registered EC2 instances and routes traffic only to healthy targets.

## 5. Infrastructure as Code

Terraform is used to provision all infrastructure resources.

The Terraform configuration includes:

* VPC
* Subnets
* Route Tables
* Internet Gateway
* Security Groups
* EC2 Instances
* Application Load Balancer
* Target Group
* RDS Subnet Group
* RDS MySQL Instance

The infrastructure is parameterized using Terraform variables to support deployment in different environments and AWS accounts.

## 6. High Availability

High availability is achieved by:

* Deploying the ALB across multiple Availability Zones.
* Running multiple EC2 instances.
* Using an ALB health check to detect unhealthy targets.
* Deploying the database subnet group across multiple Availability Zones.

## 7. Scalability

The architecture can be extended by:

* Adding additional EC2 instances.
* Introducing an Auto Scaling Group.
* Increasing the RDS instance size.
* Enabling RDS Multi-AZ deployment.

## 8. Assumptions

* The AWS account has sufficient permissions to create the required resources.
* The AWS region supports the selected Availability Zones.
* A valid EC2 Key Pair is available in the deployment region.
* The selected AMI is available in the target region.
* The selected RDS engine version is supported by the selected instance class.
* Terraform is installed on the deployment workstation.

## 9. Limitations

The current implementation is intended as a demonstration and reference architecture.

Production improvements may include:

* Auto Scaling Groups.
* NAT Gateway for private subnet outbound internet access.
* HTTPS using ACM certificates.
* AWS WAF.
* Secrets Manager for database credentials.
* CloudWatch monitoring and alarms.
* Remote Terraform state using Amazon S3 and DynamoDB locking.
