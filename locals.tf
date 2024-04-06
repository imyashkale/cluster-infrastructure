locals {
  name = "${var.application}-${var.enviroment}"
  tags = {
    Enviroment  = var.enviroment
    Application = var.application
  }
}
