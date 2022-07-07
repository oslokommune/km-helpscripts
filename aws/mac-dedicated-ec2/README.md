This guide shows how to set up an EC2 dedicated host in AWS.

Example purpose: For testing stuff on Mac when you own only a Linux machine, and none of your Mac friends are nearby.

Implementation: Terraform

:warning::warning::warning:

**BIG WARNING**

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
```



## Create the Mac instance

```sh
cat <<EOF >mac-ec2.tf
module "dedicated-host" {
  source            = "DanielRDias/dedicated-host/aws"
  version           = "0.2.1"
  instance_type     = "mac1.metal"
  availability_zone = "eu-west-1"

  tags = local.common_tags
}
EOF

```

