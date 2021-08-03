variable "aws_region" {
  default     = "ap-southeast-2"
  description = "AWS Region to deploy api-gateway-demo API Gateway REST API"
  type        = string
}

variable "rest_api_domain_name" {
  default     = "api-gateway-demo.com"
  description = "Domain name of the API Gateway REST API for self-signed TLS certificate"
  type        = string
}

variable "rest_api_name" {
  default     = "api-gateway-rest-api-openapi-api-gateway-demo"
  description = "Name of the API Gateway REST API (can be used to trigger redeployments)"
  type        = string
}

variable "rest_api_path" {
  default     = "/path1"
  description = "Path to create in the API Gateway REST API (can be used to trigger take redeployments)"
  type        = string
}
