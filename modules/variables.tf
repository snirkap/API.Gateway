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