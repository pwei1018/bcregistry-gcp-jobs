variable "environment" {
  type = object({
    project_id     = string
    sa             = string
    tag            = string
  })
  description = "GCP project parameters"

  default = {
    project_id      = "c4hnrd-dev"
    sa              = "terraform-sa"
    tag             = "dev"
  }
}

variable "jobs" {
  type = list(object({
    name                   = string
    trigger                = string
    vault_section          = string
  }))

  description = "OpenShift database reindexing jobs"

  default = [
    {
      name          = "worksafe-job"
      trigger       = "worksafe-notebook"
      vault_section = "entity-db2"
    },
    {
      name          = "worksafe2-job"
      trigger       = "worksafe2-notebook"
      vault_section = "entity-db2"
    }
  ]
}

variable "region" {
    default = "northamerica-northeast1"
}

variable "data_dir" {
  default = "/opt/app-root/data/"
}

variable "registry_repo" {
    default = "job-repo"
}

variable "db_connection" {
  type = object({
    host = string
    port = string
    db_user = string
    oc_server = string
    })
  description = "oc port forwarded db connection"
  default = {
    host = "localhost"
    port = "8006"
    db_user="postgres"
    oc_server="https://api.silver.devops.gov.bc.ca:6443"
  }
}
