data "archive_file" "lambda_metric" {
    type = "zip"
    source_file = "./src/metricClick.py"
    output_path = "metricClick.zip"
}

resource "aws_lambda_function" "button_click_lambda" {
  filename         = "metricClick.zip"
  function_name    = "ButtonClickLambda"
  role             = aws_iam_role.iam_for_lambda_metric.arn
  handler          = "index.handler"
  runtime          = "nodejs20.x"
  timeout          = 10 
  memory_size      = 128 
  source_code_hash = data.archive_file.lambda_metric.output_base64sha256
}

resource "aws_iam_role" "iam_for_lambda_metric" {
  name = "lambda_execution_role_for_button_click"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_metric" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.iam_for_lambda_metric.name
}

resource "aws_cloudwatch_metric_alarm" "button_click_metric_alarm" {
  alarm_name          = "ButtonClickMetricAlarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "ButtonClickedCount"
  namespace           = "countClick"
  period              = 60
  statistic           = "Sum"
  threshold           = 1
  alarm_description   = "Alarm when the button click count exceeds 1"
}

resource "aws_lambda_permission" "apigw_lambda_metric" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.button_click_lambda.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.api_for_lambda.execution_arn}/*/*/*"
}



