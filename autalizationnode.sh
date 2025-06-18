#!/bin/bash

echo "========================================="
echo " Instalador do Node.js 22.x para Ubuntu e Mint"
echo "========================================="

# Função para perguntar sim ou não
pergunta() {
    while true; do
        read -p "$1 (s/n): " resposta
        case $resposta in
            [Ss]* ) return 0 ;;
            [Nn]* ) return 1 ;;
            * ) echo "Por favor, responda s (sim) ou n (não)." ;;
        esac
    done
}

# Atualizar sistema (opcional)
if pergunta "Deseja atualizar o sistema?"; then
    sudo apt update && sudo apt upgrade -y
    echo " Sistema atualizado."
fi

# Instalar dependências
echo "🔧 Instalando dependências..."
sudo apt install -y curl

# Adicionar repositório do Node.js 22.x
echo " Adicionando repositório do Node.js 22.x..."
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -

# Instalar Node.js
echo " Instalando Node.js..."
sudo apt install -y nodejs

# Verificar instalação
echo "========================================="
echo " Node.js instalado com sucesso!"
node -v
npm -v
echo "========================================="

# Perguntar se deseja instalar o Yarn
if pergunta "Deseja instalar o Yarn (gerenciador de pacotes)?"; then
    sudo npm install -g yarn
    echo "✅ Yarn instalado. Versão:"
    yarn -v
fi

echo " Instalação concluída com sucesso!"

