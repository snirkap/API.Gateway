variable "iam_for_lambda_name" {
    type = string
    description = "the name of the iam role for lambda"
    default = "iam_for_lambda"
}

variable "lambda_function_name" {
    type = string
    description = "the name of the lambda function"
    default = "py_tf_lambda"
}

variable "s3_bucket_name" {
    type = string
    description = "the name of the lambda function"
    default = "client-info-stand-il"
}

variable "rest_api_name" {
    type = string
    description = "the name of the rest api getway"
    default = "api_for_lambda"
}

variable "aws_api_gateway_deployment_name" {
    type = string
    description = "the name of the api gateway deployment"
    default = "dev"
}

variable "button_click_lambda_name" {
    type = string
    description = "the name of the button click lambda"
    default = "ButtonClickLambda"
}

variable "iam_for_lambda_metric_name" {
    type = string
    description = "the name of the iam for lambda metric"
    default = "lambda_execution_role_for_button_click"
}

variable "cloudwatch_policy_name" {
    type = string
    description = "the name of the cloudwatch policy"
    default = "CloudWatchPutMetricGetMetricDataPolicy"
}

variable "cloudwatch_dashboard_name" {
    type = string
    description = "the name of the cloudwatch policy"
    default = "ButtonClickDashboard"
}

variable "client_info_lmabda_name" {
    type = string
    description = "the name of the client info lmabda"
    default = "myLambdaFunction"
}

variable "aws_iams_3_write_policy_name" {
    type = string
    description = "the name of the client info lmabda"
    default = "S3WritePolicy"
}