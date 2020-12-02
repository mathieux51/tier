resource aws_dynamodb_table terraform_lock {
  name         = "terraform-lock-1606648481"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource aws_s3_bucket terraform_state {
  force_destroy = true
  bucket        = "terraform-remote-state-1606648481"
  versioning {
    enabled = true
  }
}

resource aws_s3_bucket store {
  force_destroy = true
  bucket        = var.bucket_name
  versioning {
    enabled = true
  }
}

resource aws_s3_bucket_object store {
  bucket = var.bucket_name
  key    = "store-me.txt"
  source = "store-me.txt"
  depends_on = [
    aws_s3_bucket.store
  ]
}
