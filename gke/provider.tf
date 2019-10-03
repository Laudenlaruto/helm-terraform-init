provider "google" {
  credentials = "${file("account.json")}"
  project     = "padok-training-lab"
  region      = "us-central1"
}
provider "kubernetes" {}
