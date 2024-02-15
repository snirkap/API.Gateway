data "aws_iam_policy_document" "assume_role" {
    statement {
      effect = "Allow"
      principals {
        type = "service"
        identifiers = [ "lambda.amazonaws.com" ]
      }
      actions = [ "sts:AssumeRole" ]
    }
}

resource "aws_iam_role" "iam_for_lambda" {
    name               = var.iam_for_lambda_name
    assume_role_policy = jsonencode({
        Version   = "2012-10-17"
        Statement = [
            {
                Effect    = "Allow"
                Principal = {
                    Service = "lambda.amazonaws.com"
                }
                Action    = "sts:AssumeRole"
            }
        ]
    })
}

data "archive_file" "lambda" {
    type = "zip"
    source_file = "./src/hello_lambda.py"
    output_path = "lambda_function_src.zip"
}

resource "aws_lambda_function" "hello_lambda" {
    filename         = "lambda_function_src.zip"
    function_name    = var.iam_for_lambda_name
    role             = aws_iam_role.iam_for_lambda.arn
    source_code_hash = data.archive_file.lambda.output_base64sha256
    runtime          = "python3.10"
    handler          = "hello_lambda.lambda_handler"
}

