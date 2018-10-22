<!-- This file was automatically generated by the `build-harness`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->


[![Cloud Posse](https://cloudposse.com/logo-300x69.svg)](https://cloudposse.com)

# terraform-null-smtp-mail [![Build Status](https://travis-ci.org/cloudposse/terraform-aws-iam-system-user.svg?branch=master)](https://travis-ci.org/cloudposse/terraform-aws-iam-system-user) [![Latest Release](https://img.shields.io/github/release/cloudposse/terraform-aws-iam-system-user.svg)](https://github.com/cloudposse/terraform-aws-iam-system-user/releases/latest) [![Slack Community](https://slack.cloudposse.com/badge.svg)](https://slack.cloudposse.com)


Terraform Module to send emails using an SMTP server by calling an external `email` command.


---

This project is part of our comprehensive ["SweetOps"](https://docs.cloudposse.com) approach towards DevOps. 


It's 100% Open Source and licensed under the [APACHE2](LICENSE).









## Introduction

This terraform module uses an external command using the [`local-exec`](https://www.terraform.io/docs/provisioners/local-exec.html) provisioner to send emails. It's ideally suited for sending transactional emails
related to the `apply` phase. For example, notifying a user of their [IAM user account](https://github.com/cloudposse/terraform-aws-iam-user) getting created or the deployment of a new [ECS application](https://github.com/cloudposse/terraform-aws-ecs-web-app).

**NOTE:** The `null` refers to the primary Terraform [provider](https://www.terraform.io/docs/providers/null/index.html) used in this module.

## Dependencies

  First install the latest release of the `email` cli tool here: https://github.com/wrouesnel/emailcli/releases

  Make sure it exists in your `PATH` (E.g. `/usr/local/bin`)

  We distribute an Alpine Linux package (`emailcli`) as part of our [toolchain](https://github.com/cloudposse/packages).

  ```
  curl -sSL https://apk.cloudposse.com/install.sh | sudo bash
  apk add emailcli@cloudposse
  ```

## Usage



```hcl
module "welcome" {
  source     = "git::https://github.com/cloudposse/terraform-null-smtp-mail.git?ref=master"
  host       = "smtp.mailgun.org"
  port       = "587"
  username   = "postmaster@ourdomain.com"
  password   = "changeme"
  from       = "admin@yourdomain.com"
  to         = ["example@yourdomain.com"]
  subject    = "Welcome $${first_name}"
  body       = "Your account has been created. Login here: $${homepage}"

  vars = {
    first_name = "Example"
    homepage   = "https://cloudposse.com"
  }
}
```

__NOTE:__ Use the `file(...)` interpolation function to use a template file. 






## Makefile Targets
```
Available targets:

  help                                Help screen
  help/all                            Display help for all targets
  help/short                          This help short screen
  lint                                Lint terraform code

```

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




## Related Projects

Check out these related projects.

- [emailcli](https://github.com/wrouesnel/emailcli) - 12-factor compatible command line tool for sending emails that is written in Go.



## Help

**Got a question?**

File a GitHub [issue](https://github.com/cloudposse/terraform-null-smtp-mail/issues), send us an [email][email] or join our [Slack Community][slack].

## Commercial Support

Work directly with our team of DevOps experts via email, slack, and video conferencing. 

We provide [*commercial support*][commercial_support] for all of our [Open Source][github] projects. As a *Dedicated Support* customer, you have access to our team of subject matter experts at a fraction of the cost of a full-time engineer. 

[![E-Mail](https://img.shields.io/badge/email-hello@cloudposse.com-blue.svg)](mailto:hello@cloudposse.com)

- **Questions.** We'll use a Shared Slack channel between your team and ours.
- **Troubleshooting.** We'll help you triage why things aren't working.
- **Code Reviews.** We'll review your Pull Requests and provide constructive feedback.
- **Bug Fixes.** We'll rapidly work to fix any bugs in our projects.
- **Build New Terraform Modules.** We'll develop original modules to provision infrastructure.
- **Cloud Architecture.** We'll assist with your cloud strategy and design.
- **Implementation.** We'll provide hands-on support to implement our reference architectures. 


## Community Forum

Get access to our [Open Source Community Forum][slack] on Slack. It's **FREE** to join for everyone! Our "SweetOps" community is where you get to talk with others who share a similar vision for how to rollout and manage infrastructure. This is the best place to talk shop, ask questions, solicit feedback, and work together as a community to build *sweet* infrastructure.

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/cloudposse/terraform-null-smtp-mail/issues) to report any bugs or file feature requests.

### Developing

If you are interested in being a contributor and want to get involved in developing this project or [help out](https://github.com/orgs/cloudposse/projects/3) with our other projects, we would love to hear from you! Shoot us an [email](mailto:hello@cloudposse.com).

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

 1. **Fork** the repo on GitHub
 2. **Clone** the project to your own machine
 3. **Commit** changes to your own branch
 4. **Push** your work back up to your fork
 5. Submit a **Pull Request** so that we can review your changes

**NOTE:** Be sure to merge the latest changes from "upstream" before making a pull request!


## Copyright

Copyright © 2017-2018 [Cloud Posse, LLC](https://cloudposse.com)



## License 

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) 

See [LICENSE](LICENSE) for full details.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.









## Trademarks

All other trademarks referenced herein are the property of their respective owners.

## About

This project is maintained and funded by [Cloud Posse, LLC][website]. Like it? Please let us know at <hello@cloudposse.com>

[![Cloud Posse](https://cloudposse.com/logo-300x69.svg)](https://cloudposse.com)

We're a [DevOps Professional Services][hire] company based in Los Angeles, CA. We love [Open Source Software](https://github.com/cloudposse/)!

We offer paid support on all of our projects.  

Check out [our other projects][github], [apply for a job][jobs], or [hire us][hire] to help with your cloud strategy and implementation.

  [docs]: https://docs.cloudposse.com/
  [website]: https://cloudposse.com/
  [github]: https://github.com/cloudposse/
  [commercial_support]: https://github.com/orgs/cloudposse/projects
  [jobs]: https://cloudposse.com/jobs/
  [hire]: https://cloudposse.com/contact/
  [slack]: https://slack.cloudposse.com/
  [linkedin]: https://www.linkedin.com/company/cloudposse
  [twitter]: https://twitter.com/cloudposse/
  [email]: mailto:hello@cloudposse.com


### Contributors

|  [![Erik Osterman][osterman_avatar]][osterman_homepage]<br/>[Erik Osterman][osterman_homepage] | [![Igor Rodionov][goruha_avatar]][goruha_homepage]<br/>[Igor Rodionov][goruha_homepage] | [![Andriy Knysh][aknysh_avatar]][aknysh_homepage]<br/>[Andriy Knysh][aknysh_homepage] |
|---|---|---|

  [osterman_homepage]: https://github.com/osterman
  [osterman_avatar]: https://github.com/osterman.png?size=150
  [goruha_homepage]: https://github.com/goruha
  [goruha_avatar]: https://github.com/goruha.png?size=150
  [aknysh_homepage]: https://github.com/aknysh
  [aknysh_avatar]: https://github.com/aknysh.png?size=150


