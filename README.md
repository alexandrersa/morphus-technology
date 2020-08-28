# Vulnerability Manager

### Arquitetura do Projeto

Desenvolvido em ambiente dockerizado, com separação do ambiente da aplicação com o banco de dados. Criado uma ferramenta de deploy onde automaticamente configura as dependências, com os dados presentes no arquivo de ambiente. Deve ser alterado o nome do arquivo .env-example para .env e popular com os dados do seu ambiente.

Todo o processo de automação foi executado no arquivo start.sh, (criação do ambiente e importação da massa de dados.)

O script que executa a inserção dos dados encontra-se na pasta scripts, import_vulnerability.py.

As views foram separadas de acordo com as API para uma melhor leitura e manutenção futura.


### Como executar

Inicialmente é dada a permissão de execução nos scripts de start, stop e restart com os comandos:

```
$ chmod +x start.sh
$ chmod +x stop.sh
$ chmod +x restart.sh
```

Para iniciar o ambiente docker deve-se utilizar o comando abaixo, ao final será solicitada uma senha para o super usuário, após inserido já deve ser possível efetuar o login com as credenciais informadas.

```
$ ./start.sh
```

Para derrubar as instâncias deve-se utilizar o seguinte comando.

```
$ ./stop.sh
```

Caso deseje reiniciar a aplicação é necessário executar o comando de restart.

```
$ ./restart.sh
```

### Como Obter as credencias para requisição a API


Com a posse das suas credenciais, então acesse http://localhost:8000/api-token-auth/ para solicitar suas credenciais de acesso, ou via terminal utilizando o comando

```
$ curl -X POST -d "username=<usuario>&password=<senha>" http://localhost:8000/api-token-auth/
```

### Requisições a API

#### API para HOST


Listagem dos Host, deve retornar pelo menos o nome do host, endereço de IP, risco e quantidade de vulnerabilidades não corrigidas.
```
http://localhost:8000/api/v1/hosts
```

Deve ser possível filtrar por uma vulnerabilidade específica.
Ao filtrar por um vulnerabilidade específica, deve ser exibido hosts onde a vulnerabilidade ainda não foi corrigida.
```
http://localhost:8000/api/v1/hosts/details?search=internet+explorer
```

Detalhe do Host, deve retornar todos os detalhes do host, suas vulnerabilidades corrigidas e não corrigidas.
```
http://localhost:8000/api/v1/hosts/details
```

#### API para Vulnerabilidades

Listagem das Vulnerabilidades, deve retornar pelo menos o nome da vulnerabilidade, severidade, cvss, data de publicação e a quantidade de hosts afetados.

```
http://localhost:8000/api/v1/vulnerabilidades/
```

Deve ser possível filtrar por severidade ou por um host específico.

```
http://localhost:8000/api/v1/vulnerabilidades/details?search=Alto
http://localhost:8000/api/v1/vulnerabilidades/details?search=SERVER-2
http://localhost:8000/api/v1/vulnerabilidades/details?search=SERVER-2&severity=Alto
```

#### API para Dashboard

Card com total de hosts e total de hosts vulneráveis.
```
http://localhost:8000/api/v1/dashboard/total
```

Card com total de vulnerabilidades e total de vulnerabilidades não corrigidas.
```
http://localhost:8000/api/v1/dashboard/not_corrected
```

Card com média de risco dos hosts.
```
http://localhost:8000/api/v1/dashboard/medium
```

Gráfico com a distribuição de vulnerabilidade não corrigidas por severidade.
```
http://localhost:8000/api/v1/dashboard/graph_not_corrected
```

Gráfico com top 10 hosts mais vulneráveis.
```
http://localhost:8000/api/v1/dashboard/top_ten_vulnerabilities
```
