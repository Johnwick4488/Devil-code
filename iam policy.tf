module "iam_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
 eks
  version = "5.28.0"

  name        = "mad-policy"
  path        = "/"
  description = "AmazonEKSClusterPolicy"
=======

  name        = "mad-policy"
  path        = "/"
  description = "AdministratorAccess"
 main

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}