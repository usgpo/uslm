## Proposed Changes ##    

2.1.0 - Proposed version of uslm-2.1.0.xsd along with uslm-components-2.1.0.xsd, uslm-table-module-2.1.0.xsd, and uslm.css for the Remaining Bill Versions project.   
    
The 2.1 schema series changes from the 2.0 schema series support the following three primary goals:   
1. Add support for amendment document types.   
2. Add and modify the schema to support the historical Statutes at Large project.  
3. Constrain the allowed tagging to better support the original design intent of the schema and disallow unintended constructs.  
  
Schema: 
- Change the amendment document type.  
  - Add amendPreface, amendMeta, amendMain, and officialTitleAmendment elements.   
  - The amendMeta element extends the meta element to add the amendDegree and amendStage elements.  
  - The amendPreface element extends the preface element to add the draftingOffice element.   
  - The amendMain element model adds new elements amendmentInstruction and amendmentContent and defines the new attribute amendmentInstructionLineNumbering. - Add the engrossedAmendment document type employing the content model of the amendment document type.  
- The preface element content model has been expanded to match existing documents.   
- Disallow the content element in the preface element content model in favor of a specific definition matching existing documents.    
- Add PositionedNoteType as the type for the positioned notes, disallowing the content element in favor of elements that match existing documents.    
- Change the ColumnType element definition to no longer be based on the ContentType element while ensuring it matches existing documents.  
- Restrict the figure element content model to match existing documents while allowing for xhtml:img and MathML content.  
- Change the ContentType type definition to remove the ability to add any element from a foreign namespace without using the foreign element as a wrapper with exceptions for xhtml:table, xhtml:img, and mathml:math.  
- Replace the p element content model with a specific list of elements found in existing documents.  
- Change the recital element definition to have a more complex content model to match existing documents.  
- Restructure the XSD schema documents to facilitate schema processing.  
  - A single top-level XSD file imports component schema files (USLM, tables, MathML, and Senate metadata).  
  - References to other components internal to the component schemas are made by namespace only.  
  - Namespace references avoid potential circular reference issues during schema processing.  
 
CSS: 
Version: 2.33 2024-08-23  
Previous version: Version 2.29 2024-03-18  
  
- Adds styling for new engrossedAmendment and amendment document types.  
- Adds styling for new amendMeta, amendPreface, amendMain elements.  
- Adds styling for elements and attributes used in bills and resolutions in document stages prior to enrolled, particular those used in the preface.   
- Adds styling for various layouts, such as side by side, for use in the statutes at large digitisation project.    
- Resets docTitle styling to use the standard font instead of Old English.   
- Handle multiple resolving clauses better.  
- Add support for the hierarchical level placement of num and heading in appropriations style.  
- Add support for sidenotes in tables.  
- Add classes for reported bill styling.  
- Use current syntax for `::before` pseudo-element.  
- Add default styling for addedText and deletedText elements.  

  
2.0.17 - Proposed version of uslm-2.0.17.xsd along with corresponding update to table module for the Digitized Statutes at Large in USLM XML project. 
  
Schema:    
- Allow `<referenceMarker>` element to appear even when there is no hierarchical level designator (`<num>`element).  
  
2.0.16 - Proposed version of uslm-2.0.16.xsd along with corresponding update to table module for the Digitized Statutes at Large in USLM XML project. 
  
Schema:    
- Add `<firstPageHeading>` and `<firstPageSubheading>` to preface elements.  
- Fix `numType` description to include alphanumeric num element values.  
- Add `<role>` element to `<signatures>` element for groups of signatories.  
- Add a `<referenceMarker>` element for the case that a level requires both a hierarchical level alphanumeric designation and a separate additional designation.  


2.0.15 - Proposed version of uslm-2.0.15.xsd along with corresponding update to table module for the Digitized Statutes at Large in USLM XML project.   
  
Schema:  
- Allow table in recital elements.  

2.0.14 - Proposed version of uslm-2.0.14.xsd along with corresponding update to table module for the Digitized Statutes at Large in USLM XML project. 

Schema:  
- Add MathML 3 schema.  
- Number the table module for more precision.  
 
## Approved Changes ##  
  
2.0.13 - Approved version of uslm-2.0.13.xsd and uslm.css.   

Documentation Changes:  
- Clarified that the temporalId attribute is not currently used.  
- Refined the discussion of language identifiers to match current practice, including compatibility with AKN.  
- Improvements to the Basic Model description.  
- Clarified that related documents in USLM2 are those added by the clerk or drafter, not every possible related document.  
- Clarified that the `quotedContent` and `quotedText` elements are used in USC notes and bills amending law (not amendment documents).  
- Defined `dc:date` usage in USLM2 more precisely.  
  
Display:  
- Added display style attributes indicating added or deleted content for use in bills, resolutions, and amendment documents prior to enrollment.  

