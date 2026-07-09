#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "Project: $ROOT_DIR"

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
	branch="$(git branch --show-current)"
	echo "Git branch: ${branch:-detached}"
	git status --short --branch

	if [ "$branch" = "main" ] || [ "$branch" = "master" ]; then
		echo "WARNING: crie uma branch de tarefa antes de alterar codigo."
	fi
else
	echo "FAIL: esta pasta nao e um repositorio Git."
	exit 1
fi

if command -v rojo >/dev/null 2>&1; then
	echo "Rojo: $(rojo --version)"
else
	echo "WARNING: Rojo nao encontrado."
fi

if command -v jq >/dev/null 2>&1; then
	jq empty default.project.json
	echo "OK: default.project.json e JSON valido."
else
	echo "WARNING: jq nao encontrado; pulando validacao JSON."
fi
