---
name: berent-ci
description: >
  Wendet die vollständige Corporate Identity von BERENT.AI auf alle erstellten
  Inhalte an – Webseiten, Artefakte, HTML, CSS, Gamma-Präsentationen und
  Dokumente (DOCX). Verwende diesen Skill immer dann, wenn für BERENT oder
  BERENT.AI etwas gestaltet, gebaut oder erstellt werden soll, auch wenn der
  Nutzer das CI nicht explizit erwähnt. Enthält Farben, Typografie,
  CSS-Variablen, Plus-Symbol, Footer-Pflichtlinks, Gamma-Theme-Parameter,
  DOCX-Umsetzungsregeln und KI-Anwendungsregeln für konsistente BERENT-Outputs.
---

# BERENT CI – Corporate Identity Skill

Dieser Skill stellt sicher, dass alle Outputs für BERENT.AI konsistent im
definierten Corporate Design erscheinen. Er gilt für HTML, CSS, Artefakte,
Präsentationen, Word-Dokumente (DOCX) und alle anderen visuellen Outputs.

## Identität

- **Marke:** BERENT.AI – Beratung + Entwicklung
- **Domain:** berent.ai
- **Markensymbol:** Das `+` Kreuz-Symbol – verbindet Beratung und Entwicklung

---

## Farbpalette

| Rolle                | Hex       | CSS-Variable    | Beschreibung                               |
|----------------------|-----------|-----------------|---------------------------------------------|
| Hintergrund          | `#0e0e10` | `--bg`          | Neutral-dunkel – KEIN reines Schwarz        |
| Hintergrund 2        | `#151518` | `--bg2`         | Sections, Cards, Header                     |
| Hintergrund 3        | `#1c1c20` | `--bg3`         | Inputs, Hover-States                        |
| Primär / Kupfer      | `#B5742A` | `--copper`      | Hauptakzent, Headlines, Buttons, Borders    |
| Kupfer hell          | `#cc8c3e` | `--copper-lt`   | Hover-States                                |
| Kupfer dunkel        | `#7a4e1c` | `--copper-dk`   | Badges, Connector-Lines                     |
| Gold / Champagne     | `#E8C98A` | `--gold`        | **Exklusiv** für das `+` Symbol             |
| Gold gedämpft        | `#c4a870` | `--gold-dim`    | Dezente Gold-Akzente                        |
| Text                 | `#C4BCB1` | `--text`        | Warmes Graubeige – Fließtext                |
| Sekundärtext         | `#7A6A58` | `--muted`       | Labels / Metainfo                           |
| Sekundärtext 2       | `#9A8870` | `--muted2`      | Dezente Labels                              |
| Border               | `#2a2a2e` | `--border`      | Subtile Trennlinien                         |
| Border 2             | `#3a3a40` | `--border2`     | Stärkere Trennlinien, Hover-Borders         |
| Champagne Hell       | `#F5EFE4` |                 | Infobox-Hintergrund in DOCX (druckfreundlich)|
| Fließtext DOCX       | `#2A1A08` |                 | Dunkles Warmbraun für DOCX-Fließtext        |

### Light Mode (Web)

| Rolle                | Hex       | CSS-Variable    | Beschreibung                               |
|----------------------|-----------|-----------------|---------------------------------------------|
| Hintergrund          | `#F5F2EE` | `--bg`          | Warmes Sand-Beige                           |
| Hintergrund 2        | `#EDEAE4` | `--bg2`         | Sections, Cards, Header                     |
| Hintergrund 3        | `#E3DFD8` | `--bg3`         | Inputs, Hover-States                        |
| Primär / Kupfer      | `#9A6320` | `--copper`      | Dunklerer Kupfer für Kontrast auf hell      |
| Kupfer hell          | `#B5742A` | `--copper-lt`   | Hover-States (= Dark-Mode-Primary)          |
| Gold                 | `#9A6320` | `--gold`        | Dunkleres Gold für Plus-Symbol              |
| Gold gedämpft        | `#B08840` | `--gold-dim`    | Dezente Gold-Akzente                        |
| Text                 | `#2E2318` | `--text`        | Dunkel-Kupfer – warm, CI-eigen              |
| Sekundärtext         | `#7A6248` | `--muted`       | Labels / Metainfo, warm-kupfer              |
| Border               | `#D1CBBD` | `--border`      | Subtile Trennlinien                         |
| Border 2             | `#C2BAA9` | `--border2`     | Stärkere Trennlinien                        |

