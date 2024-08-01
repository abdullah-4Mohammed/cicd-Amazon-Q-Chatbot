// Create the S3 bucket 
resource "aws_s3_bucket" "amazon-q-ds-bucket" {
  bucket = "${var.datasourceBucketName}"
  force_destroy = true

}
#"amazon-q-ds-bucket" is the local name of the resource within your Terraform configuration. 
#This name is used to refer to this resource within your Terraform configuration. 
#It doesn't have to match the name of the S3 bucket in AWS.

# resource "aws_s3_bucket_acl" "amazon-q-ds-bucket" {
#   bucket = aws_s3_bucket.amazon-q-ds-bucket.id
#   acl    = "private"
#   depends_on = [ aws_s3_bucket.amazon-q-ds-bucket ]
# }

// Use a local-exec provisioner to upload the files
resource "null_resource" "upload_files" {
  provisioner "local-exec" {
    command = "aws s3 sync ../../src/data s3://${aws_s3_bucket.amazon-q-ds-bucket.bucket}"
  }
  depends_on = [aws_s3_bucket.amazon-q-ds-bucket]
}

# // create amazon kendras index
# resource "aws_kendra_index" "Kendra-Index" {
#   name        = "kendra-index"
#   role_arn    = aws_iam_role.amazon-q-ds.arn
#   description = "Amazon Kendra index for Q&A data source"
#   edition     = "DEVELOPER_EDITION"
#   # server_side_encryption_configuration {
#   #   kms_key_id = aws_kms_key.amazon-q-ds.arn
#   # }
# }