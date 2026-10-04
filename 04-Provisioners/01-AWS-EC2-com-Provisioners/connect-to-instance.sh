echo "Conectando a instância:"
terraform output -raw instance_ip

ssh -i "aws-key" ec2-user@$(terraform output -raw instance_ip) 