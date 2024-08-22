#!/bin/bash

# Atualiza o sistema
sudo dnf update -y

# Instala as dependências necessárias
sudo dnf install -y yum-utils git

# Adiciona o repositório oficial do Docker
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Instala o Docker
sudo dnf install -y docker-ce docker-ce-cli containerd.io

# Inicia o serviço do Docker
sudo systemctl start docker

# Habilita o Docker para iniciar automaticamente no boot
sudo systemctl enable docker

# Verifica a instalação do Docker
sudo docker --version

# Baixa a última versão do Docker Compose
DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')

# Faz o download do Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/v${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Aplica permissões de execução
sudo chmod +x /usr/local/bin/docker-compose

# Verifica a instalação do Docker Compose
docker-compose --version

# Reinicia o Firewalld
sudo systemctl restart firewalld

echo "Docker e Docker Compose foram instalados com sucesso!"
