# BERENT Website Rules

Zentrale Cursor Rules für alle BERENT-Webseiten (berent.ai, Subdomains, etc.).

---

## Bestehendes Projekt anbinden

Rules in ein **bereits existierendes** Repo einbinden (z.B. shop, launch, Vercel-Projekte):

```bash
cd /pfad/zum/projekt
git submodule add https://github.com/peerendees/berent-website-rules.git .cursor/rules
git add .gitmodules .cursor/rules
git commit -m "Rules als Submodule einbinden"
git push origin main
```

**Vercel:** In den Projekteinstellungen **„Include Git submodules“** aktivieren.

**Oder per Setup-Script:**

```bash
cd /pfad/zum/projekt
curl -sSL https://raw.githubusercontent.com/peerendees/berent-website-rules/main/setup.sh | bash
# Danach: git add . && git commit -m "Rules einbinden" && git push
```

---

## Rules aktualisieren

In einem Projekt die Rules auf den neuesten Stand bringen:

```bash
git submodule update --remote .cursor/rules
git add .cursor/rules
git commit -m "Rules aktualisiert"
git push origin main
```

---

## Projekt mit Submodule klonen

Beim Klonen **immer** Submodules mitziehen:

```bash
git clone --recurse-submodules <repo-url>
```

Falls ohne Submodules geklont wurde:

```bash
git submodule update --init
```

---

## Neues Projekt starten (Template)

Für neue Subdomains/Projekte von Grund auf:

1. GitHub → [berent-website-template](https://github.com/peerendees/berent-website-template) → **Use this template**
2. Neues Repo anlegen
3. Klonen: `git clone --recurse-submodules <url>`
4. `npm install` und `npm run build`
5. Mit Vercel verbinden (Submodules aktivieren)
