resource "google_bigquery_dataset" "nti-dataset" {
  dataset_id                  = "nti_task_dataset"
  friendly_name               = "nti"
  location                    = "EU"
  default_table_expiration_ms = 3600000
}
