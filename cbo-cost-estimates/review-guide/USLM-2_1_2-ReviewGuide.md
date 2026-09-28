Prepared by: Government Publishing Office \
Published: September 30, 2026
  
# Introduction

This Review Guide is intended to help users to understand changes in the 2.1
version of the United States Legislative Markup (USLM) schema so that users can
provide meaningful feedback about the changes. This guide assumes that the
reader is familiar with the 1.0 and 2.0, 2.0.12, 2.0.17, 2.1.0, and 2.1.1 versions of the USLM schema and is
generally knowledgeable about XML schemas in XSD format. For more information
about previous versions, see the [Existing Documentation](#existing-documentation) 
section of this document for links to existing documentation.

This guide reflects USLM schema version 2.1.2. It is a draft version and will be updated in the near future. 

# Conventions Used in the User Guide

The following conventions are used in the User Guide:

- XML element names are denoted with angled brackets. For example,
  `<title>` is an XML element.

- Groups of elements are denoted with a word followed by the word 'elements'. 
  For example, 'positioned note elements' includes any of the elements
   `<footnote>`, `<sidenote>`, `<endnote>`, and `<ear>`.

- XML attribute names are denoted with an “`@`” prefix. For example, `@href`.
  is an XML attribute.

- Enumerated values are denoted in a fixed width font. For example, `landscape` is an enumeration.

- String values are denoted with double quotes. For example, “`title1-s1`”
  is a string value.

- A new ***term*** being defined is shown in bold italic.

- A new **element** or **attribute** being defined is shown in bold.

- Words in curly brackets (\{...\}) are to be replaced by the value. For example, 
  \{official title\} would be replaced by the official title of the document.

# Brief USLM Background

The USLM schema was first developed in 2013 by the Office of the Law
Revision Counsel of the U.S. House of Representatives (OLRC) in order to
produce the United States Code in XML. Since 2013, the OLRC regularly
produces a USLM version of the United States Code for download at
<http://uscode.house.gov/download/download.shtml>. The USLM version of
the U.S. Code is updated continuously as new laws are enacted.

The original goals of the USLM schema included:

1.  *Allow existing titles of the United States Code to be converted
    into XML.*

2.  *Support ongoing maintenance of the United States Code.*

3.  *Support the drafting of new positive law codification bills and
    related materials.*

4.  *Provide a flexible foundation to meet future needs of Congress.*

5.  *Compatibility with existing legislative documents in other XML
    formats.*

Building on the “flexible foundation” in goal number four above, the
Government Publishing Office (GPO) released the 2.0 update to
USLM that extended its use to the following document sets:

- Enrolled Bills and Resolutions

- Public and Private Laws

- Statutes at Large

- Statute Compilations

- Federal Register (FR)

- Code of Federal Regulations (CFR)

The documentation for the USLM used in these document sets is in the 2.0.12
version of the Review Guide. 

Further additions were made to USLM 2.0 to enable its use for bills and
resolutions in all document stages. This is documented in the 2.0.12 and 2.0.17
versions of the Review Guide.

The changes made to the USLM schema to support its use for amendment documents 
were breaking changes and the schema numbering 2.1 reflected that. This is 
documented in the 2.1 version of the Review Guide.

The changes made to the USLM schema to support its use for legislative committee reports 
were documented in the 2.1.1 version of the Review Guide. The 2.1.2 version of the USLM schema
completes that work by adding elements and attributes suitable for use in the Congressional
Budget Office cost estimates that can be included in legislative committee reports.


# Existing Documentation

User documentation for the 1.0 version of the schema can be found at  
<https://github.com/usgpo/uslm/blob/main/USLM-User-Guide.pdf> and  
<https://github.com/usgpo/uslm/blob/main/USLM-User-Guide.md>.

User documentation for the 2.0 version of the schema, to version 2.0.12, can be found at  
<https://github.com/usgpo/uslm/blob/main/USLM-2_0-Review-Guide-v2_0_12.md> and  
<https://github.com/usgpo/uslm/blob/main/USLM-2_0-Review-Guide-v2_0_12.pdf>.

User documentation for the 2.0 version of the schema after 2.0.12, to version 2.0.17, 
can be found at  
<https://github.com/usgpo/uslm/blob/main/USLM-2_0-Review-Guide-v2_0_17.md> and  
<https://github.com/usgpo/uslm/blob/main/USLM-2_0-Review-Guide-v2_0_17.pdf>.

User documentation for the 2.1.0 version of the schema can be found at  
<https://github.com/usgpo/uslm/blob/main/USLM-2_1-ReviewGuide.md> and  
<https://github.com/usgpo/uslm/blob/main/USLM-2_1-ReviewGuide.pdf>.

User documentation for the 2.1.1 version of the schema can be found at  
<https://github.com/usgpo/uslm/blob/proposed/legislative-and-conference-reports/review-guide/USLM-2_1_1-ReviewGuide.md> and  
<https://github.com/usgpo/uslm/blob/proposed/legislative-and-conference-reports/review-guide/USLM-2_1_1-ReviewGuide.pdf>.

The XSD schema and CSS stylesheets for online viewing can be downloaded
from  
<https://github.com/usgpo/uslm>. Note that the CSS stylesheet is
informational only. It produces a draft view of the documents.

Note: These resources and more are available on GPO’s Developers Hub at
<https://www.govinfo.gov/developers>.

# What Has Not Changed

Version 2.1.2 of USLM is architecturally an incremental change to the schema.
While many new elements have been added and several content models have been
extended or modified, the fundamental design of the schema has not changed. The
following principles, documented in the 1.0 and 2.0 versions of the User Guide,
continue in version 2.1.2:

- Abstract and Concrete Models

- Inheritance

- Attribute Model

- Core Document Model

- Metadata Model

- Hierarchy Model

- Versioning Model

- Presentation Model

- Relationship to HTML

- Identification Model

- Referencing Model

Many of these models have been extended to accommodate the additional
document types and their structures. These extensions are
backwards-compatible except in a few cases described below.

# Schema Changes

## New Document Type: Congressional Budget Office Cost Estimates

The Congressional Budget Office (CBO) cost estimates provide information about how a measure would affect major components of the federal budget, with details about the analysis. See [https://www.cbo.gov/publication/56166](https://www.cbo.gov/publication/56166) for a document that explains the format. CBO cost estimates are not legislative documents and do not contain legislative content. They have specific metadata requirements and a specified content model. For this reason USLM 2.1.2 contains a new document type, **`<cboReport>`**. This document type uses new elements that are equivalent to the existing `<meta>`, `<preface>`, and `<main>` elements, namely **`<cboMeta>`**, **`<cboPreface>`**, and **`<cboCostEstimate>`**. As in other legislative documents, the `<cboMeta>` element contains the machine-processable metadata, `<cboPreface>` the metadata that is designed to be shown with the rest of the document content, and `<cboCostEstimate>` contains the main content of the `<cboReport>` document. The `<cboCostEstimate>` element can also be included in a legislative committee report, with the only changes required being those for styling. When this element is included in a legislative committee report, the expectation is that the `<cboMeta>` element will be included as-is in the `<reportMeta>` element of the legislative committee report.

## New Elements

Many elements may occur in more than one location in a report; they are described in the context of the first element in which they occur, not all elements.

### CBO Cost Estimate (document)

The new CBO cost estimate document element is **`<cboReport>`**. It is a complete document, with its own document type.

### CBO Meta

The **`<cboMeta>`** element contains machine-processable metadata for the entire report. The new elements allowed as child elements are documented below. 

**`<about>`**
: The `<cboMeta>` elements must contain sufficient information about the subject of the report to be able to precisely identify the version of the bill or resolution that the specified committee requested the cost estimate be developed for. There are three allowed formats for the `<about>` element; all three may occur in the document. The shortest version matches the short version of the measure's `<citableAs>` element. If this version is chosen, the **`<cboBillStatus>`** must also be present. The second matches the version of the measure's `<citableAs>` element with the `<docStage>` appended, while the full third version has the text of the `<about>` element as used in the **`<cboAtAGlance>`** element without the tags. 

~~~~
<cboMeta>
 ...  
<about> {dc:type} {docNumber}, {shortTitle} {cboBillStatus} by the {committee} on {date} </about>
 ...  
</cboMeta>
~~~~

The `<cboAtAGlance>` version of the `<about>` element includes the `<cboBillStatus>` element, whose description is later in this section.

~~~~
<cboAtAGlance>
...
<about>
  <dc:type>...</dc:type> <docNumber>...</docNumber>, <shortTitle>...</shortTitle>
  <!-- Alternatively, the <shortTitle> could be the <officialTitle>. -->
  <br/><cboBillStatus>...</cboBillStatus> by the 
  <committee>... Committee on ...</committee> on 
  <date date="..."> ...</date>
</about>
...
</cboAtAGlance>
~~~~

**`<cboBillStatus>`**
: The `<cboBillStatus>` contains the precise status of the version of the measure that CBO reviewed. A common example is "as ordered reported". It is possible for CBO cost estimates to exist for the same measure, requested from the same committee, with different `<cboBillStatus>` values. These would usually have different dates as well as a different measure status.

**`<cboEstimateForm>`**
: A CBO cost estimate is usually in one of two formats. The `<cboEstimateForm>` declares which is being used. The values are "short" and "long".

**`<intergovernmentalMandate>`**
: The `<intergovernmentalMandate>` element contains the estimated intergovernmental mandates that would be created by the measure in its current version. This element is also used in the `<cboAtAGlance>` element, and in the main content of the cost estimate.

**`<longTermDeficit>`**
: The `<longTermDeficit>` element contains the estimated change in long-term deficit (net total of estimated changes to direct spending and revenues) that would be caused by the measure in its current version. This element is also used in the `<cboAtAGlance>` element, and in the main content of the cost estimate.

**`<longTermDirectSpending>`**
: The `<longTermDirectSpending>` element contains the estimated change in long-term direct spending that would be caused by the measure in its current version. This element is also used in the `<cboAtAGlance>` element, and in the main content of the cost estimate.

**`<payGo>`**
: The `<payGo>` element contains the estimated Pay-as-you-go considerations that would be created by the measure in its current version. This element is also used in the `<cboAtAGlance>` element, and in the main content of the cost estimate.

**`<privateSectorMandate>`**
: The `<privateSectorMandate>` element contains the estimated private sector mandates that would be created by the measure in its current version. This element is also used in the `<cboAtAGlance>` element, and in the main content of the cost estimate.

### CBO Preface

The **`<cboPreface>`** element contains no new elements. It allows `<heading>`, `<date>`, and `<img>` and `<xhtml:img>` elements.

### CBO Cost Estimate (main content)

**`<cboCostEstimate>`**

: The `<cboCostEstimate>` element consists of a number of units of content. Many of these units use a new generic hierarchical level element, the **`<textLevel>`** element. Units that are in all or most cost estimates are modeled as specialised elements with appropriate content models. 
The `<cboCostEstimate>` element can be added to a legislative committee report in the `<estimatedCosts>` segment. In this case, the `<cboMeta>`, complete with contents, should be added to the `<reportMeta>` of the legislative committee report.

The `<cboCostEstimate>` element adds the following new elements to the USLM schema.

**`<analyst>`**

: CBO cost estimates are written by CBO analysts.

**`<cboAtAGlance>`**

: CBO cost estimates usually begin with a summary of CBO's estimate of the measure's effects on major components of the federal budget, the  `<cboAtAGlance>` element. The table includes the `<intergovernmentalMandate>`, `<longTermDeficit>`, `<longTermDirectSpending>`, `<payGo>`, and `<privateSectorMandate>` elements that are also used in the `<cboMeta>`. The values in the two locations must match, after correcting for the format. 

**`<textLevel>`**

: CBO cost estimates are hierarchical, non-legislative, content. Use of the legislative elements such as `<level>` or `<section>` would not be appropriate, and thus we define a new hierarchical element for use in non-legislative content, named `<textLevel>`. Like the legislative `<level>` element, the `<textLevel>` element can be nested to create a hierarchy. The optional attribute **`@levelDepth`** can be used to document the nesting level of the element. This element allows the same content as a `<segment>` element.

**`<cboBillSummary>`**

: The `<cboBillSummary>` contains a summary of the measure whose budgetary effects are estimated. It is a type of `<textLevel>` element.

**`<basisOfEstimate>`**

: The `<basisOfEstimate>` element contains the information about the basis of the estimates reported on in CBO cost estimate reports. It is a type of `<textLevel>` element that also allows specified elements from the list below.

**`<estimatedFederalCost>`**

: The `<estimatedFederalCost>` element contains the information about the estimated Federal costs associated with the legislation in CBO cost estimate reports. 

**`<directSpending>`**

: The `<directSpending>` element contains estimates of increases or decreases in budget authority and outlays if the legislation were enacted. It is part of the `<basisOfEstimate>` element. 

**`<directSpendingAndRevenues>`**

: The `<directSpendingAndRevenues>` element contains the information about the direct spending and revenues estimates associated with the legislation in CBO cost estimate reports. It is part of the `<basisOfEstimate>` element. Typically either the `<directSpendingAndRevenues>` element or the individual elements for direct spending and for revenues are used.

**`<mandates>`**

: The `<mandates>` element contains the information about mandates, both private-sector and intergovernmental, that would be imposed by the associated legislation. The information in this text level should provide supporting information for the values of the `<privateSectorMandate>` and `<intergovernmentalMandate>` elements in the `<cboMeta>` and `<cboAtAGlance>` elements. Those elements should be used in this text level to tag the appropriate content.

**`<payGoConsiderations>`**

: The `<payGoConsiderations>` element describes net changes in direct spending or revenues that would result from application of the Pay-As-You-Go Act of 2010.

**`<revenues>`**

: The `<revenues>` element contains estimates of increases or decreases in revenues associated with the legislation in CBO cost estimate reports. It is part of the `<basisOfEstimate>` element.

**`<spendingSubjectToAppropriation>`**

: The `<spendingSubjectToAppropriation>` element describes potential changes in discretionary spending that would result if future appropriations were to be provided to carry out the provisions in the legislation to be enacted. It is part of the `<basisOfEstimate>` element. 

## Guidance For Use

The `<cboMeta>` element uses a number of existing elements in specific ways. This section details the use in this context.

The `<relatedDocument>` element is used to link previous CBO cost estimates for similar legislation in the same congress.  
The `<date>` element is the publication date of the CBO cost estimate, not the date as requested by the committee.  
The format of the `<dc:title>` element is the text content of the `<about>` element (see above), preceded by "CBO Cost Estimate \{docNumber\}: ", where \{`docNumber`\} is the CBO cost estimate publication number.  
`<dc:type>` for CBO cost estimates has the value "CBO Cost Estimate".  
`<docNumber>` for CBO cost estimates is the CBO cost estimate publication number.   
The copyright statement on CBO cost estimates is `<dc:rights>The information and documents on CBO's website are not copyrighted. CBO's products are created by our employees in the course of their employment at CBO and are therefore works of the government. Government documents are in the public domain and are not protected by copyright law.</dc:rights>`.  
The `<dc:creator>` of CBO cost estimates is "Congressional Budget Office".  
The `<dc:publisher>` of CBO cost estimates is "Congressional Budget Office".  

The `<reportMeta>` of the legislative committee report that includes the `<cboCostEstimate>` element should include the `<cboMeta>` element that is part of the complete `<cboReport>`. Should the measure that is the subject of the legislative committee report (as indicated in the `<about>` element) have more than one CBO cost estimate associated with it, the `<cboMeta>` and matching `<cboCostEstimate>` elements from the newest CBO cost estimates should be included in the legislative committee report. This newest CBO cost estimate will itself include a `<relatedDocument>` link to any previous CBO cost estimate for the same measure in the same congress.

## Changed Content Models

The `<textLevel>` element is added to the `<segment>` content model to allow non-legislative content hierarchies.

The `<analyst>`, `<cboEstimateForm>`, `<intergovernmentalMandate>`, `<longTermDeficit>`, `<longTermDirectSpending>`, `<payGo>`, and `<privateSectorMandate>` elements are allowed in the `<p>` element for use in the various text levels of a CBO cost estimate. These elements are not used in legislative documents and should be excluded programmatically, for example through use of a Schematron schema. It is not possible to exclude them in a context-sensitive way in the XML Schema that is included as part of the USLM definition.


# Feedback

To submit feedback, questions, or comments about the USLM 2.1.2 schema and
this Review Guide, please open a GitHub issue at
<https://github.com/usgpo/uslm/issues>.
