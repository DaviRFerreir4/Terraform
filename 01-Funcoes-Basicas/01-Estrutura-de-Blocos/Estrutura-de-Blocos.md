# Estrutura de blocos da HCL

## Tipos de blocos

- terraform: configurações do terraform (versões de providers, terraform, definições do backend, etc...)
- provider: define configurações para a estrutura que você está criando de um provider (ex: configs da AWS)
- resource: cria um recurso especificado pela primeira aspas que tem um nome especificado pela segunda aspas (nome do recurso que é utilizado somente dentro do código). Dentro do bloco são definidas configurações para ele
- data (datasource): busca informações de recursos que não estão sendo geridos pelo terraform
- module: pedaços de código que não estão no mesmo diretorio que tem uma função especifica (Ex: módulo para a criação de uma rede)
- variable: variaveis que podem ser utilizadas no código
- output: envia informações de dentro do código para alguma fonte externa
- locals: serve para criar pedaços de código que se repetiriam para que eles possam ser reutilizados em outros blocos
- import: importa um determinado recurso para que ele possa ser gerenciado pelo terraform
- moved: altera a referência interna de um bloco do terraform
- removed: indica recursos que não serão mais gerenciados pelo terraform
- check: verifica condicionais referente a recursos gerenciados pelo terraform e retorna um aviso caso elas sejam falsas
