Prepared by: Government Publishing Office

Revised: September 26, 2024

# Contents

[1 Introduction [1](#introduction)](#introduction)

[2 Conventions Used in the User Guide
[2](#conventions-used-in-the-user-guide)](#conventions-used-in-the-user-guide)

[3 Brief USLM Background [3](#brief-uslm-background)](#brief-uslm-background)

[4 Existing Documentation
[4](#existing-documentation)](#existing-documentation)

[5 What Has Not Changed [5](#what-has-not-changed)](#what-has-not-changed)

[6 Schema Changes [6](#schema-changes)](#schema-changes)

[6.1 New Document Type [6.1](#new-document-type)](#new-document-type)

[6.2 New Elements [6.2](#new-elements)](#new-elements)

[6.3 New Attributes [6.3](#new-attributes)](#new-attributes)

[6.4 Mathematical Formulae
[6.4](#mathematical-formulae)](#mathematical-formulae)

[7 Feedback [7](#feedback)](#feedback)



# 1. Introduction

This Review Guide is intended to help readers to understand changes in the
2.0.17 version of the United States Legislative Markup (USLM) schema so that
they can provide meaningful feedback on the changes. This guide assumes that
the reader is familiar with the 2.0.12 version of the USLM schema and is
generally knowledgeable about XML schemas in XSD format. For more information
about the 2.0.12 and 1.0 versions of this schema, see section 4 of this
document for links to existing documentation.

This guide reflects USLM schema version 2.0.17.

# 2. Conventions Used in the User Guide

The following conventions are used in the User Guide:

- XML element names are denoted with angled brackets. For example, `<title>` is
  an XML element.

- XML attribute names are denoted with an “@” prefix. For example, `@href` is an
  XML attribute.

- Enumerated values are denoted in a fixed width font. For example, `landscape` is an enumeration.

- String values are denoted with double quotes. For example, `“title1-s1”` is a
  string value.

- A new ***term*** being defined is shown in bold italic.

- A new **element** or **attribute** being defined is shown in bold.

# 3. Brief USLM Background

The USLM schema was first developed in 2013 by the Office of the Law Revision
Counsel of the U.S. House of Representatives (OLRC) in order to produce the
United States Code in XML. Since 2013, the OLRC regularly produces a USLM
version of the United States Code for download at
<http://uscode.house.gov/download/download.shtml>. The USLM version of the U.S.
Code is updated continuously as new laws are enacted.

The original goals of the USLM schema included:

1.  *Allow existing titles of the United States Code to be converted into XML.*

2.  *Support ongoing maintenance of the United States Code.*

3.  *Support the drafting of new positive law codification bills and related
materials.*

4.  *Provide a flexible foundation to meet future needs of Congress.*

5.  *Compatibility with existing legislative documents in other XML formats.*

The 2.0.12 version of the USLM schema extended its use to the following
document sets:

- Enrolled Bills and Resolutions

- Public Laws

- Statutes at Large

- Statute Compilations

- Federal Register (FR)

- Code of Federal Regulations (CFR)

The 2.0.17 version of the USLM schema further extends its use to

- Bill and Resolution document stages prior to enrollment

- Older Statutes at Large volumes

# 4. Existing Documentation

User documentation for the 1.0 version of the schema can be found at
<https://github.com/usgpo/uslm/blob/main/USLM-User-Guide.pdf> and
<https://github.com/usgpo/uslm/blob/main/USLM-User-Guide.md>.

User documentation for the 2.0.12 version of the schema can be found at
<https://github.com/usgpo/uslm/blob/main/USLM-2_0-Review-Guide-v2_0_12.pdf> and
<https://github.com/usgpo/uslm/blob/main/USLM-2_0-Review-Guide-v2_0_12.md>.

The XSD schema and CSS stylesheets for online viewing can be downloaded at:
<http://uscode.house.gov/download/resources/schemaandcss.zip> and
<https://github.com/usgpo/uslm>. Note that the CSS stylesheet is informational
only. It produces a draft view of the documents.

Note: These resources and more are available on GPO’s Developers Hub at
<https://www.govinfo.gov/developers>.

# 5. What Has Not Changed

Version 2.0.17 of USLM is an incremental change to the 2.0.12 schema. While
some new elements have been added and a few content models have been extended,
the fundamental design of the schema has not changed. Documents that were valid
in version 2.0.12 are also valid in version 2.0.17 of the USLM schema.

We have added one new document type, and a number of elements and attributes.
Some content models have been loosened to allow constructs that we have seen in
bill and resolution document stages prior to enrollment, and in older
Statutes at Large volumes.

# 6. Schema Changes

## 6.1 New Document Type 

The **`<constitutionalAmendment>`** element is a document containing an
Amendment to the Constitution of the United States. It has the same structure
as other types of law documents.

## 6.2 New Elements

The `<leftRunningHead>` and `<rightRunningHead>` elements have been joined by a
**`<centerRunningHead>`** element.

The **`<endorsement>`** element is a new element used in bills and resolutions
prior to enrollment. It is found at the end of the document and contains a
selection of document metadata. It is usually printed sideways. 

The **`<addedText>`** and **`<deletedText>`** elements are used to indicate
added or deleted content that amends a bill or resolution in amendment
documents and reported bills. The styling is determined by the attributes set
on the committee whose ID is used in the `@origin` attribute of the content.
The existing elements `<quotedText>` and `<quotedContent>` are used to indicate
amendments to law.

The `<preface>` element now allows two new elements: **`<firstPageHeading>`**
and **`<firstPageSubheading>`**.

A **`<referenceMarker>`** element is allowed with or instead of a `<num>`
element for cases when a level requires a non-hierarchical designation with or
instead of the usual hierarchical designation.

## 6.3 New Attributes

The **`@addedDisplayStyle`** and **`@deletedDisplayStyle`** attributes declare
the styles used in bills, resolutions, and amendment documents prior to
enrollment to indicate added or deleted content that amends bills and
resolutions. These attributes are set on the `committee` element defining the
committee that produced the reported bill or amendments document. 

## 6.4 Mathematical Formulae

USLM 2.0.17 incorporates the MathML 3 schema. This provides support for
representing most mathematical formulae.

# 7. Feedback

To submit feedback, questions, or comments about the USLM 2.0.17 schema and
this Review Guide, please open a GitHub issue at
<https://github.com/usgpo/uslm/issues>.
