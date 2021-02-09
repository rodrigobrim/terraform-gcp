resource "google_project_service" "gcp_services" {
  count   = length(var.gcp_service_list)
  project = var.project
  service = var.gcp_service_list[count.index]
  disable_dependent_services = true
}

resource "time_sleep" "wait_for_apis_by_2mins" {
  depends_on = [google_project_service.gcp_services]
  create_duration = "120s"
}

resource "time_sleep" "wait_for_apis_by_5mins" {
  depends_on = [google_project_service.gcp_services]
  destroy_duration = "300s"
}
