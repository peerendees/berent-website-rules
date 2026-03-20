# BERENT.AI – CI und Rules

Zentrale Single Source of Truth für die BERENT.AI Corporate Identity.
Gilt für alle Tools: **Cursor**, **Claude Code** und **Claude Desktop**.

---

## Setup (einmal pro Rechner)

```bash
git clone https://github.com/peerendees/berent-website-rules.git ~/berent-rules
cd ~/berent-rules && chmod +x berent.sh && ./berent.sh
```

Das Script:
1. Symlinkt die **Claude Code Skills** (`berent-ci`, `berent-docx`) ins Skills-Verzeichnis
2. Ergänzt die **globale `~/.claude/CLAUDE.md`** mit BERENT-CI-Referenz
3. Gibt Anleitung für **Cursor Submodule** aus

---

## Update (auf jedem Rechner)

```bash
cd ~/berent-rules && git pull
```

Symlinks greifen sofort — kein erneutes Setup nötig.

---

## Cursor: Projekt anbinden

Rules in ein bestehendes Repo einbinden:

```bash
cd /pfad/zum/projekt
git submodule add https://github.com/peerendees/berent-website-rules.git .cursor/rules
git add .gitmodules .cursor/rules
git commit -m "BERENT Rules als Submodule einbinden"
```

**Vercel:** In den Projekteinstellungen **„Include Git submodules"** aktivieren.

Beim Klonen eines Projekts mit Submodule:

```bash
git clone --recurse-submodules <repo-url>
# Oder nachträglich:
git submodule update --init
```

Rules aktualisieren:

```bash
git submodule update --remote .cursor/rules
git add .cursor/rules && git commit -m "Rules aktualisiert"
```

---

## Inhalt

```
berent-ci.mdc              # Cursor Rule – Vollständige CI (Dark und Light Mode)
project-workflow.mdc        # Cursor Rule – Workflow-Regeln
skills/
  berent-ci/SKILL.md        # Claude Code Skill – CI (Superset: Web, DOCX, Gamma)
  berent-docx/SKILL.md      # Claude Code Skill – Word-Dokumente im CI
berent.sh                   # Setup-Script (Symlinks und globale CLAUDE.md)
README.md                   # Diese Datei
```

---

## Was wo gilt

| Datei | Tool | Scope |
|-------|------|-------|
| `berent-ci.mdc` | Cursor | Web-Projekte (via Submodule) |
| `project-workflow.mdc` | Cursor | Workflow-Regeln |
| `skills/berent-ci/SKILL.md` | Claude Code und Desktop | Alle Medien (Web, DOCX, Präsentationen) |
| `skills/berent-docx/SKILL.md` | Claude Code und Desktop | Word-Dokumente |
| `~/.claude/CLAUDE.md` | Claude Code | Globale Referenz auf Skills |

---

*BERENT.AI · Beratung + Entwicklung · berent.ai*
