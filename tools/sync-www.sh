#!/usr/bin/env bash
# Rebuild the Capacitor www/ from the root web app (run before every cap sync / gradle build).
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p www
cp index.html www/index.html
echo "www/index.html refreshed from index.html"
