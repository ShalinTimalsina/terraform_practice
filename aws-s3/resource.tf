resource "random_id" "rand_id" {
  byte_length = 8
}

resource "aws_s3_bucket" "shalin_bucket" {
    bucket = "shalin-practice-${random_id.rand_id.hex}"

}

resource "aws_s3_object" "shalin_demo_object" {

    key = "helloworld.txt"
    bucket = aws_s3_bucket.shalin_bucket.bucket
    source = "./textfile.txt"    
}
 
