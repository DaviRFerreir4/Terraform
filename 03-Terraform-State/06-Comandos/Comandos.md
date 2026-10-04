# Comandos

## terraform show

- Caso eu referêncie um arquivo output de um terraform plan, ele me mostrará o planejamento do arquivo
- Caso eu simplesmente rode terraform show, ele mostrará o state do terraform em um formato user friendly

## terraform state

- terraform state list: lista os recursos que estão sendo gerenciados pelo terraform
- terraform state mv: move a referência de um recurso para outra. Ex: terraform state mv aws_s3_bucket.bucket_1 aws_s3_bucket.bucket_um
- terraform state pull: baixa o state remoto. Caso seja seguido de um "> _nome do arquivo_.tfstate" ele grava esse state baixado num arquivo
- terraform state push -force _nome do arquivo_.tfstate: envia um arquivo .tfstate para o state remoto. A flag -force serve para enviar states com serial numbers mais antigos que o atual do state remoto (para voltar o state para um backup anterior)
- terraform state replace-provider registry.terraform.io/_endpoint do provider antigo_ registry.terraform.io/_endpoint do provider novo_: altera um provider informado no state para outro
- terraform state show _recurso do terraform_ _(\_recurso do terraform_ pode ser encontrado no comando terraform state list): lista um recurso específico do state do terraform
- terraform state rm _recurso do terraform_ (_recurso do terraform_ pode ser encontrado no comando terraform state list): remove um recurso de um state, fazendo com que esse recurso continue a existir mas não seja mais gerenciado pelo terraform

## terraform import

- terraform import _tipo de recurso_._referência interna do recurso_ _referência do recurso no provider_: traz um recurso já criado no provider para que ele seja gerenciado pelo terraform conforme a referência interna especificada

## terraform refresh

- Faz um refresh do state para que ele reflita as alterações que possam ter sido feitas através de outra ferramenta do provider
- Tem desvantagens, pois não atualiza o código do terraform, então ao rodar um terraform plan sem alterar o código, ele vai querer remover as alterações que foram obtidas no state

## terraform init

- terraform init -reconfigure: é utilizado quando você quer mudar alguma configuração relacionada ao backend, criando uma nova referência a outro backend mas com o state zerado, então ele irá querer criar todos os recursos do zero
- terraform init -migrate-state: é utilizado quando você quer mudar alguma configuração relacionada ao backend, mas dessa vez migrando o state do backend original para o novo
- terraform init -force-copy: mesma coisa do de cima, mas não pede confirmação
- terraform init -backend-config=_arquivo do backend_.hcl: muito usado em pipelines, onde não existe o .terraform, .terraform.lock.hcl, plan.out e .tfstate, esse comando passa configurações que serão utilizadas no backend, permitindo a separação de ambientes como dev, uat, prod

## terraform force-unlock

- Faz com que um state lock que tenha sido bloqueado seja forçadamente desbloqueado, passando o id da lock que foi feita. É útil caso por algum motivo ele tenha entrado em lock e o processo que estivesse utilizando ele tenha sido interrompido no meio
