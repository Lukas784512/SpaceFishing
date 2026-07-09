#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BRANCH="${1:-}"

cd "$ROOT_DIR"

if [ -z "$BRANCH" ]; then
	echo "Uso: ./scripts/view-branch.sh nome-da-branch"
	echo "Exemplo: ./scripts/view-branch.sh irmao/wave-system"
	exit 1
fi

git fetch origin
git switch "$BRANCH" 2>/dev/null || git switch -c "$BRANCH" --track "origin/$BRANCH"

./scripts/validate-rojo-project.sh

echo "Agora rode ./scripts/start-rojo.sh e conecte no seu Dev Place para testar esta branch."
