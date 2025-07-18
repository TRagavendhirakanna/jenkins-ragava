provider "aws" {
  region = "us-east-1"
  
}
resource "aws_iam_user" "name" {
    name = "ragavan-ragavan"
  
}
resource "aws_iam_user" "namee" {
    name = "ragavan--ragavan"
  
}