**Aktivierung:** `<html data-theme="light">` — Dark ist Standard (kein Attribut = Dark Mode)

**Regeln:**
- Niemals `#000000` oder `#FFFFFF` verwenden
- Gold `#E8C98A` ist ausschließlich dem `+` Symbol vorbehalten (im Dark Mode)
- In DOCX: kein dunkler Seitenhintergrund (Word hat weißen Papiergrund)
- Hintergrund-Tonalität: Dark = neutral-dunkel, Light = warm-sandig
- Light-Mode-Text `#2E2318` ist eine Kupfer-Dunkelvariation, kein neutrales Schwarz
- Dark Mode ist der Standard — Light Mode via Toggle oder localStorage-Persistenz

---

## Typografie

| Einsatz          | Font               | Gewicht         | Hinweis                    |
|------------------|--------------------|-----------------|----------------------------|
| Headlines        | **Bebas Neue**     | Regular         | Immer UPPERCASE            |
| Body / Fließtext | **Lora**           | 300 / 400 / 600 | Kein `font-style: italic`  |
| Code / Labels    | **JetBrains Mono** | 300 / 400 / 700 | Technische Inhalte         |

**Web – Google Fonts CDN (nur für lokale Entwicklung, nicht für Produktion):**
```html
<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Lora:wght@300;400;600&family=JetBrains+Mono:wght@300;400;700&display=swap" rel="stylesheet">
```

**Web – DSGVO-konform (Produktion): Schriften lokal hosten**
```
/assets/fonts/bebas-neue-regular.woff2
/assets/fonts/lora-300.woff2
/assets/fonts/lora-400.woff2
/assets/fonts/lora-600.woff2
```
```css
@font-face {
  font-family: 'Bebas Neue';
  src: url('/assets/fonts/bebas-neue-regular.woff2') format('woff2');
  font-display: swap;
}
@font-face {
  font-family: 'Lora';
  src: url('/assets/fonts/lora-400.woff2') format('woff2');
  font-weight: 400;
  font-display: swap;
}
```

**Regeln:**
- Niemals `font-style: italic` bei Lora
- Niemals Inter, Roboto, Arial, System-UI
- Bebas Neue: `letter-spacing: 0.04em` bis `0.1em`
- Kein Google Fonts CDN in Produktion (DSGVO: IP-Übertragung an US-Server)

---

## CSS Standard-Setup

```css
:root {
  --bg:        #0e0e10;
  --bg2:       #151518;
  --bg3:       #1c1c20;
  --border:    #2a2a2e;
  --border2:   #3a3a40;
  --copper:    #B5742A;
  --copper-lt: #cc8c3e;
  --copper-dk: #7a4e1c;
  --gold:      #E8C98A;
  --gold-dim:  #c4a870;
  --text:      #C4BCB1;
  --muted:     #7A6A58;
  --muted2:    #9a8870;
}

body {
  background: var(--bg);
  color: var(--text);
  font-family: 'Lora', serif;
  font-weight: 400;
  line-height: 1.7;
}
```

### Light Mode CSS

```css
[data-theme="light"] {
  --bg:        #F5F2EE;
  --bg2:       #EDEAE4;
  --bg3:       #E3DFD8;
  --border:    #D1CBBD;
  --border2:   #C2BAA9;
  --copper:    #9A6320;
  --copper-lt: #B5742A;
  --copper-dk: #7a4e1c;
  --gold:      #9A6320;
  --gold-dim:  #B08840;
  --text:      #2E2318;
  --muted:     #7A6248;
  --muted2:    #9A8C78;
}

[data-theme="light"] body::before { opacity: 0.015; }
[data-theme="light"] body::after {
  background: radial-gradient(circle, rgba(181,116,42,0.04) 0%, transparent 70%);
}
```

### Visuelle Effekte (Web)

```css
/* Grain-Overlay – subtile Textur über der gesamten Seite */
body::before {
  content: '';
  position: fixed;
  inset: 0;
  z-index: 9999;
  pointer-events: none;
  opacity: 0.03;
  background-image: url("data:image/svg+xml,...feTurbulence...");
}

/* Glow-Orb – Kupfer-Schimmer im Hintergrund */
body::after {
  content: '';
  position: fixed;
  width: 800px; height: 800px;
  border-radius: 50%;
  background: radial-gradient(circle, rgba(181,116,42,0.06) 0%, transparent 70%);
  pointer-events: none;
  animation: orbDrift 20s infinite alternate ease-in-out;
}
```

