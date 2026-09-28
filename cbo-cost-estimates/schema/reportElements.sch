<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt3"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns:u="http://schemas.gpo.gov/xml/uslm" xmlns:xhtml="http://www.w3.org/1999/xhtml"
    xmlns:dc="http://purl.org/dc/elements/1.1/" >
    <sch:p>This schematron contains elements designed for use in report documents.</sch:p>
    <sch:p>Designed to work with USLM 2.1.2</sch:p>
    <sch:p>Last modified: 2026-08-06</sch:p>
    
    <sch:ns uri="http://schemas.gpo.gov/xml/uslm" prefix="u"/>
    <sch:ns uri="http://www.w3.org/1999/xhtml" prefix="xhtml"/>
    <sch:ns uri="http://purl.org/dc/elements/1.1/" prefix="dc"/>
    
    <sch:let name="excludedMetaElements" value="'amendmentNumber','citableAsShortTitle','containsShortTitle','currentThroughPublicLaw','docPart','docPublicationName'
        ,'docReleasePoint','docStage','endingPage','endingProvision','enrolledDateline','issue','popularName'
        ,'provisionRange','startingPage','startingProvision','subject','volume'"/>
    <sch:let name="excludedNoteElements" value="'authority','billingCode' ,'changeNote','citationNote','drafterNote','ear','editionNote'  ,'editorialNote','effectiveDateNote','explanationNote','findingAidsNote','frDocId','legislativeHistory','note','notes','organizationNote', 'source','sourceCredit','statutoryNote','uscNote'"/>
    <sch:let name="excludedPrefaceElements" value="'amendmentNumber','billingCode','changeNote','citableAsShortTitle','containsShortTitle'
        ,'currentThroughPublicLaw','docPart','docPublicationName','docReleasePoint','docStage','ear'
        ,'editionNote','editorialNote','effectiveDateNote','endingPage','endingProvision','enrolledDateline'
        ,'explanationNote','findingAidsNote','frDocId','index','issue','legislativeHistory'
        ,'listOfAgencies','listOfBillsEnacted','listOfConcurrentResolutions','listOfPrivateLaws','listOfProclamations'
        ,'listOfPublicLaws','listOfSectionsAffected','popularName','popularNameIndex'
        ,'provisionRange','startingPage','startingProvision','subject','volume'"></sch:let>
    <sch:let name="excludedPropertyElements" value="'amendmentNumber','coverTitle','currentThroughPublicLaw','distributionCode','docPart','docPublicationName','docReleasePoint','docStage','enrolledDateline','provisionRange','purpose','subject','volume'"/>
    <sch:let name="levelElements" value="'article','chapter','clause','compiledAct','courtRule','courtRules','division','item','level','paragraph', 'part','preliminary','reorganizationPlan','reorganizationPlans', 'section','subarticle','subchapter','subclause','subdivision','subitem','subparagraph','subpart','subsection', 'subsubitem','subtitle','title' "/>
    <sch:let name="tallySheetElements" value="'event','modVoteDate','tallySheetId','updateVoteDate','voteDate','voteNum','recordedVotes','voteTotals'"/>
    <sch:let name="tallySheetMetaElements" value="'event','majorityParty','modVoteDate','motionOfferedBy','sponsor',
        'tallySheetId','updateVoteDate','voteDate','voteDisposition','voteNum','voteTotals','voteType'"/>
    <sch:let name="voteTotalsElements" value="'ayeVoteTotal','yeaVoteTotal','notVotingTotal','nayVoteTotal','presentVoteTotal','noVoteTotal', 'absentTotal', 'otherVoteTotal'"/>
    
    <sch:pattern id="changesInExistingLaw">
        <sch:rule context="u:proposedContent">
            <sch:p>The proposedContent element is specific to committee reports.</sch:p>
            <sch:assert test="ancestor::u:existingLaw or ancestor::u:jointExplanatoryStatement" role="error">The proposedContent element is only allowed in the changesInExistingLaw segment,
                in the existingLaw or jointExplanatoryStatement elements.</sch:assert>
            <sch:assert test="@changed" role="error">The proposedContent element must have a changed attribute saying whether the content is
            added or deleted.</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="documentTypes">
        <sch:rule context="u:tallySheet">
            <sch:let name="docType" value="local-name(.)"/>
            <sch:p>The tallySheet element in a stand-alone format.</sch:p>
            <sch:assert test="if ($docType ='tallySheet') 
                then (u:tallySheetMeta) else (false())" role="error">If the tallySheet element is a stand-alone document, then it must have a 'tallySheetMeta' child element.</sch:assert>
            <sch:assert test="if ($docType ='tallySheet') 
                then (u:tallySheetPreface) else (false())" role="error">If the tallySheet element is a stand-alone document, then it must have a 'tallySheetPreface' child element.</sch:assert>
        </sch:rule>
        <sch:rule context="u:legislativeReport">
            <sch:assert test="u:reportPreface" role="error">A legislative report must have a 'reportPreface' element.</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="metadata">
        <sch:rule context="u:reportMeta/*">
            <sch:report test="local-name()=($excludedMetaElements,$tallySheetMetaElements)" role="error">The 
                'reportMeta' element must not contain the '<sch:name/>' element as a child element.</sch:report>
        </sch:rule>
        <sch:rule context="u:reportMeta">
            <sch:assert test="matches(dc:type,'Report')" role="error">The dc:type in the reportMeta must include the string 'Report'. The three types are 'House', 'Senate', and 'Conference'.</sch:assert>
            <sch:assert test="dc:title" role="warning">The legislative report should have a dc:title in the reportMeta.</sch:assert>
            <sch:assert test="u:cboCostEstimateLine or matches(dc:type, 'Conference', 'i')" role="warning">The legislative report should have a cboCostEstimateLine in the reportMeta, with values 'Y' (yes) or 'N' (no), unless it is a Conference Report.</sch:assert>
            <sch:assert test="u:accompanies" role="error">The legislative report must have an accompanies element in the reportMeta, with citable information about the affected bill.</sch:assert>
            <sch:assert test="u:committee" role="error">The legislative report must have a committee element in the reportMeta that contains the name of the lead committee.</sch:assert>
            <sch:assert test="u:genre[contains(.,'legislative')]" role="warning">The legislative report should have a genre element in the reportMeta that contains the word 'legislative'.</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="preface">
        <sch:rule context="u:reportCoverPage/*">
            <sch:report test="local-name(.) = ($excludedPrefaceElements,'reportCoverPage')" role="error">The 
                'reportCoverPage' element must not contain the '<sch:name/>' element.</sch:report>
        </sch:rule>
        <sch:rule context="u:reportPreface/*">
            <sch:report test="local-name(.) = ($excludedPrefaceElements)" role="error">The 
                'reportPreface' element must not contain the '<sch:name/>' element.</sch:report>
        </sch:rule>
        <sch:rule context="u:reportPreface">
            <sch:assert test="descendant::u:reportTitle" role="error">The legislative report must have a report title.</sch:assert>
            <sch:assert test=".//u:accompanies" role="error">A legislative committee report must have an accompanies element in the reportPreface, with information 
                about the bill that the report accompanies.</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="main">
        <sch:rule context="u:reportMain">
            <sch:assert test="u:recommendation" role="warning">The legislative committee report should have a recommendation in the reportMain.</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="pContent">
        <sch:rule context="u:p/u:*">
            <sch:report test="(local-name(.) = ($excludedNoteElements,$excludedPropertyElements,'congress','session',$voteTotalsElements)) 
                and (local-name(../..)='segment')" sqf:fix="unwrapInP" role="error">A 
                'p' element in the context of a report 'segment' element must not contain the '<sch:name/>' element.</sch:report>
            <sch:report test="(local-name(.) = ($excludedNoteElements,$excludedPropertyElements,'congress','session')) 
                and (local-name(../..)='votesInCommittee')" sqf:fix="unwrapInP" role="error">A 
                'p' element in the context of a report 'and (local-name(..)='segment')' element must not contain the '<sch:name/>' element.</sch:report>
            <sqf:fix id="unwrapInP">
                <sqf:description>
                    <sqf:title>Unwrap the element, leaving the content.</sqf:title>
                </sqf:description>
                <sqf:replace match="." select="node()"/>
            </sqf:fix>
        </sch:rule>
        
    </sch:pattern>
    <sch:pattern>
        <sch:rule context="u:accompanies">
            <sch:assert test="ancestor::u:legislativeReport| ancestor::u:tallySheet">The 
                '<sch:value-of select="local-name(.)"/>' element is allowed in legislative committee reports and tally sheets, 
                not in its current context.</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern>
        <sch:rule context="u:affected">
            <sch:assert test="ancestor::u:legislativeReport | ancestor::u:amendment | ancestor::u:tallySheet">The 
                '<sch:value-of select="local-name(.)"/>' element is allowed in legislative committee reports, tally sheets, and amendment documents, 
                not in its current context.</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern>
        <sch:rule context="u:cboCostEstimateLine">
            <sch:assert test="ancestor::u:legislativeReport">The 
                '<sch:value-of select="local-name(.)"/>' element is allowed in legislative committee reports, 
                not in its current context.</sch:assert>
        </sch:rule>
    </sch:pattern>
        <sch:pattern>
            <sch:rule context="u:legislators">
                <sch:assert test="ancestor::u:legislativeReport">The 
                    '<sch:value-of select="local-name(.)"/>' element is allowed in legislative committee reports, 
                    not in its current context.</sch:assert>
            </sch:rule>
        </sch:pattern>
        <sch:pattern>
            <sch:rule context="u:proposedContent">
                <sch:assert test="ancestor::u:changesInExistingLaw or ancestor::u:jointExplanatoryStatement">The 
                    '<sch:value-of select="."/>' element is allowed in legislative committee reports in the 'changesInExistingLaw'
                    and the 'jointExplanatoryStatement' elements, not in its current context.</sch:assert>
            </sch:rule>
        </sch:pattern>

        <sch:pattern>
            <sch:rule context="u:reportTitle">
                <sch:assert test="ancestor::u:legislativeReport">The 
                    '<sch:value-of select="local-name(.)"/>' element is allowed in legislative committee reports, 
                    not in its current context.</sch:assert>
            </sch:rule>
        </sch:pattern>
        <sch:pattern>
            <sch:rule context="u:reportViews">
                <sch:assert test="ancestor::u:legislativeReport">The 
                    '<sch:value-of select="local-name(.)"/>' element is allowed in legislative committee reports, 
                    not in its current context.</sch:assert>
            </sch:rule>
        </sch:pattern>
    <sch:pattern id="signatures">
        <sch:rule context="u:signature[not(ancestor::u:cboCostEstimate)]">
            <sch:report test="u:name" role="error">Signature elements in legislative reports use the 'legislator' element, not the 'name' element,
                for the name of the legislator signing or contributing to the report. </sch:report>
        </sch:rule>
    </sch:pattern>
    
    <!-- votesInCommittee and tallySheet -->
    <sch:pattern id="tallySheet">
        <sch:rule context="u:tallySheet">
            <sch:assert test="u:tallySheetMeta/u:voteTotals" role="warning">The 'tallySheetMeta' element should contain the 'voteTotals' element
            with the official results of the recorded votes.</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern>
        <sch:rule context="u:voteDate">
            <sch:assert test="ancestor::u:votesInCommittee or ancestor::u:tallySheet">The 
                '<sch:value-of select="."/>' element is allowed in legislative committee reports in the 'votesInCommittee'
                and the 'tallySheet' elements, not in its current context.</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern>
        <sch:rule context="u:voteDescription">
            <sch:assert test="ancestor::u:votesInCommittee or ancestor::u:tallySheet">The 
                '<sch:value-of select="local-name(.)"/>' element is allowed in legislative committee reports in the 'votesInCommittee'
                and the 'tallySheet' elements, not in its current context.</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern>
        <sch:rule context="u:voteDisposition">
            <sch:assert test="ancestor::u:votesInCommittee or ancestor::u:tallySheet">The 
                '<sch:value-of select="local-name(.)"/>' element is allowed in legislative committee reports in the 'votesInCommittee'
                and the 'tallySheet' elements, not in its current context.</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern>
        <sch:rule context="u:voteNum">
            <sch:assert test="ancestor::u:votesInCommittee or ancestor::u:tallySheet">The 
                '<sch:value-of select="local-name(.)"/>' element is allowed in legislative committee reports in the 'votesInCommittee'
                and the 'tallySheet' elements, not in its current context.</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern>
        <sch:rule context="u:voteTotals">
            <sch:assert test="ancestor::u:votesInCommittee or ancestor::u:tallySheet">The 
                '<sch:value-of select="local-name(.)"/>' element is allowed in legislative committee reports in the 'votesInCommittee'
                and the 'tallySheet' elements, not in its current context.</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="voteTotalsGroup">
        <sch:rule context="u:ayeVoteTotal|u:yeaVoteTotal|u:notVotingTotal|
            u:nayVoteTotal|u:presentVoteTotal|u:noVoteTotal|u:absentTotal|u:otherVoteTotal">
            <sch:assert test="ancestor::u:votesInCommittee or ancestor::u:tallySheet">The 
                '<sch:value-of select="local-name(.)"/>' element is allowed in legislative committee reports in the 'votesInCommittee'
                and the 'tallySheet' elements, not in its current context.</sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>