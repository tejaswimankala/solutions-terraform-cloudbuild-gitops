


terraform {
  backend "gcs" {
    bucket = "jan-10-1"
    prefix = "env/dev"
  }
}
