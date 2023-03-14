## Approved Changes  

1.0.18 - Current version - Update for House Manual and the addition of a version attribute. 

## Proposed Changes (See Proposed Branch)  

2.0.11 - Draft version of uslm-2.0.11.xsd along with corresponding update to table module.  

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

2.0.10 - Draft version of uslm-2.0.10.xsd along with corresponding update to table module and CSS.
- Updated uslm.xsd to 2.0.10 for backward-compatibility support for U.S. Code Appendices in USLM 1 format.   
- Updated uslm.css to 2.17 for improved footnote rendering, inEffect support, and to stay in sync with OLRC updates.   
   
2.0.9 - Draft version of uslm-2.0.9.xsd with support for Statute Compilations (COMPS). Changes between 2.0.4 and 2.0.9.   
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

2.0.4 - Superseded draft version of uslm-2.0.4.xsd with added repealAndReserve amending action type, added support for nested lists, and signatures allowed at the end of levels. The “repealAndReserve” amending action type was added because we encountered a combined action within FR amendments. The support for nested lists was added because we encountered nested lists on the regulatory side, but not previously on the legislative side. The support for signatures at the end of levels was added because FR rules contain these when a rule involves multiple agencies.

2.0.3 - Superseded draft version of uslm-2.0.3.xsd with updates for enrolled bills, public laws, Statutes at Large, Federal Register, and Code of Federal Regulations including use of processing instructions for white space and the foreign element for use in regulatory data.

2.0.0 - Superseded draft version of uslm-2.0.0.xsd with updates for enrolled bills, public laws, Statutes at Large, Federal Register, and Code of Federal Regulations. Moved to old folder in the proposed branch. 




