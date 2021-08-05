resource "google_compute_firewall" "default" {
  name    = "allow-all-firewall"
  network = google_compute_network.vpc.name

  allow {   
    protocol = "tcp"
    ports    = ["8080"]
  }
}
