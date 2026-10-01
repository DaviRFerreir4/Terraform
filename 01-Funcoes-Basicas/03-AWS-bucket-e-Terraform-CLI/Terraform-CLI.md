# Terraform CLI

## Comandos utilizados

- terraform -help: mostra comandos e detalhes deles
- terraform _comand_ -help: mostra detalhes de um comando específico
- terraform providers: mostra os providers que serão necessários para a configuração escrita
- terraform init: baixa os providers na pasta .terraform e cria um arquivo .lock.hcl com detalhes dos providers baixados
- terraform fmt -check: mostra quais arquivos serão alterados pelo comando fmt (format)
- terraform fmt -diff: formata e mostra a diferença do código formatado
- terraform validate: verifica se a configuração do código é valida
- terraform plan: mostra as alterações que serão feitas
- terraform plan -out _file.out_: cria um arquivo de output com o resultado do comando plan
- terraform show _file.out_: mostra o output gravado no arquivo pelo comando anterior
- terraform apply: inicia o processo de criação dos recursos especificados nos arquivos .tf
- terraform apply -destroy: desfaz tudo que foi criado
- terraform apply -auto-approve: cria os recursos sem aprovação do usuário
- terraform destroy: alias para _terraform apply -destroy_
- terraform apply _file.out_: cria os recursos do plano especificado no arquivo
- terraform plan -out _destruction-file.out_ -destroy: cria um plano para destruir uma configuração
- terraform apply _destruction-file.out_: destroi recursos baseado no plano
