resource "google_service_account" "nti_service_account" {
  account_id   = "nti-sv-id"
  display_name = "nti-sv"
  
}



resource "google_service_account_iam_binding" "compute-admin" {
  service_account_id = google_service_account.nti_service_account.name
  role               = "roles/iam.serviceAccountUser"

  members = [
    "user:magicleboy@gmail.com"
  ]
}