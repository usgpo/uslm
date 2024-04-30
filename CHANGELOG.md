## Proposed Changes ##    

2.0.13 - Proposed version of uslm-2.0.13.xsd and uslm.css.   

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
 
## Approved Changes ##  
  
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
