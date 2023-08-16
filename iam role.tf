module "iam_assumable_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "5.28.0"

  trusted_role_arns = [
    "arn:aws:iam::102057119514:user/mad-dev",
  ]

  create_role = true

  role_name         = "mad-dev-role"
  role_requires_mfa = true

  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
  ]
  number_of_custom_role_policy_arns = 1
}