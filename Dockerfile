# Use a imagem base do Ubuntu 20.04
FROM ubuntu:20.04

# Defina o diretório de trabalho como /xmrig
WORKDIR /xmrig

# Copie o conteúdo da pasta atual para /xmrig
COPY . .

# Exponha a porta usada pelo XMRig
EXPOSE 3333
EXPOSE 2222

# Execute o XMRig na inicialização do contêiner
CMD ["./xmrig"]
