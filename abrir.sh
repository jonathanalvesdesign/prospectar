#!/usr/bin/env bash
# Sobe o Prospectar em segundo plano e abre no navegador.
# Pra desligar: kill $(cat webdata/prospectar.pid)
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p webdata

# telemetria já vem desligada por padrão
nohup ./prospectar -web -addr 127.0.0.1:8080 -data-folder webdata > webdata/prospectar.log 2>&1 &
echo $! > webdata/prospectar.pid

sleep 3
url=http://localhost:8080
if command -v open >/dev/null 2>&1; then open "$url"; else xdg-open "$url" >/dev/null 2>&1 || echo "Abra $url no navegador"; fi
