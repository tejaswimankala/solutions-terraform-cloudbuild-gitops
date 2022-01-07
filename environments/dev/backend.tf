


terraform {
  backend "gcs" {
    bucket = "new-12"
    prefix = "env/dev"
  }
}
