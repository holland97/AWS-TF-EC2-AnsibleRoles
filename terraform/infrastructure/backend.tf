terraform {
	backend "s3" {
        bucket = "reh-project-bkt"
		key = "project/terraform.tfstate" 
		region = "us-east-1"
		dynamodb_table = "reh-project-dbtable"
		encrypt = true
    }
}