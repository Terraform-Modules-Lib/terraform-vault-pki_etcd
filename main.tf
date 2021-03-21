terraform {
  required_version = "~> 0.14"
  
  required_providers {
  }
}

locals {
  name = var.name
  path_prefix = var.path_prefix
  urls_prefix = var.urls_prefix
  parent_authority_path = var.parent_authority_path
}

module "this" {
  source = "github.com/Terraform-Modules-Lib/terraform-vault-authority"
  
  name = local.name
  
  path_prefix = local.path_prefix
  urls_prefix = local.urls_prefix
  
  parent_authority_path = local.parent_authority_path
}
  
resource "vault_pki_secret_backend_role" "server" {
  depends_on = [module.this]
  
  name = "server"
  backend = module.this.authority.backend
}

resource "vault_pki_secret_backend_role" "client" {
  depends_on = [module.this]
  
  name = "client"
  backend = module.this.authority.backend
}
    
resource "vault_pki_secret_backend_role" "peer" {
  depends_on = [module.this]
  
  name = "peer"
  backend = module.this.authority.backend
}
