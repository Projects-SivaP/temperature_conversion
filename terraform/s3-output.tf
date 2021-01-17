### Outputs in case need to be referred via state file else where, though it is N/A for this scenario
output "devops_challenge_bucket" {
  value = aws_s3_bucket.devops_challange.id
}

output "devops_challenge_bucket_arn" {
  value = aws_s3_bucket.devops_challange.arn
}
