#!/usr/bin/env bash
# Instala o Prospectar no Mac ou Linux (compila a partir do código).
# Uso: bash instalar.sh
set -euo pipefail
cd "$(dirname "$0")"

if ! command -v go >/dev/null 2>&1; then
    if [ -x "$HOME/.prospectar-go/go/bin/go" ]; then
        export PATH="$HOME/.prospectar-go/go/bin:$PATH"
    else
        versao=$(awk '/^go /{print $2}' go.mod)
        so=$(uname -s | tr '[:upper:]' '[:lower:]')
        case "$(uname -m)" in
            x86_64) arq=amd64 ;;
            arm64|aarch64) arq=arm64 ;;
            *) echo "Arquitetura não suportada: $(uname -m)"; exit 1 ;;
        esac
        echo "Instalando Go $versao (só pra compilar, em ~/.prospectar-go)..."
        mkdir -p "$HOME/.prospectar-go"
        curl -fsSL "https://go.dev/dl/go${versao}.${so}-${arq}.tar.gz" | tar -xz -C "$HOME/.prospectar-go"
        export PATH="$HOME/.prospectar-go/go/bin:$PATH"
    fi
fi

echo "Compilando..."
go build -ldflags "-s -w" -o prospectar .

echo
echo "Prospectar instalado. Pra abrir: bash abrir.sh"
