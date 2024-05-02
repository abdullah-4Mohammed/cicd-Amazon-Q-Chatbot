// Create the S3 bucket 
resource "aws_s3_bucket" "amazon-q-ds" {
  bucket = "amazon-q-ds"
  acl    = "private"
}

// create amazon kendras index
resource "aws_kendra_index" "Kendra-Index" {
  name        = "kendra-index"
  role_arn    = aws_iam_role.amazon-q-ds.arn
  description = "Amazon Kendra index for Q&A data source"
  edition     = "DEVELOPER_EDITION"
  # server_side_encryption_configuration {
  #   kms_key_id = aws_kms_key.amazon-q-ds.arn
  # }
}