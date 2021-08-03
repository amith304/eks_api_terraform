#
# Domain Setup
#

resource "aws_api_gateway_domain_name" "api-gateway-demo" {
  domain_name              = aws_acm_certificate.api-gateway-demo.domain_name
  regional_certificate_arn = aws_acm_certificate.api-gateway-demo.arn

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_base_path_mapping" "api-gateway-demo" {
  api_id      = aws_api_gateway_rest_api.api-gateway-demo.id
  domain_name = aws_api_gateway_domain_name.api-gateway-demo.domain_name
  stage_name  = aws_api_gateway_stage.api-gateway-demo.stage_name
}
