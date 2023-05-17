from    = "ops@cloudposse.com"
to      = ["erik@cloudposse.com"]
subject = "Test email"
body    = "Hello ${first_name}"
vars = {
  first_name = "Erik"
}
