# Vulnerability Manager

### Arquitetura do Projeto

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


Com a posse das suas credenciais, então acesse http://localhost:8000/api/token/ para solicitar suas credenciais de acesso.
