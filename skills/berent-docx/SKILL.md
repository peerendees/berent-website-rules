---
name: berent-docx
description: >
  Erstellt Word-Dokumente (.docx) im Corporate Design von BERENT.AI / BelegChat.
  Verwende diesen Skill immer dann, wenn für BERENT.AI oder BelegChat ein Word-Dokument
  erstellt oder bearbeitet werden soll – auch wenn der User das CI nicht explizit nennt.
  Enthält Farben, Typografie, Heading-Stile, Listenformate, Kästen (Info / Aufgabe),
  Trennelemente, Footer-Pflichtformat und komplette docx-js-Codebeispiele.
---

# BERENT.AI · Word-Dokumente im Corporate Design

## Übersicht

Alle Word-Dateien für BERENT.AI und BelegChat folgen diesem Styleguide.
Er basiert auf den Quelldokumenten `BelegChat_Konzept_0316.docx` und `BelegChat_Konzept_0_9.pdf` (Stand März 2026).

---

## 1 · Farben

| Token | Hex | Verwendung |
|---|---|---|
| `BRAND_GOLD` | `#B5742A` | H1-Farbe, H3-Farbe, Linksrand der Kästen, Trennlinie |
| `BRAND_GOLD_LIGHT` | `#E8C98A` | Plus-Symbol (`+`), H2-Prefix `+`, Fußzeilen-`+` |
| `BRAND_DARK` | `#1A1410` | H2-Text, Titelzeile Produktname |
| `TEXT_DEFAULT` | `#2A2018` | Fließtext |
| `TEXT_MUTED` | `#7A6A58` | Untertitel, Fußzeilen, Info-Box-Text |
| `BOX_BG` | `#FDF8F3` | Hintergrund Info-/Aufgabe-Kästen |
| `TABLE_HEADER` | `#A56120` | Tabellen-Header-Hintergrund (dunkleres Gold) |
| `TABLE_ALT` | `#F2EBDE` | Alternating-Row-Hintergrund |
| `TABLE_DARK` | `#1A1410` | Dunkler Tabellen-Header (Testimonial-Tabelle) |
| `TABLE_DARK_ROW` | `#FDF8F3` | Hintergrund helle Zeilen bei dunklem Header |
| `SEPARATOR` | `#D4C4B0` | Footer-Trennlinie (oben) |

---

## 2 · Typografie

- **Schriftart**: Arial (alle Elemente, konsistent)
- **Standardgröße**: 10,5 pt (sz=21 in DXA-Halbe-Punkte)
- **Dokumentsprache**: `de-DE`
- **Seitengröße**: A4 — `w: 11906, h: 16838` (DXA)
- **Seitenränder**: links/rechts je 1418 DXA (~2,5 cm), oben/unten 1701 DXA (~3 cm)
- **Textausrichtung**: Blocksatz (`jc: both`) für Fließtext

### Schriftgrößen-Tabelle

| Element | Größe (pt) | DXA-Wert (sz) |
|---|---|---|
| Plus-Symbol Titelseite | 60 pt | 120 |
| Produktname Titelseite | 40 pt | 80 |
| Untertitel Titelseite | 14 pt | 28 |
| H1 | 17 pt | 34 |
| H2 | 12 pt | 24 |
| H3 | 11 pt | 22 |
| Fließtext | 10,5 pt | 21 |
| Kasten-Text (Info/Aufgabe) | 9,5 pt | 19 |
| Fußzeile | 8 pt | 16 |

---

## 3 · Heading-Stile

### H1 — Hauptkapitel
- Farbe: `B5742A`
- Bold, 17 pt
- Unterstrich: `bottom: single, sz=8, color=B5742A, space=6`
- Spacing: before=480, after=160
- Prefix: Nummernkürzel (`01`, `02` …) in gleicher Größe wie Kapitelname (17 pt / sz=34), Farbe `B5742A`, Bold
- Kapitelnamen in **Groß-Kleinschreibung** (nicht Vollkapitälchen)

