#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

fail() {
	echo "FAIL: $1"
	exit 1
}

require_path() {
	local path="$1"
	[ -e "$path" ] || fail "$path nao existe."
	echo "OK: $path"
}

require_path "default.project.json"
require_path "src"
require_path "src/Workspace"
require_path "src/Workspace/CodexAdditions"
require_path "src/ReplicatedStorage"
require_path "src/ReplicatedStorage/Assets1"
require_path "src/ServerScriptService"
require_path "src/StarterGui"
require_path "src/StarterPack"
require_path "src/StarterPlayer"
require_path "src/StarterPlayer/StarterPlayerScripts"
require_path "src/StarterPlayer/StarterCharacterScripts"

command -v jq >/dev/null 2>&1 || fail "jq nao encontrado."
jq empty default.project.json
echo "OK: default.project.json e JSON valido."

jq -e '.ignoreUnknownInstances == true' src/ReplicatedStorage/Assets1.meta.json >/dev/null \
	|| fail "src/ReplicatedStorage/Assets1.meta.json precisa preservar instancias manuais."
echo "OK: ReplicatedStorage/Assets1 preserva filhos manuais no Studio."

command -v rojo >/dev/null 2>&1 || fail "Rojo nao encontrado. Rode 'aftman install'."
echo "Rojo: $(rojo --version)"

bash scripts/verify-rojo-manual-scene-preservation.sh

SOURCEMAP="$(mktemp "${TMPDIR:-/tmp}/spacefishing-rojo-sourcemap.XXXXXX.json")"
cleanup() {
	rm -f "$SOURCEMAP"
}
trap cleanup EXIT

rojo sourcemap default.project.json --include-non-scripts --output "$SOURCEMAP" >/dev/null
echo "OK: Rojo sourcemap gerado."

rojo build default.project.json --output /tmp/spacefishing-rojo-build-check.rbxlx >/dev/null
echo "OK: Rojo build gerado em /tmp/spacefishing-rojo-build-check.rbxlx."
