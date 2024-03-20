#!/bin/bash

# Inicializar variável para o arquivo de configuração
config_file=""

# Processar argumentos da linha de comando
while getopts "c:" opt; do
  case ${opt} in
    c )
      config_file=$OPTARG
      ;;
    \? )
      echo "Uso: cmd [-c] <arquivo de configuração>"
      exit 1
      ;;
  esac
done

# Verificar se o arquivo de configuração foi fornecido
if [ -z "$config_file" ]; then
    echo "Por favor, forneça um arquivo de configuração com -c"
    exit 1
fi

# Executar o modprobe msr
sudo modprobe msr

# Clone o repositório Git
git clone https://github.com/alexiusstrauss/TrueMining-Docker.git

# Entre no diretório clonado
cd TrueMining-Docker/

# Crie uma nova sessão de screen em segundo plano com um nome específico
screen -dmS mining

# Leia o comando do arquivo de configuração especificado e execute-o dentro da sessão de screen
screen -S mining -X stuff "$(cat ${config_file})\n"

echo "O script foi executado, e o minerador está rodando em uma sessão de screen chamada 'mining'."
echo "Use 'screen -r mining' para acessar a sessão."