```javascript
// H1 mit Prefix-Nummer
new Paragraph({
  style: "Heading1",
  border: { bottom: { style: BorderStyle.SINGLE, size: 8, color: "B5742A", space: 6 } },
  spacing: { before: 480, after: 160 },
  children: [
    new TextRun({ text: "01  ", bold: true, color: "B5742A", size: 34, font: "Arial" }),
    new TextRun({ text: "Kapitelname", bold: true, color: "B5742A", size: 34, font: "Arial" }),
  ]
})
```

### H2 — Unterkapitel
- Prefix `+ ` in Farbe `E8C98A` (BRAND_GOLD_LIGHT), Bold, 12 pt
- Kapiteltext in Farbe `B5742A` (BRAND_GOLD), Bold, 12 pt
- Spacing: before=280, after=100

```javascript
new Paragraph({
  style: "Heading2",
  spacing: { before: 280, after: 100 },
  children: [
    new TextRun({ text: "+ ", bold: true, color: "E8C98A", size: 24, font: "Arial" }),
    new TextRun({ text: "2.1 Unterkapitelname", bold: true, color: "B5742A", size: 24, font: "Arial" }),
  ]
})
```

### H3 — Unterunterkapitel
- Farbe: `B5742A`, Bold, 11 pt
- Spacing: before=180, after=80

---

## 4 · Fließtext

```javascript
new Paragraph({
  spacing: { before: 0, after: 120 },
  alignment: AlignmentType.BOTH,  // Blocksatz
  children: [
    new TextRun({ text: "Fließtext hier...", color: "2A2018", size: 21, font: "Arial" })
  ]
})
```

---

## 5 · Listen (Plus-Bullet-Style)

BelegChat verwendet **kein** Standard-Bullet-Symbol. Stattdessen wird `+ ` (in Gold `E8C98A`) als Prefix verwendet, gefolgt vom Listentext in `2A2018`.

```javascript
// Plus-Listenpunkt
new Paragraph({
  spacing: { before: 0, after: 80 },
  indent: { left: 600, hanging: 360 },
  children: [
    new TextRun({ text: "+ ", bold: true, color: "E8C98A", size: 21, font: "Arial" }),
    new TextRun({ text: "Listenpunkt-Text hier", color: "2A2018", size: 21, font: "Arial" }),
  ]
})
```

---

## 6 · Kästen (Info-Boxen)

Es gibt zwei Kasten-Typen. Beide haben:
- Linken Rand: `single, sz=16, color=B5742A, space=10`
- Hintergrund: `FDF8F3`
- Einzug links: 800 DXA
- Schriftgröße: 9,5 pt (sz=19)
- Spacing: before=100, after=160

### 6.1 Info-Kasten (ℹ)
- Symbol: `ℹ  ` (mit zwei Leerzeichen)
- Textfarbe: `7A6A58`
- Kursiv

```javascript
new Paragraph({
  border: { left: { style: BorderStyle.SINGLE, size: 16, color: "B5742A", space: 10 } },
  shading: { fill: "FDF8F3", type: ShadingType.CLEAR },
  spacing: { before: 100, after: 160 },
  indent: { left: 800 },
  children: [
    new TextRun({
      text: "ℹ  Hinweistext hier.",
      italic: true,
      color: "7A6A58",
      size: 19,
      font: "Arial"
    })
  ]
})
```

### 6.2 Aufgaben-Kasten (▶)
- Symbol: `▶  ` (mit zwei Leerzeichen)
- Textfarbe: `B5742A`
- Kursiv

```javascript
new Paragraph({
  border: { left: { style: BorderStyle.SINGLE, size: 16, color: "B5742A", space: 10 } },
  shading: { fill: "FDF8F3", type: ShadingType.CLEAR },
  spacing: { before: 100, after: 160 },
  indent: { left: 800 },
  children: [
    new TextRun({
      text: "▶  Aufgabe: Aufgabenbeschreibung hier.",
      italic: true,
      color: "B5742A",
      size: 19,
      font: "Arial"
    })
  ]
})
```

---

## 7 · Trennelemente (Kapitel-Separator)

Zwischen Abschnitten wird ein zentriertes `+ + +` als optischer Trenner verwendet:

