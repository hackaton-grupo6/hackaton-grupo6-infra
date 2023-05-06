# Criando Repositorio
resource "google_artifact_registry_repository" "my-repo" {
  location = var.region
  repository_id = "repos-fiap-grupo06"
  description = "Imagens Docker"
  format = "DOCKER"
}

# Criando a Instância Banco de Dados mySQL
resource "google_sql_database" "database" {
  name     = "sql-fiap-grupo06-prod"
  instance = google_sql_database_instance.instance.name
}