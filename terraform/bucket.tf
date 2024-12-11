resource "aws_s3_bucket" "s3" {
  bucket        = "josemanueldaw"
  force_destroy = true 
}

resource "aws_s3_bucket_public_access_block" "bucket_public_block" {
  bucket = aws_s3_bucket.s3.id

  block_public_acls       = false  
  block_public_policy     = false  
  ignore_public_acls      = false  
  restrict_public_buckets = false  
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.s3.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject" 
        Effect    = "Allow" 
        Principal = "*" 
        Action = [
          "s3:GetObject", 
          "s3:PutObject" 
        ]
        Resource = "${aws_s3_bucket.s3.arn}/*" 
      }
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.bucket_public_block]
}

resource "aws_s3_bucket_website_configuration" "index_of_bucket" {
  bucket = aws_s3_bucket.s3.id

  index_document {
    suffix = "index.html" 
  }
}

data "local_file" "web_files" {
  for_each = fileset("../src", "**")           
  filename = "${abspath("../src")}/${each.key}" 
}

resource "aws_s3_object" "bucket_objects" {
  for_each = data.local_file.web_files
  bucket   = aws_s3_bucket.s3.id
  key      = each.key 
  source   = each.value.filename 
  content_type = lookup({
    "html" = "text/html"
    "css"  = "text/css"
    "js"   = "application/javascript"
  }, regex("^.*\\.([a-z]+)$", each.key)[0], "application/octet-stream")
}