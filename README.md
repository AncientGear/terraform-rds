# Terraform AWS RDS Database Project

This Terraform project creates an AWS RDS (Relational Database Service) instance with configurable parameters.

## Project Overview

This project demonstrates how to use Terraform to provision a MySQL database instance on AWS RDS. It includes all necessary configuration files to create a basic database instance with customizable settings.

## Architecture

The project creates:
- AWS RDS Database Instance (MySQL 8.0)
- Configurable database parameters through variables
- Database connection outputs for easy access

## Files Structure

```
creating_rds/
├── main.tf                    # Main resource definitions
├── variables.tf              # Variable declarations
├── outputs.tf               # Output values
├── providers.tf             # Provider configuration
├── db_connection.auto.tfvars # Variable values (auto-loaded)
└── README.md               # This file
```

## Prerequisites

Before running this project, ensure you have:

1. **Terraform installed** (version ~1.12.0)
   ```bash
   terraform version
   ```

2. **AWS CLI configured** with appropriate credentials
   ```bash
   aws configure
   ```

3. **Required AWS permissions** for RDS management:
   - `rds:CreateDBInstance`
   - `rds:DescribeDBInstances`
   - `rds:DeleteDBInstance`
   - `rds:ModifyDBInstance`

## Configuration

### Variables

The project uses the following configurable variables:

| Variable | Description | Type | Default |
|----------|-------------|------|---------|
| `db_name` | The name of the database to create | string | - |
| `db_engine` | The database engine to use | string | - |
| `db_engine_version` | The version of the database engine | string | - |
| `db_instance_class` | The instance class for the database | string | - |
| `db_username` | The username for the database | string | - |
| `db_password` | The password for the database | string | - |
| `db_group_name` | The database parameter group name | string | - |

### Current Configuration

The `db_connection.auto.tfvars` file contains the following default values:
- **Database Name**: `tf_creating_rds`
- **Engine**: MySQL 8.0
- **Instance Class**: `db.t3.micro` (Free tier eligible)
- **Username**: `tf_user`
- **Region**: `us-east-1`

## Usage

### 1. Clone or Navigate to the Project Directory
```bash
cd creating_rds/
```

### 2. Initialize Terraform
```bash
terraform init
```

### 3. Review the Plan
```bash
terraform plan
```

### 4. Apply the Configuration
```bash
terraform apply
```

Type `yes` when prompted to confirm the creation.

### 5. Access Output Values
After successful deployment, you'll see:
- **Database Endpoint**: Connection endpoint for your application
- **Database Name**: The created database name
- **Database Port**: The port number for connections

## Outputs

The project provides the following outputs:

- `rds_db_endpoint`: The RDS instance connection endpoint
- `rds_db_name`: The database name
- `rds_db_port`: The database port

## Security Considerations

⚠️ **Important Security Notes:**

1. **Password Security**: The database password is stored in plain text in `db_connection.auto.tfvars`. In production:
   - Use AWS Secrets Manager
   - Use environment variables
   - Use Terraform Cloud/Enterprise variable encryption

2. **Network Security**: This basic configuration doesn't include:
   - VPC configuration
   - Security groups
   - Subnet groups
   
   Consider adding these for production use.

## Customization

### Changing Database Configuration

Edit the `db_connection.auto.tfvars` file to modify:
- Database engine type
- Instance size
- Database name
- Username/password

### Adding Security Groups

To add security groups, modify `main.tf`:
```hcl
resource "aws_db_instance" "default" {
  # ...existing configuration...
  vpc_security_group_ids = [aws_security_group.rds.id]
}
```

## Cleanup

To destroy the created resources:
```bash
terraform destroy
```

Type `yes` when prompted to confirm the destruction.

## Cost Considerations

- **db.t3.micro**: Eligible for AWS Free Tier (750 hours/month)
- **Storage**: 10 GB allocated (included in free tier)
- **Backup**: Automated backups disabled (`skip_final_snapshot = true`)

## Troubleshooting

### Common Issues

1. **Authentication Errors**
   - Verify AWS credentials: `aws sts get-caller-identity`
   - Check AWS region configuration

2. **Permission Denied**
   - Ensure your AWS user/role has RDS permissions

3. **Resource Already Exists**
   - Check if resources with the same name already exist
   - Modify the `db_name` variable if needed

## Learning Objectives

This project demonstrates:
- ✅ Basic Terraform resource creation
- ✅ Variable usage and management
- ✅ Output value definition
- ✅ Provider configuration
- ✅ AWS RDS fundamentals

## Next Steps

To extend this project, consider:
- Adding VPC and subnet configuration
- Implementing security groups
- Adding monitoring and alarms
- Setting up automated backups
- Implementing multi-AZ deployment

## Resources

- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS RDS Documentation](https://docs.aws.amazon.com/rds/)
- [Terraform Best Practices](https://www.terraform.io/docs/cloud/guides/recommended-practices/index.html)