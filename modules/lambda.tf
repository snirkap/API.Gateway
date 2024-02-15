data "aws_iam_policy_document" "assume_role" {
    statement {
      effect = "allow"
      principals {
        type = "service"
        identifiers = [ "lambda.amazonaws.com" ]
      }
      actions = [ "sts:AssumeRole" ]
    }
}

resource "aws_iam_role" "iam_for_lambda" {
    name = var.iam_for_lambda_name
    assume_role_policy = data.aws_iam_policy_document.assume_role
}

data "archive_file" "lambda" {
    type = "zip"
    source_file = "./src/hello_lambda.py"
    output_path = "lambda_function_src.zip"
}

resource "aws_lambda_function" "hello_lambda" {
    filename = "lambda_function_src.zip"
    function_name = var.iam_for_lambda_name
    role = aws_iam_role.iam_for_lambda.arn
    source_code_hash = data.archive_file.lambda.output_base64sha256
    runtime = "python3.10"
    handler = "lambda_handler"
}

