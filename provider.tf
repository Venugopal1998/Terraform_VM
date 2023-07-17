provider "google" {
credentials = file("C:\\Users\\narrareddy\\Terraform\\harsha-test-392010-60d8c3398e65.json")
project     = var.project  // specify your project id
region      = var.region // specify region
}