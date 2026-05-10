output "static_webapp_bucket_name" {
    value = aws_s3_bucket.my_static_webapp.bucket
}

output "Static_website_url" {
    value = aws_s3_bucket_website_configuration.Static_hosting.website_endpoint
}