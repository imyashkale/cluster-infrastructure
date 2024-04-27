data "terraform_remote_state" "vpc" {
  backend = "remote"
  config = {
    organization = "ULTRA"
    workspaces = {
      name = "networking-layer"
    }
  }
}
