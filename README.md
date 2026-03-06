# BERENT Website Rules

Zentrale Cursor Rules für alle BERENT-Webseiten (berent.ai, Subdomains, etc.).

## Verwendung

Dieses Repo wird als Git-Submodule in Projekte eingebunden:

```
.cursor/rules/  →  Submodule → berent-website-rules
```

## Updates

In einem Projekt die Rules aktualisieren:

```bash
git submodule update --remote .cursor/rules
git add .cursor/rules
git commit -m "Rules aktualisiert"
```

## Neue Projekte

Beim Klonen eines Projekts mit Submodule:

```bash
git clone --recurse-submodules <repo-url>
```

Oder nachträglich:

```bash
git submodule update --init
```
