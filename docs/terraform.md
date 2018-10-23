
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| body | Email body template | string | - | yes |
| enabled | Flag to enable or disable the sending of emails | string | `true` | no |
| from | From address for email | string | - | yes |
| host | SMTP Host | string | `smtp.mailgun.org` | no |
| mail_command | Command to execute | string | `email` | no |
| password | Password to authenticate with the SMTP server | string | - | yes |
| port | SMTP Port | string | `587` | no |
| subject | Email subject template | string | - | yes |
| to | Email recipients | list | - | yes |
| username | Username to authenticate with the SMTP server | string | - | yes |
| vars | Parameters to pass to the body template | string | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| body | Rendered body of the email |
| subject | Rendered subject of the email |

