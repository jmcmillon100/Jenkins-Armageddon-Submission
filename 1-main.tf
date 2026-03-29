  resource "aws_s3_bucket" "jenkins_armageddon_submission_bucket" {
  bucket        = "jenkins-armageddon-submission-bucket"
  force_destroy = true

  tags = {
    Name = "Armageddon"
  }
}

resource "aws_s3_bucket_public_access_block" "jenkins_armageddon_submission_bucket_block" {
  bucket = aws_s3_bucket.jenkins_armageddon_submission_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.jenkins_armageddon_submission_bucket.id

  depends_on = [aws_s3_bucket_public_access_block.jenkins_armageddon_submission_bucket_block]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = ["s3:GetObject"]
        Resource  = "${aws_s3_bucket.jenkins_armageddon_submission_bucket.arn}/*"
      }
    ]
  })
}

resource "aws_s3_object" "jenkins_full_pipeline" {
  bucket       = aws_s3_bucket.jenkins_armageddon_submission_bucket.id
  key          = "Jenkins_Full_Pipeline.png"
  source       = "${path.module}/images/Jenkins_Full_Pipeline.png"
  content_type = "image/png"

  etag = filemd5("${path.module}/images/Jenkins_Full_Pipeline.png")
}

resource "aws_s3_object" "pipeline" {
  bucket       = aws_s3_bucket.jenkins_armageddon_submission_bucket.id
  key          = "Jenkins_Pipeline1.png"
  source       = "${path.module}/images/Jenkins_Pipeline1.png"
  content_type = "image/png"

  etag = filemd5("${path.module}/images/Jenkins_Pipeline1.png")
}

resource "aws_s3_object" "webhook" {
  bucket       = aws_s3_bucket.jenkins_armageddon_submission_bucket.id
  key          = "Webhook_Delivery.png"
  source       = "${path.module}/images/Webhook_Delivery.png"
  content_type = "image/png"

  etag = filemd5("${path.module}/images/Webhook_Delivery.png")
}

resource "aws_s3_object" "armageddon_readme" {
  bucket       = aws_s3_bucket.jenkins_armageddon_submission_bucket.id
  key          = "armageddon.md"
  source       = "${path.module}/More_information/armageddon_repo_link.md"
  content_type = "text/markdown"

  etag = filemd5("${path.module}/More_information/armageddon_repo_link.md")
}

resource "aws_s3_object" "theos_blessing" {
  bucket       = aws_s3_bucket.jenkins_armageddon_submission_bucket.id
  key          = "Theos_Blessing.png"
  source       = "${path.module}/images/Theos_Blessing.png"
  content_type = "image/png"

  etag = filemd5("${path.module}/images/Theos_Blessing.png")
}