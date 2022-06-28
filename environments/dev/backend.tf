


terraform {
  backend "gcs" {
    bucket = "tejaswi-test-tfstate"
    prefix = "env/dev"
  }
}
