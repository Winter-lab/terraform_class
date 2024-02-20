# terraform_class
Class of Security Cloud with Arnaud Cospain

### 1. main.tf
This is the primary file where you define the configuration of your resources. In the context of an AWS EC2 setup, main.tf contains the provider configuration, resource definitions (like your EC2 instance), and any other AWS resources you need (e.g., VPC, security groups). This file is where you specify what actions Terraform should perform in your AWS account.

### 2. variables.tf
This file declares variables that you can use within your Terraform configuration. Declaring variables makes your Terraform scripts more modular and flexible. For instance, you might define variables for your region, instance type, or AMI ID in variables.tf, so you can easily change them without modifying the core logic in main.tf.

### 3. outputs.tf
After Terraform applies your configuration, you might want to output certain information about the resources created, such as the public IP address of the EC2 instance. outputs.tf is where you define these outputs. Terraform displays these values at the end of the apply command, making it easier to retrieve important information about your infrastructure.

### 4. terraform.tfvars (Optional)
While variables.tf declares variables, terraform.tfvars is where you can assign values to those variables. This separation allows you to keep your variable values separate from their declarations for better organization and security (e.g., you might exclude terraform.tfvars from source control if it contains sensitive information). Note that this file is optional because you can also set variable values using environment variables or command-line flags.

## Interaction Among These Files

### Initialization:
When you run terraform init, Terraform initializes the working directory, downloads the AWS provider defined in main.tf, and prepares the environment for other commands.

### Planning and Applying:
With terraform plan and terraform apply, Terraform reads your configuration in main.tf, substitutes variables defined in variables.tf with values provided in terraform.tfvars (or other sources), and then creates or updates resources in your AWS account accordingly.

### Output:
After applying your configuration, Terraform uses outputs.tf to display specified information about the resources it has managed. This helps you quickly access important details like IP addresses or DNS names.

This structure not only helps in organizing your Terraform configuration but also enhances reusability and maintainability. As your infrastructure grows more complex, you might introduce additional files for modularization, such as breaking out resource configurations into separate files or modules for better organization.