---

## Das Plus-Symbol

Zentrales Markenelement – immer in Gold `#E8C98A`, niemals in Kupfer.

**Verwendung:** Bullet-Ersatz, Trennelement, Headlines, Navigation, Footer.

```css
.plus-mark {
  width: 18px; height: 18px;
  position: relative; flex-shrink: 0;
}
.plus-mark::before,
.plus-mark::after {
  content: '';
  position: absolute;
  background: var(--gold);
  border-radius: 1px;
}
.plus-mark::before { width: 2px; height: 100%; left: 50%; top: 0; transform: translateX(-50%); }
.plus-mark::after  { width: 100%; height: 2px; top: 50%; left: 0; transform: translateY(-50%); }
```

---

## Logo-Dateien

| Datei                  | Verwendung                                      |
|------------------------|-------------------------------------------------|
| `logo_farbe_v3.webp`   | Wortschriftzug "BERENT – Beratung+Entwicklung"  |
| `BE_Farbe_V3.png`      | Signet (B+E Icon) – als Favicon                 |

**Navigation (links oben):** `logo_farbe_v3.webp`, Höhe 32px, klickbar auf `https://berent.ai`
**Footer:** `logo_farbe_v3.webp`, Höhe 24px
**Favicon:** `BE_Farbe_V3.png`

Beide Dateien haben dunklen Hintergrund `#0e0e10` — fügen sich nahtlos ein, kein Freistellungsbedarf.

```html
<a href="https://berent.ai" class="berent-brand" aria-label="BERENT.AI">
  <img src="/assets/images/logo_farbe_v3.webp" alt="BERENT" height="32">
</a>
<link rel="icon" type="image/png" href="/assets/images/BE_Farbe_V3.png">
```

---

## Navigation / Header (ohne Logo-Dateien)

```html
<a href="https://berent.ai" class="nav-brand" style="text-decoration:none;color:inherit;">
  <div class="plus-mark"></div>
  <span>BERENT.AI — Beratung + Entwicklung</span>
</a>
```

**Regeln:**
- `BERENT.AI` immer in Großbuchstaben
- Header-Brand ist immer ein Link auf `https://berent.ai`

---

## Footer (Pflichtstruktur)

```html
<footer>
  <div class="footer-brand">
    <div class="plus-mark"></div>
    BERENT
  </div>
  <span>[ Seitenname ] · berent.ai</span>
  <div style="display:flex;gap:2rem;">
    <a href="https://berent.ai/impressum.html">Impressum</a>
    <a href="https://berent.ai">← Zurück zur Hauptseite</a>
  </div>
</footer>
```

**Pflichtlinks:** Impressum (`https://berent.ai/impressum.html`) + Zurück zur Hauptseite (`https://berent.ai`)

---

## DOCX-Umsetzung (Word-Dokumente)

Word-Dokumente haben einen weißen Papiergrund — der dunkle Webseitenhintergrund
`#090806` ist nicht übertragbar. Die CI wird über Farben, Schriften und
Gestaltungselemente annähernd umgesetzt.

### Farben in DOCX

| Element              | Farbe     | Hinweis                                      |
|----------------------|-----------|----------------------------------------------|
| H1 (Kapitelüberschrift) | `B5742A` | Kupfer, UPPERCASE, fett, mit Kupfer-Unterstrich |
| H2 (Abschnittsüberschrift) | `E8C98A` | Gold, fett                               |
| Fließtext            | `2A1A08`  | Dunkles Warmbraun (nicht Schwarz)            |
| Infobox Hintergrund  | `F5EFE4`  | Helles Champagne (druckfreundlich)           |
| Infobox Rahmen       | `B5742A`  | Kupfer, Stärke 8 (alle vier Seiten)          |
| Infobox Text         | `3D2A14`  | Dunkelbraun, lesbar auf Champagne            |
| Sekundärtext / Footer| `9A8870`  | BERENT Muted2                                |
| Tabellenheader       | `1E3A5F`→`B5742A` | Kupfer-Hintergrund, weißer Text      |
| Tabellenzeilen       | abwechselnd `FFFFFF` / `F5EFE4` | Champagne für ungerade Zeilen |

