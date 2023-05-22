


terraform {
  backend "gcs" {
    bucket = "weighty-replica-383308-tfstate"
    prefix = "env/dev"
  }
}
