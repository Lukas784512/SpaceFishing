#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECT_FILE="$ROOT_DIR/default.project.json"
PORT="${ROJO_PORT:-34872}"

cd "$ROOT_DIR"

if [ ! -f "$PROJECT_FILE" ]; then
	echo "FAIL: default.project.json nao existe em $ROOT_DIR."
	exit 1
fi

if ! command -v rojo >/dev/null 2>&1; then
	echo "FAIL: comando 'rojo' nao encontrado. Rode 'aftman install'."
	exit 1
fi

current_listener="$(lsof -nP -iTCP:"$PORT" -sTCP:LISTEN 2>/dev/null | awk 'NR==2 {print $2}' || true)"
if [ -n "${current_listener:-}" ]; then
	current_command="$(ps -p "$current_listener" -o command= 2>/dev/null || true)"
	if printf '%s' "$current_command" | grep -q "$PROJECT_FILE"; then
		echo "OK: SpaceFishing ja esta servindo na porta $PORT."
		exit 0
	fi

	echo "FAIL: a porta $PORT ja esta ocupada por outro Rojo/processo:"
	echo "$current_command"
	echo
	echo "Pare esse servidor antes de conectar o Rojo no SpaceFishing."
	echo "Dica: se for o projeto antigo Socar um Brainrot, feche/desconecte ele primeiro."
	exit 1
fi

echo "Starting SpaceFishing Rojo on localhost:$PORT"
echo "Abra o Dev Place correto, por exemplo 'Bruno', e conecte o plugin Rojo em localhost:$PORT."
exec rojo serve "$PROJECT_FILE" --port "$PORT"
