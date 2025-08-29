# United States Legislative Markup (USLM) v2.1
## User Guide with Focus on State Law Codification

### Version 2.1.0 | 2024

---

## Table of Contents
1. [Quick Start](#quick-start)
2. [Core Concepts](#core-concepts)
3. [Document Structure](#document-structure)
4. [State Law Codification](#state-law-codification)
5. [Elements Reference](#elements-reference)
6. [Attributes Reference](#attributes-reference)
7. [Practical Examples](#practical-examples)
8. [Validation](#validation)

---

## 1. Quick Start

### Minimal Valid USLM Document

```xml
<?xml version="1.0" encoding="UTF-8"?>
<bill xmlns="http://schemas.gpo.gov/xml/uslm"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://schemas.gpo.gov/xml/uslm uslm-2.1.0.xsd"
      schemaVersion="2.1.0">
  <meta>
    <dc:title xmlns:dc="http://purl.org/dc/elements/1.1/">Sample Bill</dc:title>
  </meta>
  <main>
    <section>
      <num>1.</num>
      <heading>Short Title</heading>
      <content>This Act may be cited as the "Sample Act of 2024".</content>
    </section>
  </main>
</bill>
```

### Key Namespaces

- **Primary**: `http://schemas.gpo.gov/xml/uslm`
- **Dublin Core**: `http://purl.org/dc/elements/1.1/`
- **XHTML Tables**: `http://www.w3.org/1999/xhtml`
- **MathML**: `http://www.w3.org/1998/Math/MathML`

---

## 2. Core Concepts

### Document Types

USLM v2.1 supports multiple document types:

| Element | Purpose | Use Case |
|---------|---------|----------|
| `<bill>` | Proposed legislation | Draft bills, introduced bills |
| `<resolution>` | Resolutions | Simple, joint, concurrent resolutions |
| `<pLaw>` | Enacted public/private laws | Signed legislation |
| `<uscDoc>` | U.S. Code titles | Codified federal law |
| `<statute>` | Enacted bills | Session laws |
| `<statuteCompilation>` | Compiled statutes | Updated public laws |
| `<amendment>` | Amendment documents | Pre-enactment amendments |

### Hierarchical Structure

USLM uses a flexible hierarchy system:

**Big Levels** (above section):
- `<title>` - Largest division
- `<subtitle>`, `<division>`, `<subdivision>`
- `<chapter>`, `<subchapter>`
- `<part>`, `<subpart>`
- `<article>`, `<subarticle>`

**Primary Level**:
- `<section>` - Primary unit of law

**Small Levels** (below section):
- `<subsection>` - Usually (a), (b), (c)
- `<paragraph>` - Usually (1), (2), (3)
- `<subparagraph>` - Usually (A), (B), (C)
- `<clause>` - Usually (i), (ii), (iii)
- `<subclause>` - Usually (I), (II), (III)
- `<item>` - Usually (aa), (bb), (cc)
- `<subitem>` - Usually (AA), (BB), (CC)

---

## 3. Document Structure

### Basic Document Template

```xml
<bill xmlns="http://schemas.gpo.gov/xml/uslm" schemaVersion="2.1.0">
  <!-- Metadata -->
  <meta>
    <dc:title xmlns:dc="http://purl.org/dc/elements/1.1/">Title</dc:title>
    <dc:date xmlns:dc="http://purl.org/dc/elements/1.1/">2024-01-01</dc:date>
    <docNumber>H.R. 1234</docNumber>
    <congress>118</congress>
    <session>2</session>
  </meta>
  
  <!-- Optional preface -->
  <preface>
    <docTitle>An Act</docTitle>
    <officialTitle>To accomplish something important...</officialTitle>
  </preface>
  
  <!-- Main content -->
  <main>
    <!-- Enacting clause -->
    <enactingFormula>Be it enacted by the Senate and House...</enactingFormula>
    
    <!-- Sections -->
    <section>
      <num>1.</num>
      <heading>Short Title</heading>
      <content>...</content>
    </section>
    
    <section>
      <num>2.</num>
      <heading>Findings</heading>
      <subsection>
        <num>(a)</num>
        <content>Congress finds that...</content>
      </subsection>
    </section>
  </main>
</bill>
```

### Content Models

#### Text Content
- `<content>` - Block-level mixed content
- `<chapeau>` - Introductory text before subsections
- `<continuation>` - Text after subsections
- `<proviso>` - "Provided that..." clauses

#### Inline Elements
- `<ref>` - Cross-references
- `<date>` - Date references
- `<term>` - Defined terms
- `<quotedText>` - Simple quoted material
- `<quotedContent>` - Complex quoted material with structure

---

## 4. State Law Codification

### Overview

When codifying state laws, you can leverage USLM's flexible structure while focusing on the elements most relevant to state statutory codes. Many federal-specific elements can be omitted.

### Recommended Document Structure for State Codes

```xml
<uscDoc xmlns="http://schemas.gpo.gov/xml/uslm" 
        schemaVersion="2.1.0"
        identifier="/us-ca/code">
  <meta>
    <dc:title xmlns:dc="http://purl.org/dc/elements/1.1/">
      California State Code
    </dc:title>
    <dc:publisher xmlns:dc="http://purl.org/dc/elements/1.1/">
      State of California
    </dc:publisher>
    <property name="jurisdiction">California</property>
    <property name="effectiveDate">2024-01-01</property>
  </meta>
  
  <main>
    <title>
      <num>1</num>
      <heading>General Provisions</heading>
      
      <chapter>
        <num>1</num>
        <heading>Preliminary Provisions</heading>
        
        <section>
          <num>1</num>
          <heading>Title of Code</heading>
          <content>This code shall be known as the California State Code.</content>
        </section>
        
        <section>
          <num>2</num>
          <heading>Definitions</heading>
          <subsection>
            <num>(a)</num>
            <content>As used in this code, unless the context requires otherwise:</content>
            <paragraph>
              <num>(1)</num>
              <content><term>State</term> means the State of California.</content>
            </paragraph>
          </subsection>
        </section>
      </chapter>
    </title>
  </main>
</uscDoc>
```

### State-Specific Considerations

#### 1. Jurisdiction Identification
Use metadata to clearly identify the state:

```xml
<meta>
  <property name="jurisdiction">California</property>
  <property name="stateCode">CA</property>
  <citableAs>Cal. Code</citableAs>
</meta>
```

#### 2. Citation Formatting
State citations often differ from federal. Use the `@identifier` attribute:

```xml
<section identifier="/us-ca/code/t1/ch1/s1">
  <num>1</num>
  <!-- Maps to: Cal. Code § 1 -->
</section>
```

#### 3. Cross-References
State codes frequently reference other state statutes:

```xml
<content>
  As defined in <ref href="/us-ca/code/t2/s100">Title 2, Section 100</ref>
  of this code...
</content>
```

#### 4. Temporal Versioning
Track amendments and effective dates:

```xml
<section status="inEffect" startPeriod="2024-01-01">
  <num>5</num>
  <heading>New Provision</heading>
  <content>This section takes effect January 1, 2024.</content>
  <note type="editorial">Added by S.B. 123, 2023 Leg., Reg. Sess.</note>
</section>
```

### Elements to Skip for State Codification

These federal-specific elements are typically not needed:

- `<congress>`, `<session>` - Federal legislative session markers
- `<enrolledDateline>` - Federal bill enrollment information
- `<resolvingClause>` - Congressional resolution language
- `<committee>` - Federal committee references
- `<publicPrivate>` - Federal law classification
- Most elements related to amendments and engrossed documents

### Simplified State Code Schema

Focus on these core elements:

**Structure**:
- `<title>`, `<chapter>`, `<article>`, `<part>`
- `<section>`, `<subsection>`, `<paragraph>`, `<subparagraph>`

**Content**:
- `<num>` - Section numbers
- `<heading>` - Section titles
- `<content>` - Legal text
- `<chapeau>`, `<continuation>` - Sandwich structures

**References**:
- `<ref>` - Cross-references
- `<date>` - Effective dates
- `<term>` - Defined terms

**Metadata**:
- `<note>` - Editorial notes
- `<sourceCredit>` - Amendment history

---

## 5. Elements Reference

### Most Common Elements

| Element | Purpose | Example |
|---------|---------|---------|
| `<num>` | Section/subsection number | `<num>101</num>` |
| `<heading>` | Section title | `<heading>Definitions</heading>` |
| `<content>` | Text content | `<content>The term means...</content>` |
| `<ref>` | Cross-reference | `<ref href="/us/usc/t5/s101">5 U.S.C. 101</ref>` |
| `<term>` | Defined term | `<term>Agency</term>` |
| `<date>` | Date reference | `<date date="2024-01-01">January 1, 2024</date>` |
| `<note>` | Editorial note | `<note type="editorial">Amended 2024</note>` |

---

## 6. Attributes Reference

### Key Attributes

| Attribute | Purpose | Example |
|-----------|---------|---------|
| `@id` | Unique identifier | `id="id-abc123"` |
| `@identifier` | URL-style reference | `identifier="/us-ca/code/t1/s1"` |
| `@status` | Provision status | `status="inEffect"` |
| `@startPeriod` | Effective date | `startPeriod="2024-01-01"` |
| `@date` | Normalized date | `date="2024-01-01"` |
| `@href` | External reference | `href="/us/pl/118/1"` |

---

## 7. Practical Examples

### Example: State Statutory Definition

```xml
<section>
  <num>100</num>
  <heading>Definitions</heading>
  <content>For purposes of this chapter:</content>
  <subsection>
    <num>(a)</num>
    <content>
      <term>Board</term> means the State Regulatory Board established 
      under <ref href="/us-ca/code/t3/s200">Section 200 of Title 3</ref>.
    </content>
  </subsection>
  <subsection>
    <num>(b)</num>
    <content>
      <term>License</term> means a license issued pursuant to this chapter.
    </content>
  </subsection>
</section>
```

### Example: Amendment History

```xml
<section>
  <num>50</num>
  <heading>License Requirements</heading>
  <content>Every applicant shall...</content>
  <sourceCredit>
    (Added by Stats. 2020, Ch. 15, Sec. 3. Amended by Stats. 2023, Ch. 101, Sec. 2.)
  </sourceCredit>
</section>
```

---

## 8. Validation

### Schema Validation

Validate against the USLM 2.1.0 schema:

```bash
xmllint --schema uslm-2.1.0.xsd --noout your-document.xml
```

### Common Validation Errors

1. **Missing required elements**: Ensure `<meta>` and `<main>` are present
2. **Invalid hierarchy**: Check that levels are properly nested
3. **Namespace issues**: Verify namespace declarations are correct
4. **Date format**: Use ISO 8601 format (YYYY-MM-DD)

### Best Practices

1. **Consistent numbering**: Use the same format throughout
2. **Meaningful IDs**: Use GUIDs or systematic IDs
3. **Complete metadata**: Include jurisdiction, dates, and citations
4. **Validate regularly**: Check validity after each major edit

---

## Resources

- **Schema Files**: Available at GPO's GitHub repository
- **Examples**: Reference implementations in the repository
- **Support**: File issues at the official repository

---

*This guide focuses on practical implementation for state law codification. For complete federal legislative markup requirements, consult the full USLM specification.*