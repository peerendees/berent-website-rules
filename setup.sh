#!/bin/bash
# BERENT Website Rules – Setup für bestehende Projekte
# Fügt das Rules-Repo als Submodule in .cursor/rules ein.
#
# Verwendung:
#   cd /pfad/zum/projekt && curl -sSL https://raw.githubusercontent.com/peerendees/berent-website-rules/main/setup.sh | bash
#   Oder: ./setup.sh [pfad/zum/projekt]

set -e

PROJECT_DIR="${1:-.}"
RULES_URL="https://github.com/peerendees/berent-website-rules.git"
RULES_PATH=".cursor/rules"

cd "$PROJECT_DIR"

if ! git rev-parse --git-dir > /dev/null 2>&1; then
  echo "❌ Kein Git-Repository gefunden. Bitte in ein Projektverzeichnis wechseln."
  exit 1
fi

if [ -d "$RULES_PATH" ] && [ -f "$RULES_PATH/.git" ]; then
  echo "✓ Rules-Submodule ist bereits eingebunden."
  exit 0
fi

if [ -d "$RULES_PATH" ] && [ ! -f "$RULES_PATH/.git" ]; then
  echo "⚠ .cursor/rules existiert bereits (kein Submodule). Bitte leeren oder umbenennen."
  exit 1
fi

echo "→ Füge Rules als Submodule ein..."
git submodule add "$RULES_URL" "$RULES_PATH"

echo ""
echo "✓ Submodule eingebunden."
echo ""
echo "Nächste Schritte:"
echo "  git add .gitmodules $RULES_PATH"
echo "  git commit -m \"Rules als Submodule einbinden\""
echo "  git push origin main"
echo ""
echo "Vercel: In den Projekteinstellungen „Include Git submodules“ aktivieren."
