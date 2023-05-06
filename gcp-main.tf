resource "google_artifact_registry_repository" "my-repo" {
  location = var.region
  repository_id = "Hackaton"
  description = "Imagens Docker"
  format = "DOCKER"
}