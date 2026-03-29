output "s3_bucket_arn" {
  description = "ARN of the submission bucket"
  value       = aws_s3_bucket.jenkins_armageddon_submission_bucket.arn
}

output "jenkins_pipeline1_url" {
  value = "https://${aws_s3_bucket.jenkins_armageddon_submission_bucket.bucket_domain_name}/Jenkins_Pipeline1.png"
}

output "webhook_delivery_url" {
  value = "https://${aws_s3_bucket.jenkins_armageddon_submission_bucket.bucket_domain_name}/Webhook_Delivery.png"
}

output "jenkins_full_pipeline_url" {
  value = "https://${aws_s3_bucket.jenkins_armageddon_submission_bucket.bucket_domain_name}/Jenkins_Full_Pipeline.png"
}

output "armageddon_readme_url" {
  value = "https://${aws_s3_bucket.jenkins_armageddon_submission_bucket.bucket_domain_name}/armageddon.md"
}

output "theos_blessing_url" {
  value = "https://${aws_s3_bucket.jenkins_armageddon_submission_bucket.bucket_domain_name}/${aws_s3_object.theos_blessing.key}"
}