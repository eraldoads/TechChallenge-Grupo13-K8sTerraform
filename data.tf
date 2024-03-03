data "aws_db_instance" "database" {  
}

data "aws_ecr_image" "piklesfastfood_image" {
  repository_name = "ecr-${var.projectName}"
  image_tag       = "latest"
}