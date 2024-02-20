data "archive_file" "lambda" {
    type = "zip"
    source_file = "./src/clientInfo.py"
    output_path = "lambda_function_src.zip"
}

resource "aws_lambda_function" "client_info_lmabda" {
  filename = "lambda_function_src.zip"
  function_name = "myLambdaFunction"
  role = aws_iam_role.iam_for_lambda.arn
  handler = "clientInfo.lambda_handler"
  runtime = "python3.10"
  source_code_hash = data.archive_file.lambda.output_base64sha256
}

resource "aws_iam_policy" "s3_write_policy" {
  name        = "S3WritePolicy"
  description = "Policy to allow writing to an S3 bucket"
  
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect   = "Allow",
      Action   = "s3:PutObject",
      Resource = "arn:aws:s3:::client-info-stand-il/*"
    }]
  })
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
    {
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }
  ]
})
}

resource "aws_iam_role_policy_attachment" "s3_write_policy_attachment" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.s3_write_policy.arn
}