```javascript
new Paragraph({
  alignment: AlignmentType.CENTER,
  spacing: { before: 240, after: 240 },
  children: [
    new TextRun({ text: "  +  ", bold: true, color: "E8C98A", size: 18, font: "Arial" }),
    new TextRun({ text: "  +  ", color: "B5742A", size: 18, font: "Arial" }),
    new TextRun({ text: "  +  ", bold: true, color: "E8C98A", size: 18, font: "Arial" }),
  ]
})
```

---

## 8 · Titelseite

Reihenfolge der Elemente:

1. **Leerabsatz** (spacing after=1440)
2. **Plus-Symbol** (60 pt, `E8C98A`, zentriert, after=200)
3. **Produktname** (40 pt, `B5742A`, Bold, zentriert, after=120)
4. **Untertitel/Dokumenttyp** (14 pt, `1A1410`, Bold, zentriert, after=1440)
5. **Datum + Vertraulich-Hinweis** (11 pt, kursiv, `7A6A58`, zentriert, after=1440)
6. **BERENT.AI-Zeile** (10 pt, `B5742A`, zentriert)
7. **Seitenumbruch**

```javascript
// Titelseite komplett
const titlePage = [
  new Paragraph({ spacing: { before: 0, after: 1440 }, children: [new TextRun("")] }),
  new Paragraph({
    alignment: AlignmentType.CENTER,
    spacing: { before: 0, after: 200 },
    children: [new TextRun({ text: "+", bold: true, color: "E8C98A", size: 120, font: "Arial" })]
  }),
  new Paragraph({
    alignment: AlignmentType.CENTER,
    spacing: { before: 0, after: 120 },
    children: [new TextRun({ text: "BELEGCHAT", bold: true, color: "B5742A", size: 80, font: "Arial" })]
  }),
  new Paragraph({
    alignment: AlignmentType.CENTER,
    spacing: { before: 0, after: 80 },
    children: [new TextRun({ text: "DOKUMENTTITEL + UNTERTITEL", bold: true, color: "1A1410", size: 28, font: "Arial" })]
  }),
  new Paragraph({
    alignment: AlignmentType.CENTER,
    spacing: { before: 0, after: 1440 },
    children: [new TextRun({ text: "Stand: März 2026  ·  Vertraulich", italic: true, color: "7A6A58", size: 22, font: "Arial" })]
  }),
  new Paragraph({
    alignment: AlignmentType.CENTER,
    spacing: { before: 0, after: 0 },
    children: [new TextRun({ text: "BERENT.AI  ·  Beratung + Entwicklung", color: "B5742A", size: 20, font: "Arial" })]
  }),
  new Paragraph({ children: [new PageBreak()] }),
];
```

---

## 9 · Fußzeile

Jede Seite (außer erste) hat eine Fußzeile mit:
- Obere Trennlinie: `single, sz=4, color=D4C4B0, space=4`
- Links: `+ [Website / Produktname]` — Farbe `E8C98A` für `+`, `7A6A58` für Text
- Rechts (Tab-Stop rechts): `BERENT.AI · Beratung und Entwicklung` in `7A6A58`, kursiv — fest, nicht ändern
- Schriftgröße: 8 pt (sz=16)
- Tab-Stop: rechts bei 9026 DXA

**Hinweis:** Den Platzhalter `[Website / Produktname]` bei Verwendung mit der konkreten Webseite ersetzen (z. B. `belegchat.de`).

```javascript
// Footer-Paragraph — [Website / Produktname] ersetzen
new Paragraph({
  style: "Footer",
  border: { top: { style: BorderStyle.SINGLE, size: 4, color: "D4C4B0", space: 4 } },
  tabStops: [{ type: TabStopType.RIGHT, position: 9026 }],
  spacing: { before: 60, after: 0 },
  children: [
    new TextRun({ text: "+ ", color: "E8C98A", size: 16, font: "Arial" }),
    new TextRun({ text: "[Website / Produktname]", color: "7A6A58", size: 16, font: "Arial" }),
    new TextRun({ text: "\t", size: 16 }),
    new TextRun({ text: "BERENT.AI · Beratung und Entwicklung", italic: true, color: "7A6A58", size: 16, font: "Arial" }),
  ]
})
```

---

## 10 · Tabellen

### Standard-Tabelle (Gold-Header)
- Header-Zeilen: Hintergrund `A56120`, Text weiß (`FFFFFF`), Bold
- Alternating Rows: `F2EBDE` / `FFFFFF`
- Kein Außenrahmen, innere Trennlinien minimal

