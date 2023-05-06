# Criando Repositorio
resource "google_artifact_registry_repository" "my-repo" {
  location = var.region
  repository_id = "repos-fiap-grupo06"
  description = "Imagens Docker"
  format = "DOCKER"
}

# Criando o storage para o dump do sql
resource "google_storage_bucket" "image-store" {
  name     = "image-store-bucket"
  location = "US"
}

resource "google_storage_default_object_access_control" "public_rule" {
  bucket = image-store-bucket
  role   = "READER"
  entity = "allUsers"
}

# Criando a instância Base de Dados mySQL
resource "google_sql_database_instance" "instance" {
  name             = "sql-fiap-grupo06-prod"
  region           = "us-central1"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
    dump_file_path     = "gs://image-store-bucket/Playlist.sql"
  }
  deletion_protection  = "true"
}
