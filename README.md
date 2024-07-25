#Requisitos: docker, sqlserver, .net core 8.0

  - Passo 1: clonar o projeto 
  - passo 2: compilar o projeto para instalar as dependencias
  - passo 3: Rodar a aplicação através do dockerfile para criar a imagem do back-end que no meu caso era TechNationFinanceiroApi
  - passo 4: Rodar o comando `docker network create thechnationnetwork` para criar a network que irá conectar o back-end e o sqlserver
  - passo 5: Rodar o comando `docker network connect thechnationnetwork TechNationFinanceiroApi` para conectar o back-end com a nwtwork
  - Passo 6: Rodar o comando `docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=NovaSenha123!" -p 1433:1433 --name sqlserver-container2 -d mcr.microsoft.com/mssql/server:latest` para criar a imagem docker do sqlserver
  - Passo 7: Rodar o comando `docker network connect thechnationnetwork sqlserver-container2` para conectar a nossa imagem docker sqlserver com a network
  - Passo 7: Acessar o sql management studio com o nome do servidor `localhost,1433` usaurio `sa` senha `NovaSenha123!`
  - Passo 8: Criar banco de dados TechNationFinanceiroDB e Rodar os scripts para a criação de dados tabelas e inserção dos dados
  - Passo 9: Reiniciar as imagens docker do back-end e do banco de dados
  - Passo 9.1: (recomendado) rodar o comando  docker inspect thechnationnetwork e verificar se o banco e o back-end está conectado
  - Aviso: cuidado ao compilar a aplicação pois as vezes o back-end se desconcta com a network caso ocorres basta rodar o comando `docker network connect thechnationnetwork TechNationFinanceiroApi` e reiniciar a imagem do back-end
  - Passo 10: Rodar a aplicação com o dockerfile selecionado ao fazer isso o Swagger vai abrir listando todas as rotas, nessa aplicação eu utilizei O JWT, para conseguir o token Basta mandar uma requisição post para `https://localhost:5001/api/User/login`
   com esse json no corpo da solicitação: 
    {
      "username": "admin",
      "password": "senha123"
    }
  - Passo 10.1 Tendo o token basta adiciona-lo em authorize do Swagger ou envialo no header da aplicação como token baerer
      
