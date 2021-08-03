#
# Stage and Stage Settings
#

resource "aws_api_gateway_stage" "api-gateway-demo" {
  deployment_id = aws_api_gateway_deployment.api-gateway-demo.id
  rest_api_id   = aws_api_gateway_rest_api.api-gateway-demo.id
  stage_name    = "api-gateway-demo"
}

resource "aws_api_gateway_method_settings" "api-gateway-demo" {
  rest_api_id = aws_api_gateway_rest_api.api-gateway-demo.id
  stage_name  = aws_api_gateway_stage.api-gateway-demo.stage_name
  method_path = "*/*"

  settings {
    metrics_enabled = true
  }
}
