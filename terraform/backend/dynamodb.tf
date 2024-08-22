resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name         = "reh-project-dbtable"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}