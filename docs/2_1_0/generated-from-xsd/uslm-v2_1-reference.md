# USLM 2.1 Reference Guide (Draft)

> **Status:** Working draft for discussion. Not official USLM documentation. Generated from the USLM 2.1 XSDs and refined by a human editor. Target audience: engineers, editors, and implementers working with codified statutes and other legislative documents.

---

## 0. About this Guide

This guide is a human‑readable companion to the **USLM 2.1** schema (version `2.1.0`). It summarizes the structure and common patterns exposed by the XSDs and provides pragmatic examples. It is intentionally concise and structured for implementers. Errors or omissions are possible—please propose corrections.

**Inputs used**

- `uslm-2.1.0.xsd` (main schema)
- `uslm-components-2.1.0.xsd` (core elements)
- `uslm-table-module-2.1.0.xsd` (XHTML tables)
- Historical “User Guide” (v2.0 era), referenced to align terminology where still applicable

**Method**

- Seeded by automated extraction of element/attribute structures from XSDs
- Reviewed and edited by a human for clarity and organization

---

## 1. Version & Namespaces

- **Primary namespace (default):** `http://schemas.gpo.gov/xml/uslm`
- **Schema location hint:** `uslm-2.1.0.xsd`
- **Version attribute:** `lawDoc@schemaVersion` (optional string; recommended value `2.1.0`)
- **Common companion namespaces**
  - `dc:` `http://purl.org/dc/elements/1.1/` (Dublin Core)
  - `xhtml:` `http://www.w3.org/1999/xhtml` (tables, images)
  - `mathml:` `http://www.w3.org/1998/Math/MathML` (math)
  - `msenate:` `https://www.senate.gov/schemas` (Senate metadata)

### Minimal document prolog

```xml
<?xml version="1.0" encoding="UTF-8"?>
<bill xmlns="http://schemas.gpo.gov/xml/uslm"
      xmlns:dc="http://purl.org/dc/elements/1.1/"
      xmlns:xhtml="http://www.w3.org/1999/xhtml"
      xmlns:mathml="http://www.w3.org/1998/Math/MathML"
      xml:lang="en">
  ...
</bill>
```

---

## 2. Top‑Level Document Types (substitution of `<lawDoc>`)

USLM models many document kinds via elements that **substitute** for the abstract root `<lawDoc>` and share the same structure:

| Element                                | Domain      | Notes                           |
| -------------------------------------- | ----------- | ------------------------------- |
| `<bill>`                               | Legislative | House/Senate bills              |
| `<resolution>`                         | Legislative | Joint, concurrent, simple       |
| `<amendment>` / `<engrossedAmendment>` | Legislative | Pre‑enactment changes           |
| `<constitutionalAmendment>`            | Legislative | Constitutional proposals        |
| `<pLaw>`                               | Legal       | Public/private laws (slip laws) |
| `<statute>`                            | Legal       | Individual statute              |
| `<statuteCompilation>`                 | Legal       | Compiled statutes               |
| `<statutesAtLarge>`                    | Legal       | Statutes at Large volumes       |
| `<uscDoc>`                             | Legal       | U.S. Code titles/appendices     |
| `<frDoc>`                              | Regulatory  | Federal Register documents      |
| `<rule>`                               | Regulatory  | Regulatory rules                |
| `<notice>`                             | Regulatory  | Federal notices                 |
| `<presidentialDoc>`                    | Regulatory  | Presidential documents          |
| `<cfrDoc>`                             | Regulatory  | Code of Federal Regulations     |

> **All** of the elements above share the `` structure described next.

---

## 3. Canonical Document Skeleton (LawDocType)

`LawDocType` composes a legislative/legal document as follows (optional components in brackets):

```xml
<lawDoc-like-root schemaVersion="2.1.0" xml:lang="en">
  <meta> ... Dublin Core, sets/properties, actions ... </meta>
  [<page/>]
  [<preface> ... rendered header, numbers, chamber, actions ... </preface>]
  [<main>   ... long/short title, enacting/resolving clauses, body ... </main>]
  [<block>  ... general block containers (rare at root) ... </block>]
  [<notes>  ... editorial notes ... </notes>]
  [<backMatter> ... appendices, indices, certification ... </backMatter>]
  [<endMarker/>]
  [<appendix> ... supplementary content ... </appendix>]*
</lawDoc-like-root>
```

