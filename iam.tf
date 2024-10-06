data "aws_iam_policy_document" "access_s3_bucket_document" {
  statement {
    actions = [
      "s3:*",
    ]

    resources = [
      "${aws_s3_bucket.capstone_management_bucket.arn}",
      "${aws_s3_bucket.capstone_management_bucket.arn}/*",
    ]
  }
}

resource "aws_iam_policy" "s3_access_policy" {
  name   = "s3-access-policy"
  path   = "/Development/"
  policy = data.aws_iam_policy_document.access_s3_bucket_document.json
}

resource "aws_iam_role" "backend_role" {
  name = "BackenS3AccessRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_s3_access_policy" {
  policy_arn = aws_iam_policy.s3_access_policy.arn
  role       = aws_iam_role.backend_role.name
}
