terraform {
    backend "gcs" {
        bucket = "ca-demo-tf-state"
        prefix = "terraform/state"
    }
}

provider "google" {
    version = "~> 1.7"
    project = "cl-terraform"
}

provider "kubernetes" {
    version = "1.0.1"

    host = "${google_container_cluster.primary.endpoint}"
    username = "${google_container_cluster.primary.auth.0.username}"
    password = "${google_container_cluster.primary.auth.0.password}"
  
}
