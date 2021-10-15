>Statute Compilations (COMPS) in USLM XML format are now available on govinfo. Access via [Search](https://www.govinfo.gov/app/search/%7B%22query%22%3A%22collection%3Acomps%22%2C%22offset%22%3A0%7D), [Browse](https://www.govinfo.gov/app/collection/comps), [Bulk Data](https://www.govinfo.gov/bulkdata/COMPS), and [API](https://api.govinfo.gov/docs/). 
>
>Version 2.0.10 of the schema is now available in the [proposed branch](https://github.com/usgpo/uslm/tree/proposed). 
>
>Version 2.17 of the CSS is now available in the [proposed branch](https://github.com/usgpo/uslm/tree/proposed). 
>
>An updated version of the Review Guide is now available in the [proposed branch](https://github.com/usgpo/uslm/tree/proposed). 
>
>GPO released Beta USLM XML in the draft 2.0 schema on the govinfo Bulk Data Repository for enrolled bills from the 113th Congress forward, public laws from the 113th Congress forward, and the Statutes at Large from the 108th Congress forward. For enrolled bills, the Beta USLM XML is available in addition to the existing Bill DTD XML. The Beta USLM XML uses the same file naming convention as the Bill DTD XML but the Beta USLM XML is in a /bulkdata/BILLS/uslm/ folder. We also made the Beta USLM XML available on the govinfo website through "USLM" buttons and in the ZIP files. Beta USLM XML is also now available from the govinfo API and Link Service. See the [proposed branch](https://github.com/usgpo/uslm/tree/proposed) for more information. 


# USLM Schema #


In support of the United States Legislative Branch XML Working Group and in accordance with [2 U.S.C. 181](https://api.fdsys.gov/link?collection=uscode&title=2&year=mostrecent&section=181), the Government Publishing Office (GPO) is making the United States Legislative Markup (USLM) XML schema available as an authoritative source on GitHub. 



## Versions ##
The current version of the schema is in the master branch. If there are any proposed changes to the schema, the changes will be in a proposed branch. A major.minor.point structure is used to identify the version, and the version is recorded as an attribute at the root level. The point number is incremented to indicate a non-breaking change while the minor number is incremented to indicate a breaking change. Breaking changes will only be implemented after all other options have been exhausted. Please refer to [CHANGELOG.md](CHANGELOG.md) for a summary of proposed and approved changes.  


## Draft USLM 2.0 Schema ##
The [proposed branch](https://github.com/usgpo/uslm/tree/proposed) contains the [draft USLM 2.0 schema](https://github.com/usgpo/uslm/blob/proposed/uslm-2.0.9.xsd), a [schema review guide](https://github.com/usgpo/uslm/blob/proposed/USLM-2_0-Review-Guide.md), sample USLM enrolled bill files, CSS files, and additional schema required to validate the sample files. 


To submit feedback, questions, or comments, please open a [GitHub issue](https://github.com/usgpo/uslm/issues/new).


## User Guide and Review Guide ##
Please refer to the User Guide in [PDF](USLM-User-Guide.pdf) or [Markdown](USLM-User-Guide.md) and Review Guide in [Markdown](https://github.com/usgpo/uslm/blob/proposed/USLM-2_0-Review-Guide.md) for additional information about the schema. 
