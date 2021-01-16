resource "aws_s3_bucket" "devops_challange" {
  bucket = "${var.environment_name}-devops-challenge"
  acl    = "public-read"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

}

resource "aws_s3_bucket_object" "py_file" {
  bucket                 = aws_s3_bucket.devops_challange.id
  key                    = "src/temp_conv.py"
  source                 = "${path.module}/../src/temp_conv.py"
  acl                    = "public-read"
  content_type           = "text/plain"
  server_side_encryption = "AES256"
  etag                   = filemd5("${path.module}/../src/temp_conv.py")
}

