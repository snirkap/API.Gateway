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