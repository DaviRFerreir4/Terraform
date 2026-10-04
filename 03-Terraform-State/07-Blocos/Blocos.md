# Blocos

## moved

- Informa um recurso que mudou de referência através dos atributos from e to

## removed

- Informa um recurso que não será mais gerenciado pelo terraform através do atributo from e lifecycle, informando se o recurso será ou não destruido

## import

- Traz um recurso para que ele seja gerenciado pelo terraform através do atributo to e id

## comando extra: terraform plan -generate-config-out=_nome do arquivo_

- Precisa de um bloco de import configurado sem uma referência no código. Traz esse recurso para que ele seja gerenciado pelo terraform através do atributo to e id e gera o código dele no arquivo indicado (que não pode existir previamente)
