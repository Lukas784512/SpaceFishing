#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET_BRANCH="${1:-}"

cd "$ROOT_DIR"

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
	echo "FAIL: esta pasta nao e um repositorio Git."
	exit 1
fi

if [ -z "$TARGET_BRANCH" ]; then
	echo "Uso: ./scripts/start-work-day.sh nome/da-branch"
	echo "Exemplo: ./scripts/start-work-day.sh luks/combat-system"
	exit 1
fi

if [ -n "$(git remote)" ]; then
	git fetch --all --prune
fi

if git show-ref --verify --quiet "refs/heads/$TARGET_BRANCH"; then
	git switch "$TARGET_BRANCH"
else
	git switch main
	if git rev-parse --abbrev-ref --symbolic-full-name '@{u}' >/dev/null 2>&1; then
		git pull --ff-only
	fi
	git switch -c "$TARGET_BRANCH"
fi

./scripts/validate-rojo-project.sh
./scripts/check-project-status.sh

echo "Pronto. Abra seu Dev Place e rode ./scripts/start-rojo.sh."