Content:  
- Added the `endorsement` element for use in bills and resolutions prior to enrollment. The content model is similar to the preface content model.  
- Loosened the content model to allow `resolvingClause` elements in more locations to match current usage.  
- Allow a looser order of child elements in `signature` elements to match current usage.  
- Added `constitutionalAmendment` document type.  
- Allow `p` elements in action descriptions.  
- Add a `centerRunningHead` element analogous to the `leftRunningHead` and `rightRunningHead` elements.  
  
2.0.12 - Approved version of uslm-2.0.12.xsd along with corresponding update to table module. 

Summary:  
2.0.12 includes necessary change in tables for production, fixes to 2.0.11 to ensure validity of changes approved by stakeholders for additional bill stages, documentation updates, including notification of potential content model changes in the next minor (2.1) release.  

Documentation Changes:  
- Fixed various typos in the documentation in the schema.  

Attribute Changes:  
- Allowed attributes in other namespaces on several elements (`<date>`, table elements `<td>`, `<th>`, `<tr>`, `<tbody>`, `<tfoot>`, `<thead>`, `<caption>`, `<table>`).    
- Allowed XmlSpecialAttrs, IdentificationGroup, and ClassificationGroup attributes on SignatureType.  

Element Changes:  
- Removed child elements from `<sponsor>` that were not intended to be allowed.  
- Allowed the `<committee>` element in `<actionDescription>` as was intended.   
- Allowed the USLM `<p>` element in table cells.   
- Fixed problem with `<signature>` element not using SignatureType.  


2.0.11 - Approved version of uslm-2.0.11.xsd along with corresponding update to table module. 

Documentation Changes:
- Fixed numerous typos in the documentation in the schema.
- Clarified the documentation on identifiers used for specified versions of a document.
- Added the documentation that items are planned to be removed or changed in the upcoming 2.1 version of this schema:
  - the definition of the amendment element (which was defined for USLM1) will change.
  - the attributes occurrence, actionDate, pos, posText, posCount from the amendingAction element, since as far as we know, they are unused, will be removed.
  - the leaders attribute on the column element was marked as deprecated and may be removed in 2.1.

Attribute Changes:
- Added the leaders attribute to the th element, as it is for the td element.
- Added the orientation attribute to tables and block elements to allow portrait or landscape orientation.
- Added the default value to the leaderAlign attribute.
- Added a display attribute to block elements with values yes or no.
- Added the attribute committeeId to the committee element.

Element Changes:
- Added a new element  attestation to the list of allowed elements after the main element.
- Added relatedDocuments to the meta and preface elements to hold a set of relatedDocument elements that are related to each other, e.g., a report that consists of multiple parts.
- Added currentChamber, distributionCode to the meta and preface elements.
- Added notes to the list of allowed elements where note is allowed (preface, referenceItem, and inline elements).
- Allow mixed content in the signature element.
- Added elements sponsor, cosponsor, and nonsponsor to the actionDescription element.


2.0.10 - Approved version of uslm-2.0.10.xsd along with corresponding update to table module and CSS.
- Updated uslm.xsd to 2.0.10 for backward-compatibility support for U.S. Code Appendices in USLM 1 format.   
- Updated uslm.css to 2.17 for improved footnote rendering, inEffect support, and to stay in sync with OLRC updates.   
   
2.0.9 - Approved version of uslm-2.0.9.xsd with support for Statute Compilations (COMPS). Changes between 2.0.4 and 2.0.9.  
- Removed use of dcterms namespace (for XMetal support)    
- Added "inEffect" value to StatusEnum as the default  
- Added new values to StyleTypeEnum from the @other-style DTD attribute  
- Added "editorial" value to NoteTypeEnum  
- Added "inEffect" attribute, similar to Comps dtd  
- Added id and identifier attributes to tables  
- Allow "editorialContent" in the preface  
- Restore support for U.S. Code Appendix structures (was removed in 2.0.4)  
- Add "listHeading" to lists  
- Added "statuteCompilation" document type  
- Added new propertyTypes: currentThroughPublicLaw, containsShortTitle, createdDate  
- Allow mixed content in action element  

2.0.4 - Approved version of uslm-2.0.4.xsd with added repealAndReserve amending action type, added support for nested lists, and signatures allowed at the end of levels. The “repealAndReserve” amending action type was added because we encountered a combined action within FR amendments. The support for nested lists was added because we encountered nested lists on the regulatory side, but not previously on the legislative side. The support for signatures at the end of levels was added because FR rules contain these when a rule involves multiple agencies.

2.0.3 - Approved version of uslm-2.0.3.xsd with updates for enrolled bills, public laws, Statutes at Large, Federal Register, and Code of Federal Regulations including use of processing instructions for white space and the foreign element for use in regulatory data.

2.0.0 - Approved version of uslm-2.0.0.xsd with updates for enrolled bills, public laws, Statutes at Large, Federal Register, and Code of Federal Regulations. See previous folder in the main branch.

1.0.18 - Approved version of USLM.xsd that was updated for House Manual and the addition of a version attribute. See previous folder in the main branch. 
