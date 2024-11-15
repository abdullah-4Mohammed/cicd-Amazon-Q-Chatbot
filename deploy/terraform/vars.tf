variable "environment" {
  type = string
}

variable "serviceName" {
  type = string
}

variable "regionShortName" {
  type = string
}

variable "backendBucket" {
  type = string
}
// this test
variable "region" {
  type = string
}

variable "datasourceBucketName" { 
  type = string
}

locals {
  resourceName = "Az-aws-${var.serviceName}-${var.environment}-${var.regionShortName}"
  key = "tf/${var.environment}.tfstate"
  region = "${var.region}"
  backendBucket = "${var.backendBucket}"
}

