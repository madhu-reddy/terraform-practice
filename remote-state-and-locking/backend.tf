/*
https://developer.hashicorp.com/terraform/language/backend/s3#dynamodb_table 
- dynamodb_table - (Optional) Name of DynamoDB Table to use for state locking and consistency. The table must have a partition key named LockID with type of String.
- LockID - In this case, the LockID is defined as the hash key (primary key) of the table. The LockID attribute is the partition key, and it's used to uniquely identify the items in the table. 
- Hash key (partition key) - This is the primary identifier for items in your DynamoDB table.
*/

terraform {
  backend "s3" {
    bucket = "madhutest-bucket-a"
    key    = "madhuterraform/remotestate"
    region = "us-east-2"
    profile = "aws-staging"
    dynamodb_table = "terraform_state"
  }
}

