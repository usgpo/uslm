# United States Legislative Markup (USLM) v2.1 — Developer’s Guide

> Draft for review. Focused on practical authoring/consumption by application developers and data engineers, with a tailored profile for codified state laws.

---

## 0. Audience & Scope

**Audience.** Engineers building parsers, validators, renderers, and editorial tooling; product managers and legal informatics specialists designing legislative data pipelines.

**Scope.** This guide operationalizes the USLM **v2.1** XML Schemas (`uslm-2.1.0.xsd`, `uslm-components-2.1.0.xsd`, `uslm-table-module-2.1.0.xsd`) for production use. It prioritizes the subset required to represent codified law (titles/chapters/sections and notes) and the mechanics to make the documents resolvable, versionable, and HTML-renderable. A "State Codes Profile" is included.

> **Rule of thumb:** Prefer the schema. Where legacy guidance conflicts, conform to the v2.1 XSDs.

---

## 1. Quick Start

### 1.1 Minimal valid USLM law document (codified law)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<lawDoc
  xmlns="http://schemas.gpo.gov/xml/uslm"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://schemas.gpo.gov/xml/uslm uslm-2.1.0.xsd"
  version="2.1.0"
  identifier="/us/co/rev/t12"
  xml:lang="en">
  <meta>
    <property name="docTitle">Colorado Revised Statutes, Title 12</property>
    <property name="docReleasePoint">2025-07-01</property>
  </meta>
  <main>
    <toc>
      <tocItem title="Article 1">
        <column>1.</column>
        <column>General Provisions</column>
      </tocItem>
    </toc>

    <level role="title" name="t{num}">
      <num value="12">Title 12</num>
      <heading>Professions and Occupations</heading>

      <level role="article" name="art{num}">
        <num value="1">Article 1</num>
        <heading>General Provisions</heading>

        <section name="s{num}" identifier="/us/co/rev/t12/art1/s12-1-101">
          <num value="12-1-101">12-1-101</num>
          <heading>Definitions.</heading>
          <content>
            <p>As used in this title…</p>
          </content>
          <notes type="uscNote">
            <sourceCredit>(Source: L. 2025, ch. 12, § 1)</sourceCredit>
          </notes>
        </section>

      </level>
    </level>
  </main>
