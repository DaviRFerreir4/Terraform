# Variaveis

- Existem diversas formas de atribuir valores a variáveis no terraform. Aqui estão algumas formas, seguindo sua ordem de precedência (quanto mais baixo maior é a prioridade)

## Adicionando valor as variáveis usando o ENV

- Você deve ter uma variavel de ambiente no model TF*VAR*"nome_da_variavel" para que ela seja atribuida a variavel sendo utilizada nos arquivos terraform

## Adicionado valor as variáveis usando um arquivo .tfvars

- Você deve ter um arquivo no projeto com a extensão .tfvars e colocar nele _nome da variavel_ = _valor_

## Adicionado valor as variáveis usando um arquivo .auto.tfvars

- Você deve ter um arquivo no projeto com a extensão .auto.tfvars e colocar nele _nome da variavel_ = _valor_

## Adicionado valor as variáveis na linha de comando

- Você deve rodar o comando "terraform plan -var _nome da variavel_=_valor_"

## Adicionado valor as variáveis carregando um arquivo de variáveis

- Você deve rodar o comando "terraform plan -var-file=_nome do arquivo_
