#!/bin/bash
# BERENT.AI – Setup für Claude Code Skills und Cursor Rules
# Symlinkt Skills und CI-Dateien auf jedem Rechner.
#
# Verwendung:
#   git clone https://github.com/peerendees/berent-website-rules.git ~/berent-rules
#   cd ~/berent-rules && chmod +x berent.sh && ./berent.sh
#
# Update: cd ~/berent-rules && git pull (Symlinks greifen sofort)

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
echo ""
echo "  +  BERENT.AI Setup"
echo "  +  Quelle: $SCRIPT_DIR"
echo ""

# ── 1. Claude Code Skills ──
# Finde das Claude Skills-Verzeichnis
CLAUDE_BASE="$HOME/Library/Application Support/Claude"
if [ ! -d "$CLAUDE_BASE" ]; then
  # Linux / andere Systeme
  CLAUDE_BASE="$HOME/.claude"
fi

# Skills-Plugin-Verzeichnis finden (nimmt das erste skills-plugin/*/skills)
SKILLS_PLUGIN_DIR=$(find "$CLAUDE_BASE/local-agent-mode-sessions/skills-plugin" -path "*/skills" -type d 2>/dev/null | head -1)

if [ -z "$SKILLS_PLUGIN_DIR" ]; then
  echo "⚠  Claude Skills-Verzeichnis nicht gefunden."
  echo "   Starte Claude Code einmal, damit das Verzeichnis erstellt wird."
  echo "   Danach ./berent.sh erneut ausführen."
  echo ""
else
  echo "→ Claude Skills: $SKILLS_PLUGIN_DIR"

  # berent-ci Skill
  if [ -L "$SKILLS_PLUGIN_DIR/berent-ci" ]; then
    echo "  ✓ berent-ci Symlink existiert bereits"
  else
    [ -d "$SKILLS_PLUGIN_DIR/berent-ci" ] && rm -rf "$SKILLS_PLUGIN_DIR/berent-ci"
    ln -s "$SCRIPT_DIR/skills/berent-ci" "$SKILLS_PLUGIN_DIR/berent-ci"
    echo "  ✓ berent-ci → verlinkt"
  fi

  # berent-docx Skill
  if [ -L "$SKILLS_PLUGIN_DIR/berent-docx" ]; then
    echo "  ✓ berent-docx Symlink existiert bereits"
  else
    [ -d "$SKILLS_PLUGIN_DIR/berent-docx" ] && rm -rf "$SKILLS_PLUGIN_DIR/berent-docx"
    ln -s "$SCRIPT_DIR/skills/berent-docx" "$SKILLS_PLUGIN_DIR/berent-docx"
    echo "  ✓ berent-docx → verlinkt"
  fi
fi

# ── 2. Globale CLAUDE.md ──
CLAUDE_MD_DIR="$HOME/.claude"
mkdir -p "$CLAUDE_MD_DIR"

CLAUDE_MD="$CLAUDE_MD_DIR/CLAUDE.md"
BERENT_MARKER="<!-- BERENT-CI-GLOBAL -->"

if [ -f "$CLAUDE_MD" ] && grep -q "$BERENT_MARKER" "$CLAUDE_MD"; then
  echo ""
  echo "→ Globale ~/.claude/CLAUDE.md: BERENT-Abschnitt existiert bereits"
else
  echo ""
  echo "→ Globale ~/.claude/CLAUDE.md: BERENT-Abschnitt hinzufügen"
  cat >> "$CLAUDE_MD" << 'HEREDOC'

<!-- BERENT-CI-GLOBAL -->
## BERENT.AI Corporate Identity

Für alle BERENT.AI-Projekte gilt die Corporate Identity aus dem Skill `berent-ci`.
Bei BERENT-Projekten (berent.ai, BelegChat, Textschmiede, Subdomains) immer den
`berent-ci` Skill konsultieren. Für Word-Dokumente zusätzlich den `berent-docx` Skill.

**Grundregeln:**
- Dark Mode ist Standard, Light Mode verfügbar
- Kupfer (#B5742A) als Leitfarbe, Gold (#E8C98A) nur für das Plus-Symbol
- Bebas Neue (Headlines), Lora (Fließtext), JetBrains Mono (Labels/Buttons)
- Kein Ampersand als Konjunktion — immer „und"
- Kein reines Schwarz, kein reines Weiß
<!-- /BERENT-CI-GLOBAL -->
HEREDOC
  echo "  ✓ Abschnitt hinzugefügt"
fi

# ── 3. Cursor Rules (Info) ──
echo ""
echo "→ Cursor Rules: Als Submodule in Projekte einbinden:"
echo "   cd /projekt && git submodule add https://github.com/peerendees/berent-website-rules.git .cursor/rules"
echo ""

# ── Fertig ──
echo "  +  Setup abgeschlossen."
echo ""
echo "  Update: cd $(basename "$SCRIPT_DIR") && git pull"
echo "  Symlinks greifen sofort — kein erneutes Setup nötig."
echo ""
