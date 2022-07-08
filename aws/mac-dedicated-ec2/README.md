This guide shows how to set up an EC2 dedicated host in AWS.

Example purpose: For testing stuff on Mac when you own only a Linux machine, and none of your Mac friends are nearby.

Implementation: Terraform

:warning::warning::warning:

**BIG COST WARNING**

Mac dedicated hosts are **very** expensive. Make 100% sure to shut them down right after you finish testing.

Price example:

* You pay for minimum 24 hours.
* 24 hour costs in eu-west-1: $29
  * 31 days: $898

:warning::warning::warning:

# How to create a Mac instance

## Create or reuse a IaC repository

Create/Reuse a git repository to put your IaC files in.

## Create Terraform remote state

You can for instance use https://github.com/oslokommune/golden-path-iac/blob/WIP/bin/ok like this

```sh
ok env
```

Edit env.yaml.

```sh
ok bootstrap
cd bootstrap
tfswitch
tf init
tf apply
```

## Create infrastructure

```
cd ..
ok scaffold infra
cd infra

# Get VPC Terraform IaC
curl -s -H "Authorization: token $GITHUB_TOKEN" -H "Accept: application/vnd.github.v3.raw" \
    https://raw.githubusercontent.com/oslokommune/golden-path-iac/WIP/terraform/templates/vpc.tf -o vpc.tf

tf init
tf plan
# tf plan should give you errors, indicating which fields in vpc.tf (and other places perhaps) you need to configure.
# After configuring, run
tf apply
```

## Create the Mac instance

I haven't found a working Terraform provider for this. See issue https://github.com/DanielRDias/terraform-aws-dedicated-host/issues/7.

Also couldn't get https://registry.terraform.io/providers/hashicorp%20%20/aws/latest/docs/resources/ec2_host#instance_family to work (I gave up after 11 minutes of tf apply not getting any progress, maybe I should have waited longer?)

So for now, create it in the AWS console GUI. ToDo: Describe this better.

* Select the VPC from the previous step
* Choose a public subnet?
* Should we put on a IAM role so we cannot do lots of harm?
* Create a new keypair
* Note which security group is created



## Important: Clean up

* Delete the EC2 -> dedicated host
* Delete the keypair
* Check if the security group created in the previous step needs to be deleted

