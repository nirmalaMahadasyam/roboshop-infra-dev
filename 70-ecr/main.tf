resource "aws_ecr_repository" "mongodb" {
  name                 = "${var.project_name}/${var.environment_name}/mongodb"
  image_tag_mutability = "MUTABLE"
  force_delete = true
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "frontend" {
  name                 = "${var.project_name}/${var.environment_name}/frontend"
  image_tag_mutability = "MUTABLE"
  force_delete = true
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "catalogue" {
  name                 = "${var.project_name}/${var.environment_name}/catalogue"
  image_tag_mutability = "MUTABLE"
  force_delete = true
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "cart" {
  name                 = "${var.project_name}/${var.environment_name}/cart"
  image_tag_mutability = "MUTABLE"
  force_delete = true
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "user" {
  name                 = "${var.project_name}/${var.environment_name}/user"
  image_tag_mutability = "MUTABLE"
  force_delete = true
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "shipping" {
  name                 = "${var.project_name}/${var.environment_name}/shipping"
  image_tag_mutability = "MUTABLE"
  force_delete = true
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "payment" {
  name                 = "${var.project_name}/${var.environment_name}/payment"
  image_tag_mutability = "MUTABLE"
  force_delete = true
  image_scanning_configuration {
    scan_on_push = true
  }
}