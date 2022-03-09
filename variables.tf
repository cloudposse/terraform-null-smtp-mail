variable "enabled" {
  description = "Flag to enable or disable the sending of emails"
  default     = "true"
}

variable "from" {
  description = "From address for email"
}

variable "to" {
  description = "Email recipients"
  type        = list
}

variable "subject" {
  description = "Email subject template"
}

variable "body" {
  description = "Email body template"
}

variable "username" {
  description = "Username to authenticate with the SMTP server"
  type        = string
}

variable "password" {
  description = "Password to authenticate with the SMTP server"
  type        = string
}

variable "host" {
  description = "SMTP Host"
  default     = "smtp.mailgun.org"
}

variable "port" {
  description = "SMTP Port"
  default     = "587"
}

variable "vars" {
  description = "Parameters to pass to the body template"
  default     = {}
}

# We recommend the following tool:
#   https://github.com/wrouesnel/emailcli
variable "mail_command" {
  description = "Command to execute"
  default     = "email"
}
