terraform {
  backend "s3" {
    bucket         = "amithcodebucket"
    key            = "api-gateway-demo.tfstate"
    region         = "ap-southeast-2"
  }
}
