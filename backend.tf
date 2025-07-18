terraform {
  backend "s3" {
    bucket = "bucket123wdfgh"
    key    = "backend-tf-state"
    region = "us-east-1"
    
  }
}