**Common attributes available broadly** (via attribute groups on base types):

- Identification: `id`, `identifier`, `temporalId`, `scope`
- Classification/styling: `role`, `class`, `style`, `styleType`
- Versioning: `startPeriod`, `endPeriod`, `status`, `partial`, `inEffect`
- XML specials: `xml:lang`, `xml:base`, `xml:space`
- Provenance/layout (on blocks/content): `origin` (URI), `orientation` (`portrait|landscape`)
- Change flags: `changed` (`added|deleted|notChanged`)

---

## 4. Metadata (`<meta>`) Quick‑Start

`<meta>` accepts a flexible mix of:

- **Dublin Core** elements (`dc:title`, `dc:creator`, `dc:date`, etc.)
- **USLM‑specific** metadata (e.g., `<action>`, `<relatedDocuments>`, `<metaElement>`, `<property>`, `<set>`, `publicPrivate`, `publicPrint`, `starPrint`)
- **Chamber‑specific** metadata (`msenate:*`, and House namespace when present)

### Common metadata patterns

- **Properties/Sets** for machine‑readable key/value metadata
  ```xml
  <meta>
    <property name="congress" value="118"/>
    <set name="identifiers">
      <property name="billNumber" value="S.1234"/>
      <property name="docClass" value="public"/>
    </set>
  </meta>
  ```
- **Related documents**
  ```xml
  <relatedDocuments>
    <ref href="https://www.congress.gov/bill/118th-congress/senate-bill/1234"/>
  </relatedDocuments>
  ```

**Date/Value attribute groups** appear on several meta and inline elements: `date`, `legisDate`, `startDate`, `endDate`, and `value/startValue/endValue`.

---

## 5. Preface & Main

- `<preface>` holds the rendered header: document numbers, chamber, action descriptors, sponsor info, etc.
- `<main>` contains the **primary substantive content**:
  - Long title & short title
  - Enacting/resolving clauses (`<enactingFormula>`, etc.)
  - The hierarchical body (see §6)

**Example (bird’s‑eye)**

```xml
<bill>
  <meta>...</meta>
  <preface>
    <heading>118th Congress • 2d Session</heading>
    <heading>S. 1234</heading>
  </preface>
  <main>
    <longTitle>A bill to modernize …</longTitle>
    <enactingFormula>Be it enacted …</enactingFormula>
    <section id="s1">
      <num>Section 1.</num>
      <heading>Short Title.</heading>
      <content>This Act may be cited as the <quotedText>Modernization Act</quotedText>.</content>
    </section>
  </main>
</bill>
```

---

## 6. Hierarchical Structure (Levels)

Core structural elements are **levels** that share a common content model (USLM’s `LevelType`). Typical hierarchy (not exhaustive):

`title → part → division → chapter → article → section → subsection → paragraph → subparagraph → clause → subclause → item`

Each level may contain:

- Optional **numbering** and **headings** (`<num>`, `<heading>`, `<crossHeading>`)
- **Content blocks** (`<content>`, `<p>`, `<text>`) and **notes/footnotes/pages**
- Nested **levels** (`<level>` as a generic nested container) or specific child levels
- Optional **appendices** and **signatures** in certain contexts

**Example (statute fragment)**

```xml
<statute schemaVersion="2.1.0">
  <meta>...</meta>
  <main>
    <section id="sec-101">
      <num>SEC. 101.</num>
      <heading>Definitions.</heading>
      <paragraph id="sec-101(a)">
        <num>(a)</num>
        <content>In this Act, the term <inline role="term">“agency”</inline> means …</content>
      </paragraph>
    </section>
  </main>
</statute>
```

---

## 7. Inline/Block Primitives

USLM is built on four primitive element types:

| Primitive   | Purpose                    | Typical Uses                               |
| ----------- | -------------------------- | ------------------------------------------ |
| `<marker/>` | Empty positional markers   | page/line/location marks                   |
| `<inline>`  | Inline‐level mixed content | emphasis, small caps, citations, `<ref>`   |
| `<block>`   | Block‑level containers     | generic structural divisions               |
| `<content>` | Mixed content container    | paragraphs and inline markup within levels |