### Schriften in DOCX

Word unterstützt Bebas Neue und Lora nicht nativ ohne Installation.
Folgende Annäherungen werden verwendet:

| CI-Font     | DOCX-Ersatz       | Anwendung                              |
|-------------|-------------------|----------------------------------------|
| Bebas Neue  | Arial Bold, UPPERCASE, `characterSpacing: 40` | H1, Titelseite  |
| Lora        | Georgia           | Fließtext, H2, Infobox-Text            |
| JetBrains Mono | Courier New    | Code-Blöcke, technische Labels         |

### Bullet-Ersatz in DOCX

Das `+`-Symbol als Listenpunkt statt Gedankenstrich oder klassischer Bullet:

```javascript
// docx-js Konfiguration
{
  reference: "bullets",
  levels: [{
    level: 0,
    format: LevelFormat.BULLET,
    text: "+",           // Plus-Symbol statt Bullet
    alignment: AlignmentType.LEFT,
    style: { paragraph: { indent: { left: 600, hanging: 300 } } }
  }]
}
```

### Infobox in DOCX

```javascript
// docx-js: Tabelle als Infobox mit Champagne-Hintergrund und Kupfer-Rahmen
const border = { style: BorderStyle.SINGLE, size: 8, color: "B5742A" };
const borders = { top: border, bottom: border, left: border, right: border };

new Table({
  width: { size: 9026, type: WidthType.DXA },
  columnWidths: [9026],
  rows: [new TableRow({ children: [new TableCell({
    borders,
    shading: { fill: "F5EFE4", type: ShadingType.CLEAR },
    margins: { top: 120, bottom: 120, left: 180, right: 180 },
    children: zeilen.map(z => new Paragraph({
      children: [new TextRun({ text: z, size: 20, font: "Georgia", color: "3D2A14" })]
    }))
  })]})]
})
```

### H1 in DOCX

```javascript
new Paragraph({
  heading: HeadingLevel.HEADING_1,
  border: { bottom: { style: BorderStyle.SINGLE, size: 4, color: "B5742A", space: 4 } },
  children: [new TextRun({
    text: text.toUpperCase(),
    bold: true,
    size: 32,
    color: "B5742A",
    font: "Arial",
    characterSpacing: 40
  })]
})
```

### H2 in DOCX

```javascript
new Paragraph({
  heading: HeadingLevel.HEADING_2,
  children: [new TextRun({
    text,
    bold: true,
    size: 24,
    color: "E8C98A",
    font: "Georgia"
  })]
})
```

### Titelseite in DOCX

```javascript
// Haupttitel
new TextRun({
  text: "PRODUKTNAME",
  bold: true, size: 72,
  color: "B5742A",        // Kupfer
  font: "Arial",
  characterSpacing: 60
})
// Untertitel
new TextRun({
  text: "UNTERTITEL + BESCHREIBUNG",
  size: 26,
  color: "E8C98A",        // Gold
  font: "Arial",
  characterSpacing: 40
})
// Datum / Vertraulich
new TextRun({
  text: "Stand: Monat Jahr  –  Vertraulich",
  size: 20,
  color: "9A8870",        // Muted
  font: "Georgia"
})
// Trennlinie unter Titel: Kupfer-Border unten am Paragraph
border: { bottom: { style: BorderStyle.SINGLE, size: 4, color: "B5742A", space: 4 } }
```

### Footer in DOCX

```javascript
// Footer-Text: PRODUKTNAME + CI-Kennzeichnung
new TextRun({
  text: "PRODUKTNAME + Dokumenttitel  |  Vertraulich  |  Seite ",
  size: 18,
  color: "9A8870",
  font: "Georgia"
})
// Seitenzahl folgt als PageNumber.CURRENT
```

### Wichtige DOCX-Regeln

- Kein dunkler Seitenhintergrund — Word ist ein Druckformat
- Infoboxen: Champagne `F5EFE4` mit Kupfer-Rahmen `B5742A` statt dunklem Kasten
- Alle `&`-Zeichen in Überschriften durch `UND` ersetzen (docx-js-Konvention)
- Schriften Georgia und Arial sind in Word systemweit verfügbar — keine Installation nötig
- Bebas Neue / Lora können in Word verwendet werden, wenn auf dem System installiert
- ShadingType immer `CLEAR` (nicht `SOLID`) — verhindert schwarze Hintergründe