</lawDoc>
```

**Validate** with your XML toolchain (e.g., Xerces, libxml2). Ensure `xsi:schemaLocation` points to your deployed XSD URL or local file path.

### 1.2 Core elements you will actually use (codified law)

- \`\` — root element; carries `version`, optional `identifier`, optional `xml:base`.
- `** → **`\*\* / \*\*\`\` — free-form metadata; keep it concise and computable.
- \`\` — container for the body.
- **Hierarchy** via \`\` (big levels) and concrete synonyms (e.g., `title`, `chapter`, `article`, `section`, `subsection`, …).
- `**, **`\*\*, \*\*\`\` — the triplet for most levels.
- \`\` and inline spans (`b`, `i`, `sub`, `sup`, `del`, `ins`).
- `**/**`, and specialized notes (`sourceCredit`, `statutoryNote`, `editorialNote`, `changeNote`).
- \`\` — internal/external references with `href`, `idref`, and `portion`.
- **Tables** — prefer \*\*XHTML \*\*\`\` (from the table module); use USLM `<layout>` only for non-tabular columnar layouts.

---

## 2. Namespaces, Modules, and Versioning

- **USLM namespace**: `http://schemas.gpo.gov/xml/uslm`
- **XHTML (tables) namespace**: `http://www.w3.org/1999/xhtml`
- **Schema files**: include `uslm-2.1.0.xsd` as the root; it imports components and the table module.
- \`\`\*\* attribute\*\* on `lawDoc` advertises schema version (string; recommend `2.1.0`).
- \`\` (optional) can advertise the preferred resolver endpoint; leave unset unless you operate a resolver.

> Compatibility note: v2.1 formalizes many patterns already used in practice; the concrete level elements (e.g., `<section>`) are substitution-group members of the abstract `<level>` and validate accordingly.

---

## 3. The Document Model in Practice

### 3.1 Structural primitives

- `(empty),` (span-like), `(no direct text),` (block with mixed content). Most concrete elements derive from these.

### 3.2 Core containers

- \`\` → `property`/`set` for computed or editorial metadata (e.g., release dates, editorial status, capture provenance). Avoid duplicating what can be derived from the body.
- \`\` — unique body container. Do not assign `@id` or `@name` to `main`.
- \`\` — rarely used for codified state law except for compiled acts/rules; use as needed.

### 3.3 Hierarchy & “sandwich” text

- Big levels (`title`, `subtitle`, `chapter`, `subchapter`, `part`, `subpart`, `division`, `subdivision`, `article`, `subarticle`) → contain children levels or `content`.
- Primary level: \`\`.
- Small levels (`subsection`, `paragraph`, `subparagraph`, `clause`, `subclause`, `item`, `subitem`, `subsubitem`) → typically contain numbered text blocks.
- Use `before child levels and` after; \`\` for “Provided that …” paragraphs.

### 3.4 Numbering and labels

- ` holds the human-visible designation; **always set **` to a normalized form (e.g., `12-1-101`, `a`, `1`, `A`, `i`).
- \`\` is optional but recommended at big levels and sections.
- \`\` (attribute) may be parameterized, e.g., `name="s{num}"`.

### 3.5 Notes

- Use `<notes type="uscNote">` to group notes at the section or heading level.
- Specialized notes (`sourceCredit`, `statutoryNote`, `editorialNote`, `changeNote`) are concrete `note` derivatives; place inside `notes`.

### 3.6 Tables

- Prefer **XHTML tables**: embed `<table xmlns="http://www.w3.org/1999/xhtml">` with standard `<thead>/<tbody>/<tr>/<td>`.
- Use \`\` only for non-tabular columnar layouts (e.g., TOCs with leaders `@leaders='.'`).

---

## 4. Identity, Addressing, and References

### 4.1 Immutable identity vs. temporal identity

- \`\` — immutable GUID-like handle; must be unique *within the document* and stable across moves.
- \`\` — human-readable, changes with numbering/location (e.g., `s12-1-101_a_1_A`).
- \`\` — local name, can be parameterized (e.g., `s{num}`); used by resolvers.
- \`\` (on `lawDoc` and optionally levels) — absolute logical path used by resolvers (see 4.3).

### 4.2 References in markup

- \`\` supports: `href` (absolute logical path), `idref` (to another `ref`), and `portion` (to append subpath like `/s12-1-101/a`).

### 4.3 Logical URL pattern (recommended)

A resolver-friendly logical path for state codes:

```
/us/{state-postal}/rev   → whole code library ("rev" = revised statutes; adapt as needed)
/us/{state-postal}/rev/t{title}/[art{article}/]s{section}
```

Examples:

- `/us/co/rev/t12/s12-1-101`
- `/us/ny/cls/t12/s12-101` (if your code series distinguishes "Consolidated Laws")

> This is a **profile convention** for interoperability. USLM itself does not prescribe state code paths; pick one and be consistent.

---

## 5. Versioning (Temporal Model)

- Attach `** / **` (ISO-8601) and \`\` to the *lowest viable element* (prefer `num` or `heading` for big levels; at section/small levels, annotate the level or its text fragment).
- Allow coexisting versions of the same element differentiated by temporal attributes.
- Typical statuses for codified law: `operational`, `repealed`, `expired`, `omitted`, `reserved`, `vacant`, `renumbered`, `transferred`.
- For point-in-time views, filter by date across the hierarchy, inheriting periods downward when absent.

---

## 6. Presentation Model & HTML5 Mapping

**Principle:** Separate semantics from presentation. Use CSS via class names; reserve `@style` for legacy exceptions.

**USLM→HTML5 mapping (round-trippable):**

- `marker`/`inline` → `<span>`
- `block`/`content` → `<div>`
- `layout` → `<table>` (USLM flavor); `column` becomes `<td>` in a synthetic row
- Carry through: `@style`, `@id`, `@href`, `@idref`, `@src`, `@alt`, `@colspan`, `@rowspan`; map `xml:lang`→`lang`.
- Compose HTML `class` as `localName` + `_` + `role` (if any) + CSS classes; keep role as HTML `role`.

---

## 7. Authoring Patterns & Validation

### 7.1 Authoring rules of thumb

- Model **as published**, in the order printed; avoid generated text.
- Keep attributes **normalized and computable** (`@value` on `num`, ISO dates, normalized IDs).
- Prefer concrete elements (e.g., `<section>`) over generic `<level role="section">` when available.
- Use `** + **`\*\* + \*\*\`\` for compact amending instructions and cross-references.
- Use `@xml:lang` when text language changes.

### 7.2 Validation pipeline

1. **XSD validation**: validate against `uslm-2.1.0.xsd`.
2. **Schematron (optional)**: enforce project-specific constraints (e.g., identifier patterns, forbidden elements in your state profile).
3. **Content checks**: unique `@id`, existence of `@value` on `num`, presence of `heading` at configured levels, date/status vocabulary check, non-empty `content` at leaf nodes.

### 7.3 Common validation rules (expressible in Schematron)

- `section/num[@value]` is required; value matches your section-number regex.
- `notes/sourceCredit` must be last child under `section` (or under `notes`).
- Disallow `preamble`, `enactingFormula`, `action/instruction` in codified law corpus unless storing session laws.

---

## 8. State Codes Profile (Recommended Subset)

### 8.1 In-scope elements

- **Document & metadata**: `lawDoc`, `meta`, `property`, `set`
- **Hierarchy**: `title`, `chapter`, `article` (if applicable), `section`, `subsection`, `paragraph`, `subparagraph`, `clause`
- **Text containers**: `content`, `text`, `p`, `chapeau`, `continuation`, `proviso`
- **Labels**: `num`, `heading`, `subheading`
- **Notes**: `notes`, `sourceCredit`, `statutoryNote`, `editorialNote`, `changeNote`
- **Cross-references**: `ref`
- **Tables**: XHTML `<table>` and the USLM `<layout>` for TOC-like displays

### 8.2 Out-of-scope (omit unless you truly need them)

- **Enactment/drafting constructs**: `preamble`, `recital`, `enactingFormula`, `instruction`, `action`, `quotedContent/quotedText` for amendments (keep only if you store session laws).
- **Signatures**: `signatures`, `signature`, `made`, `approved`.
- **Appendix constructs** not used by your state (e.g., `reorganizationPlan`, `courtRule`), unless your code includes them.

### 8.3 Attribute usage

- **Required/strongly recommended:**
  - `num/@value` at every level.
  - `section/@name` (e.g., `s{num}`) and, optionally, `@identifier` at key big levels.
  - `@startPeriod/@endPeriod/@status` where temporal versions coexist.
- **Optional:** `@temporalId` (useful for resolver mapping), `@class` for CSS, `@style` for exceptions.

### 8.4 Identifier & URL profile

- Root `lawDoc@identifier` → `/us/{state}/rev` (or another stable code-series name).
- Big levels may also carry `@identifier` if you want deep linkability; sections should have them when addressable.
- Normalize slugs (hyphens, lowercase where sensible).

### 8.5 Numbering normalization examples

- Title → `<num value="12">Title 12</num>`
- Article → `<num value="1">Article 1</num>`
- Section → `<num value="12-1-101">12-1-101</num>`
- Subsection → `<num value="a">(a)</num>`
- Paragraph → `<num value="1">(1)</num>`
- Subparagraph → `<num value="A">(A)</num>`
- Clause → `<num value="i">(i)</num>`

### 8.6 Notes practice

- Prefer a single `notes` container per section, with `sourceCredit` first, then `editorialNote`/`statutoryNote` as needed.
- Use `@topic` to classify, e.g., `@topic="amendments construction"`.

### 8.7 Tables in codes

- Legislative tables often express schedules/fee tables. Use XHTML tables. Keep semantic text outside cells when possible.

---

## 9. Cross-References & Citations

- Represent intra-code citations with `ref href="/us/co/rev/t12/s12-1-101"`.
- Where text must show the citation, keep the human-readable string in `p` and include a sibling/embedded `ref` for machine-readability.
- When a base document is declared once, use `ref@id` + downstream `ref@idref` and `@portion` to construct target references without duplication.

---

## 10. Amendments (if you also store session laws)

> If you store only codified law, you can skip this section.

- Use `instruction` blocks with `action` children to model amendatory text.
- Quoted material goes in `quotedText` / `quotedContent`.
- Target selection uses `ref` with `@pos`, `@posText`, `@posCount`.

---

## 11. Tooling Patterns

- **Parsing & validation**: libxml2/xerces; pre-load the v2.1 schemas; fail fast on XSD errors.
- **PIT (point-in-time) materialization**: filter by `startPeriod`/`endPeriod` + `status`.
- **Rendering**: XSLT (USLM→HTML5); CSS classes from element/role; handle `<layout>` and XHTML `<table>` distinctly.
- **Search/resolve**: index `identifier`, `name`, `temporalId`, `num/@value`, and `heading`.
- **Diff & merge**: compare by `@id`; avoid text-only diffs where structure changes.

---

## 12. Quality Checklist (Codified Law)

-

---

## 13. Appendix A — Element Cheat Sheet (subset)

**Document**: `lawDoc (version, identifier, xml:lang, xml:base?)`

**Metadata**: `meta → property(name, value/date/…); set(name)`

**Body**: `main`

**Hierarchy**: `title, chapter, article, section, subsection, paragraph, subparagraph, clause, …`

**Numbering & labels**: `num(@value), heading, subheading`

**Text containers**: `content, text, p, chapeau, continuation, proviso`

**Notes**: `notes(@type,@topic), sourceCredit, statutoryNote, editorialNote, changeNote`

**Refs**: `ref(@href,@id,@idref,@portion)`

**Tables**: XHTML `<table>`; USLM `<layout>/<header>/<row>/<column>` (with `@colspan`, `@rowspan`, `@leaders`)

**Versioning**: `startPeriod, endPeriod, status, partial`

---

## 14. Appendix B — Regex & Patterns (examples)

- **Colorado section**: `^\d{2}-\d-\d{3}(\.\d+)?[A-Za-z]?$`
- **Identifier path**: `^/us/[a-z]{2}/[a-z0-9-]+(/t\d+(/art\d+)?)?/s[\w.-]+$`
- **Temporal date**: `^\d{4}-\d{2}-\d{2}(T\d{2}:\d{2}:\d{2}(Z|[+-]\d{2}:\d{2})?)?$`

> Tailor these to each jurisdiction; enforce with Schematron or application logic.

---

## 15. Appendix C — Migration Notes

- If migrating from earlier guidance, prioritize: (1) proper `@value` normalization, (2) XHTML tables over bespoke markup, (3) consistent identifiers, (4) removal of session-law constructs from codified corpus.

---

## 16. License & Provenance

This guide is derived from the USLM v2.1 XSDs and is intended to be implementation guidance. Retain your own change log and date it with each release.