### Dunkle Tabelle (z. B. Testimonial-Tabelle)
- Header: Hintergrund `1A1410`, Text weiß
- Helle Zeilen: `FDF8F3`
- Weiße Zeilen: `FFFFFF`

```javascript
// Tabellenzeile Header (Gold)
new TableRow({
  tableHeader: true,
  children: [
    new TableCell({
      shading: { fill: "A56120", type: ShadingType.CLEAR },
      width: { size: 3000, type: WidthType.DXA },
      margins: { top: 80, bottom: 80, left: 120, right: 120 },
      children: [new Paragraph({
        children: [new TextRun({ text: "Spaltenname", bold: true, color: "FFFFFF", size: 21, font: "Arial" })]
      })]
    })
    // weitere Cells...
  ]
})
```

---

## 11 · Styles-Konfiguration (docx-js Setup)

```javascript
const { Document, Packer, Paragraph, TextRun, Table, TableRow, TableCell,
        Footer, AlignmentType, BorderStyle, WidthType, ShadingType,
        TabStopType, PageBreak, HeadingLevel } = require('docx');

const doc = new Document({
  styles: {
    default: {
      document: {
        run: { font: "Arial", size: 21, color: "2A2018" },
        paragraph: { spacing: { before: 0, after: 120 } }
      }
    },
    paragraphStyles: [
      {
        id: "Heading1", name: "Heading 1", basedOn: "Normal", next: "Normal", quickFormat: true,
        run: { size: 34, bold: true, color: "B5742A", font: "Arial" },
        paragraph: { spacing: { before: 480, after: 160 }, outlineLevel: 0 }
      },
      {
        id: "Heading2", name: "Heading 2", basedOn: "Normal", next: "Normal", quickFormat: true,
        run: { size: 24, bold: true, color: "1A1410", font: "Arial" },
        paragraph: { spacing: { before: 280, after: 100 }, outlineLevel: 1 }
      },
      {
        id: "Heading3", name: "Heading 3", basedOn: "Normal", next: "Normal", quickFormat: true,
        run: { size: 22, bold: true, color: "B5742A", font: "Arial" },
        paragraph: { spacing: { before: 180, after: 80 }, outlineLevel: 2 }
      },
    ]
  },
  sections: [{
    properties: {
      page: {
        size: { width: 11906, height: 16838 },  // A4
        margin: { top: 1701, right: 1418, bottom: 1701, left: 1418 }
      }
    },
    footers: {
      default: new Footer({
        children: [
          new Paragraph({
            border: { top: { style: BorderStyle.SINGLE, size: 4, color: "D4C4B0", space: 4 } },
            tabStops: [{ type: TabStopType.RIGHT, position: 9026 }],
            spacing: { before: 60, after: 0 },
            children: [
              new TextRun({ text: "+ ", color: "E8C98A", size: 16, font: "Arial" }),
              new TextRun({ text: "belegchat.de", color: "7A6A58", size: 16, font: "Arial" }),
              new TextRun({ children: [new PositionalTab({
                alignment: PositionalTabAlignment.RIGHT,
                relativeTo: PositionalTabRelativeTo.MARGIN,
                leader: PositionalTabLeader.NONE
              })], size: 16 }),
              new TextRun({ text: "BERENT.AI · Beratung + Entwicklung", italic: true, color: "7A6A58", size: 16, font: "Arial" }),
            ]
          })
        ]
      })
    },
    children: [
      // Titelseite + Inhalt hier
    ]
  }]
});
```

---

## 12 · Kritische Regeln

- **Niemals Standard-Bullets** — immer `+ ` als Prefix-TextRun
- **Fließtext immer Blocksatz** (`AlignmentType.BOTH`)
- **Trennelemente** (`+ + +`) zwischen allen Hauptkapiteln
- **Kästen immer** mit `ShadingType.CLEAR` (nicht `SOLID`)
- **Footer-Tab** per `TabStopType.RIGHT` setzen, nie Tabelle im Footer
- **Seitengröße**: A4, immer explizit setzen
- **Keine Seitennummer** im Standard-Footer — nur Links/Rechts-Text
