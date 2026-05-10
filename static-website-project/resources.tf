resource "random_id" "s3_bucket_random_value" {
    byte_length = 4
  
}

resource "aws_s3_bucket" "my_static_webapp" {
  bucket = "shalin-static-project-${random_id.s3_bucket_random_value.hex}"
}

resource "aws_s3_object" "index_file" {
    bucket = aws_s3_bucket.static_website_project_bucket.bucket
    key = "index.html"
    source = "./index.html"  
}


resource "aws_s3_object" "css_files" {
    bucket = aws_s3_bucket.static_website_project_bucket.bucket
    key = "css_files"
    source = "./css"  
}
