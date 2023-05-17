variable "from" {
  description = "From address for email"
}

variable "to" {
  description = "Email recipients"
  type        = list(string)
}

variable "username" {
  description = "Username to authenticate with the SMTP server"
  type        = string
}

variable "password" {
  description = "Password to authenticate with the SMTP server"
  type        = string
}

resource "random_id" "default" {
  byte_length = 2
}

module "test" {
  source   = "../../"
  from     = var.from
  to       = var.to
  username = var.username
  password = var.password
  body     = file("message.tpl")
  subject  = "Test email $${random_id}"

  vars = {
    first_name = "John"
    random_id  = "${random_id.default.dec}"
  }
}
