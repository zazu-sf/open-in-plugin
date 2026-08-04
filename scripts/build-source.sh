#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT="${1:-$ROOT/dist/site}"
VERSION="$(awk '/^version:/ {print $2; exit}' "$ROOT/open-in-plugin.yml")"
PACKAGE="open-in-plugin-v${VERSION}.zip"
BUILD_DIR="$ROOT/dist/package/open-in-plugin"

rm -rf "$ROOT/dist/package" "$OUT"
mkdir -p "$BUILD_DIR/assets" "$OUT"

cp "$ROOT/open-in-plugin.yml" "$BUILD_DIR/"
cp "$ROOT/open-in-plugin.js" "$BUILD_DIR/"
cp "$ROOT/open-in-plugin.css" "$BUILD_DIR/"
cp "$ROOT/assets/icon.svg" "$BUILD_DIR/assets/"

(
  cd "$ROOT/dist/package"
  zip -qr "$OUT/$PACKAGE" open-in-plugin
)

SHA256="$(sha256sum "$OUT/$PACKAGE" | awk '{print $1}')"
DATE="${SOURCE_DATE:-$(date -u +%F)}"

cat > "$OUT/index.yml" <<INDEX
- id: open-in-plugin
  name: Open In Plugin
  version: ${VERSION}
  date: ${DATE}
  path: ${PACKAGE}
  sha256: ${SHA256}
  metadata:
    description: Open Stash scenes in external player apps on visionOS, iOS, iPadOS, macOS, and compatible platforms.
    homepage: https://github.com/${GITHUB_REPOSITORY:-GITHUB-OWNER/open-in-plugin}
INDEX

: > "$OUT/.nojekyll"
printf 'Built %s\nSHA256: %s\n' "$OUT/$PACKAGE" "$SHA256"
