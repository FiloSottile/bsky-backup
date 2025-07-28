#!/usr/bin/env bash
set -euo pipefail

goat() {
    go run github.com/bluesky-social/indigo/cmd/goat@latest "$@"
}

ACCOUNT="${1#@}"

rm -f "$ACCOUNT".car
goat repo export -o "$ACCOUNT".car "$ACCOUNT"
goat blob export "$ACCOUNT"
goat resolve "$ACCOUNT" > "$ACCOUNT".json
goat plc data "$ACCOUNT" > "$ACCOUNT"_plc.json
goat plc history "$ACCOUNT" > "$ACCOUNT"_plc_history.jsonc
