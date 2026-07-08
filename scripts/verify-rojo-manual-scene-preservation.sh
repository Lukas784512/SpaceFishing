#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCEMAP="$(mktemp "${TMPDIR:-/tmp}/pescaria-rojo-sourcemap.XXXXXX.json")"

cleanup() {
	rm -f "$SOURCEMAP"
}
trap cleanup EXIT

cd "$ROOT_DIR"

rojo sourcemap default.project.json --include-non-scripts --output "$SOURCEMAP" >/dev/null

if jq -e '.children[] | select(.name == "Workspace") | any(.children[]?; .name == "SpaceFishingLobbyStatic")' "$SOURCEMAP" >/dev/null; then
	echo "FAIL: Workspace/SpaceFishingLobbyStatic is managed by Rojo. This can overwrite manual Studio edits."
	exit 1
fi

if ! jq -e '.children[] | select(.name == "Workspace") | any(.children[]?; .name == "CodexAdditions")' "$SOURCEMAP" >/dev/null; then
	echo "FAIL: Workspace/CodexAdditions is missing. Future Codex scene additions need a safe additive target."
	exit 1
fi

if ! jq -e '.children[] | select(.name == "ServerStorage") | .children[]? | select(.name == "SceneTemplates") | any(.children[]?; .name == "SpaceFishingLobbyStatic")' "$SOURCEMAP" >/dev/null; then
	echo "FAIL: ServerStorage/SceneTemplates/SpaceFishingLobbyStatic fallback template is missing."
	exit 1
fi

echo "OK: Rojo preserves the manual Workspace lobby and keeps Codex additions separate."
