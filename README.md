# aws_ecs_terraform

terraform init

terraform plan -var-file=env/tfvars -out outfile

terraform apply "outfile"

terraform destroy -var-file=env/test.tfvars

Testing: Hit the ALB DNS and verify the Nginx default page
