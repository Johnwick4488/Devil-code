module "iam_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"

  name          = "mad-dev"
  force_destroy = true

  pgp_key = "keybase:test"

  password_reset_required = false
}

resource "aws_iam_user_policy_attachment" "attachment" {
  user         = "mad-dev"
  policy_arn  = module.iam_policy.arn
}
