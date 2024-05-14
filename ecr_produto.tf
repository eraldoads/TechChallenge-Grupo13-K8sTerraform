resource "aws_ecr_repository" "repository_produto" {
  name                 = "ecr-produto"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}

resource "aws_ecr_repository_policy" "repository-policy_produto" {
  repository = aws_ecr_repository.repository_produto.name

  policy = <<EOF
    {
        "Version": "2008-10-17",
        "Statement": [
        {
            "Sid": "new policy",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::${var.AWSAccount}:root"
            },
            "Action": [
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "ecr:BatchCheckLayerAvailability",
                "ecr:PutImage",
                "ecr:InitiateLayerUpload",
                "ecr:DescribeRepositories",
                "ecr:GetRepositoryPolicy",
                "ecr:ListImages",
                "ecr:DeleteRepository",
                "ecr:BatchDeleteImage",
                "ecr:SetRepositoryPolicy",
                "ecr:DeleteRepositoryPolicy"
            ]   
        }
      ]
    }
    EOF
}

resource "aws_ecr_lifecycle_policy" "repository-lifecycle-produto" {
  repository = aws_ecr_repository.repository_produto.name

  policy = <<EOF
    {
        "rules": [
            {
                "rulePriority": 1,
                "description": "Expire images count more than 5",
                "selection": {
                    "tagStatus": "any",
                    "countType": "imageCountMoreThan",
                    "countNumber": 5
                },
                "action": {
                    "type": "expire"
                }
            }
        ]
    }
    EOF
}