---

## Gamma Theme (BERENT 0.9.4)

| Parameter        | Wert              |
|------------------|-------------------|
| Theme ID         | `yg1h3fiwbwfurqf` |
| Background       | `#0e0e10`         |
| Primary Accent   | `#B5742A`         |
| Secondary Accent | `#E8C98A`         |
| Text Color       | `#C4BCB1`         |
| Heading Font     | Bebas Neue        |
| Body Font        | Lora              |
| Mono Font        | JetBrains Mono    |
| Bullet Style     | `+`               |
| Card Background  | `#151518`         |
| Border Color     | `#2a2a2e`         |

---

## Design-Prinzipien

1. **Neutral-dunkel mit warmen Akzenten** – Hintergrund kühl-neutral (#0e0e10), Kupfer bringt die Wärme
2. **Editorial** – Großzügiger Weißraum, klare Typografie-Hierarchie
3. **Kupfer als Leitfarbe** – Akzente, Hover-States, Borders, Nummern
4. **Kein Generic-AI-Look** – Keine lila Gradienten, kein Inter-Font, kein reines Weiß
5. **Plus als Markenelement** – Überall wo Bullets, Separatoren oder Highlights
6. **Mediumgerecht** – Web: Dark (Standard) und Light Mode / DOCX: hell — CI über Farben und Formen, nicht Hintergrund
7. **Subtile Textur** – Grain-Overlay und Glow-Orb verleihen Tiefe
8. **Monospace für Labels** – JetBrains Mono bei Metainfos, Buttons, Status-Anzeigen (uppercase, 0.65-0.78rem)
9. **Dual-Theme** – Dark Mode ist Standard, Light Mode mit warmen Sand-/Kupfertönen verfügbar (kein kaltes Weiß)
10. **Kein Ampersand** – Im Fließtext und UI immer „und" statt „&" (Ausnahme: Code-Kontexte)

---

## Anwendungsregeln (Kurzfassung)

**Web / HTML / CSS:**
- Dark Mode (Standard): `#0e0e10` (--bg), `#151518` (--bg2), `#1c1c20` (--bg3), Text `#C4BCB1`
- Light Mode: `#F5F2EE` (--bg), `#EDEAE4` (--bg2), `#E3DFD8` (--bg3), Text `#2E2318` (Kupfer-Dunkelvariation)
- Theme-Toggle: `<html data-theme="light">`, Dark = kein Attribut (Standard)
- Headlines: Bebas Neue (uppercase, letter-spacing 0.04em) · Body: Lora · Labels/Buttons: JetBrains Mono (uppercase, 0.65-0.78rem)
- Akzent: Kupfer `#B5742A` · Plus-Symbol: Gold `#E8C98A`
- Borders: `#2a2a2e` (--border) und `#3a3a40` (--border2) / Light: `#D1CBBD` und `#C2BAA9`
- Visuelle Effekte: Grain-Overlay (opacity 0.03 / Light: 0.015) + Glow-Orb (Kupfer-Radial, 800px)
- Footer: immer mit Impressum-Link und Zurück-zur-Hauptseite-Link
- Nav-Brand: immer klickbarer Link auf `https://berent.ai`
- Schriften DSGVO-konform lokal hosten, kein Google Fonts CDN in Produktion
- Kein `&` als Konjunktion in UI-Texten — immer „und"

**DOCX / Word:**
- Seitenhintergrund: weiß (Word-Standard)
- H1: Kupfer `B5742A`, UPPERCASE, Arial Bold, Kupfer-Unterstrich
- H2: Gold `E8C98A`, Georgia Bold
- Fließtext: Warmbraun `2A1A08`, Georgia
- Infoboxen: Champagne `F5EFE4` + Kupfer-Rahmen `B5742A`
- Bullets: `+` Symbol statt Gedankenstrich
- Footer: Muted `9A8870`, Georgia
- Kein `&` in Überschriften und Texten — durch „und" bzw. „UND" ersetzen

---

## Für Cursor AI

Datei ablegen als `.cursor/rules/berent-ci.md` im Projektordner.
Cursor liest sie automatisch bei jedem Prompt.

---

*BERENT.AI · Beratung + Entwicklung · berent.ai*
