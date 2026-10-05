echo "Conectando a instância:"
terraform output -raw vm_ip

ssh -i "azure-key" terraform@$(terraform output -raw vm_ip)