Notable inline/block companions:

- **Notes and editorial**: `<note>`, `<notes>`, `<footnote>`, `<proviso>`, `<quotedText>`
- **External content**: `xhtml:img`, `xhtml:table`, `mathml:math`

---

## 8. Cross‑References (`<ref>`)

`<ref>` is an inline element for references and citations.

**Attributes (selected)**

- **ReferenceGroup**: `href` (URI), `idref` (IDREF), `portion` (string selector)
- **AmendingGroup**: `pos`, `posText`, `posCount` (amendment positioning)
- **DateGroup**: `date`, `legisDate`, `startDate`, `endDate`
- **ValueGroup**: `value`, `startValue`, `endValue`
- ``: a `PropertyTypeEnum` (`string|number|token|boolean|text|date|url`)

**Example**

```xml
<content>
  See <ref href="#sec-101">section 101</ref> and
  <ref href="https://www.ecfr.gov/current/title-2">2 CFR</ref>.
</content>
```

---

## 9. Tables & Math

USLM integrates **XHTML** tables and images and **MathML**:

```xml
<content>
  <xhtml:table>
    <xhtml:tr>
      <xhtml:th>Item</xhtml:th>
      <xhtml:th>Amount</xhtml:th>
    </xhtml:tr>
    <xhtml:tr>
      <xhtml:td>Appropriation</xhtml:td>
      <xhtml:td>$5,000,000</xhtml:td>
    </xhtml:tr>
  </xhtml:table>
  <mathml:math> ... </mathml:math>
</content>
```

---

## 10. Change Tracking & Effective Versions

Several attributes support change tracking and temporal modeling:

| Attribute                   | Where                  | Values/Type | Meaning                                                     |              |                        |
| --------------------------- | ---------------------- | ----------- | ----------------------------------------------------------- | ------------ | ---------------------- |
| `changed`                   | many block/level types | \`added     | deleted                                                     | notChanged\` | editorial change flags |
| `status`                    | VersioningGroup        | enumerated  | lifecycle status (`inEffect`, `repealed`, `reserved`, etc.) |              |                        |
| `startPeriod` / `endPeriod` | VersioningGroup        | date/time   | temporal effectiveness windows                              |              |                        |
| `partial`, `inEffect`       | VersioningGroup        | boolean     | partial codification, effectiveness                         |              |                        |

---

## 11. Common Attributes (Quick Reference)

- **IdentificationGroup**: `id`, `temporalId`, `identifier`, `scope`
- **ClassificationGroup**: `role`, `class`, `style`, `styleType`
- **XML Specials**: `xml:lang`, `xml:base`, `xml:space`
- **Layout/Origination**: `orientation` (`portrait|landscape`), `origin` (URI)

---

## 12. Key Enumerations

- `YesOrNoEnum`: `yes`, `no`
- `PropertyTypeEnum`: `string`, `number`, `token`, `boolean`, `text`, `date`, `url`
- `StatusEnum`: `crossReference`, `hadItsEffect`, `inEffect`, `omitted`, `pending`, `renumbered`, `repealed`, `reserved`, `suspended`, `transferred`, `unknown`, `vacant`
- `ChangedEnum`: `added`, `deleted`, `notChanged`
- `PositionEnum`: `start`, `before`, `inside`, `after`, `end`
- `PublicOrPrivateEnum`: `public`, `private`
- `OrientationEnum`: `portrait`, `landscape`

---

## 13. Topic‑Ordered Element Index (selected)

> This is a curated implementer’s index; it is not exhaustive. Items share common base types and attributes as described above.

**Roots (lawDoc substitutions)**: `bill`, `resolution`, `amendment`, `engrossedAmendment`, `constitutionalAmendment`, `pLaw`, `statute`, `statuteCompilation`, `statutesAtLarge`, `uscDoc`, `frDoc`, `rule`, `notice`, `presidentialDoc`, `cfrDoc`

**Document parts**: `meta`, `page`, `preface`, `main`, `block`, `notes`, `backMatter`, `appendix`,
