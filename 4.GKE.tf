resource "google_container_cluster" "t-cluster" {
  name               = "my-cluster"
  location           = "europe-west1-b"
  initial_node_count = 3
  network = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet1.name
  node_config {
    disk_size_gb = 10
    disk_type = "pd-standard"
    machine_type = "e2-micro"
    image_type = "ubuntu"
  }
  timeouts {
    create = "30m"
    update = "40m"
  }
}