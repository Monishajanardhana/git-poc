terraform {
  backend "gcs" {
    bucket = "new-bucket"
    prefix = "terraform/Organisation/state"
  }
}
