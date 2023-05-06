# Criando Repositorio
resource "google_artifact_registry_repository" "my-repo" {
  location = var.region
  repository_id = "repos-fiap-grupo06"
  description = "Imagens Docker"
  format = "DOCKER"
}

# Criando a instância Base de Dados mySQL
resource "google_sql_database_instance" "instance" {
  name             = "sql-fiap-grupo06-prod"
  region           = "us-central1"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "true"
}