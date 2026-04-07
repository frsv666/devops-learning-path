# 🏗️ Terraform

## Основные команды

```bash
terraform init          # инициализировать (скачать провайдеры)
terraform plan          # показать что изменится
terraform apply         # применить изменения
terraform apply -auto-approve  # без подтверждения
terraform destroy       # удалить всю инфраструктуру
terraform fmt           # форматировать код
terraform validate      # проверить синтаксис
terraform output        # показать outputs
terraform state list    # список ресурсов в state
```

## Структура проекта

```
infrastructure/
├── main.tf          # основные ресурсы
├── variables.tf     # объявление переменных
├── outputs.tf       # outputs
├── providers.tf     # конфигурация провайдеров
└── terraform.tfvars # значения переменных (не коммитить!)
```

## Пример: EC2 инстанс на AWS

```hcl
# providers.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# variables.tf
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-north-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

# main.tf
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.instance_type

  tags = {
    Name        = "my-web-server"
    Environment = "dev"
  }
}

# outputs.tf
output "instance_ip" {
  description = "Public IP of the instance"
  value       = aws_instance.web.public_ip
}
```

## Remote State (S3 backend)

```hcl
terraform {
  backend "s3" {
    bucket = "my-terraform-state"
    key    = "prod/terraform.tfstate"
    region = "eu-north-1"
  }
}
```

## Locals и Data Sources

```hcl
locals {
  common_tags = {
    Project     = "my-project"
    ManagedBy   = "terraform"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }
}
```

## Модули

```hcl
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-north-1a", "eu-north-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
}
```

---
*Последнее обновление: —*
