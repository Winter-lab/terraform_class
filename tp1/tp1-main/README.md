# TP1 - Terraform basics and deep dive tfstates

# Table of content

<!--TOC-->

- [TP1 - Terraform basics and deep dive tfstates](#tp1---terraform-basics-and-deep-dive-tfstates)
- [Table of content](#table-of-content)
- [Labs goals](#labs-goals)
- [Pre-requisities](#pre-requisities)
  - [Trainees](#trainees)
  - [Instructor](#instructor)
- [Agenda](#agenda)
  - [Part 1 : Manipulation of basic commands](#part-1--manipulation-of-basic-commands)
  - [Part 2: Teamwork and tfstate protection](#part-2-teamwork-and-tfstate-protection)
- [Useful links](#useful-links)

<!--TOC-->

# Labs goals

The aim of this labs is :

- => Rapidly look at a tfstate example
- => Show that a secret can be accessible easily in a tfstate
- => Demonstrate why an encrypted state is usefull
- => The less sensible information you have in there, the better you are
- => Showing the importance of avoiding having all the eggs in one basket (security and performance)
- => Show state manipulation (import, rm, mv)

# Pre-requisities

## Trainees

- IDE with a terraform plugin
    - VScode, IntelliJ prefered but not mandatory
- At least terraform : ~> 1.0
- Git setup ready to go
- Need to be able to connect to an AWS connect through the AWSCLI in order to deploy ressources with Terraform

## Instructor

- Pre-deployed resources:
    - Dynamodb database for locking purpose
    - common S3 encrypted
    - Non encrypted s3 bucket

# Agenda

## Part 1 : Manipulation of basic commands

Estimate time : < 20min

- Federated assume role
- Deploying a ready-made code containing a local backend
- Deploy the resource to analyze the tfstate locally
    - Investigate the value of the password in the tfstate
- Identify the problems and solutions to address them
- Destroy of the stack

## Part 2: Teamwork and tfstate protection

Estimated duration of this part: <30min

- Assume the role in federated mode
- Deploy common resources with a non-encrypted remote S3 backend and locking
- Examine the contents of the tfstate in S3
- Deploy common resources with an encrypted remote S3 backend and locking
- => Ensure not only remote storage of the tfstate but also secure access and usage
    - Demonstrate a tool to create an infrastructure diagram based on reading a tfstate
- One person performs an apply while another person attempts it at the same time

Then:

- One person performs a `terraform state rm` of the resource
- Instructor attempts a plan and apply to observe the outcome
- Discuss how to address the situation so that the team can manage the resource with Terraform again => one of the participants takes care of it

Bonus :

- Live change the backend key to manipulate `terraform init -reconfigure` / `-migrate-state`

# Useful links

- Training preparation documentation
  terraform : https://docs.google.com/document/d/1UE8m4J_4Z66ZYg-gkjlobd-XGnDbmrtY6_uGOzW4Rpo/edit
