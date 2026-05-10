resource "random_id" "s3_bucket_random_value" {
  byte_length = 4

}

resource "aws_s3_bucket" "my_static_webapp" {
  bucket = "shalin-static-project-${random_id.s3_bucket_random_value.hex}"
}


resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.my_static_webapp.bucket

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_policy" "Bucket_policy" {
  bucket = aws_s3_bucket.my_static_webapp.bucket

  depends_on = [
    aws_s3_bucket_public_access_block.public_access
  ]

  policy = jsonencode(
    {
      Version = "2012-10-17",
      Statement : [
        {
          Sid       = "PublicReadGetObject",
          Effect    = "Allow",
          Principal = "*",
          Action    = "s3:GetObject",
          Resource  = "${aws_s3_bucket.my_static_webapp.arn}/*"


        }
      ]
    }
  )
}

resource "aws_s3_bucket_website_configuration" "Static_hosting" {
  bucket = aws_s3_bucket.my_static_webapp.bucket

  index_document {
    suffix = "index.html"
  }

}

resource "aws_s3_object" "index_file" {
  bucket       = aws_s3_bucket.my_static_webapp.bucket
  key          = "index.html"
  source       = "./index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "css_file" {
  bucket       = aws_s3_bucket.my_static_webapp.bucket
  key          = "styles.css"
  source       = "./styles.css"
  content_type = "text/css"
}
