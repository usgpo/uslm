<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt3"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns:u="http://schemas.gpo.gov/xml/uslm"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    >
    <sch:p>This schematron contains elements designed for use in CBO Cost Estimate documents.</sch:p>
    <sch:p>Designed to work with USLM 2.1.2</sch:p>
    <sch:p>Last modified: 2026-08-13</sch:p>
    
    <sch:ns uri="http://schemas.gpo.gov/xml/uslm" prefix="u"/>
    <sch:ns uri="http://purl.org/dc/elements/1.1/" prefix="dc"/>
    <sch:ns uri="http://www.w3.org/1999/xhtml" prefix="xhtml"/>
    
    <sch:let name="metaLongTermDeficit" value="if (matches(//u:cboMeta/u:longTermDeficit,'(less|greater) than','i'))
        then (//u:cboMeta/u:longTermDeficit=> replace('less than','&lt;','i') => replace('greater than','&gt;','i') ) else (//u:cboMeta/u:longTermDeficit)"/>
    <sch:let name="atAGlanceLongTermDeficit" value="if (//u:cboAtAGlance//u:longTermDeficit='*')
        then (//u:cboAtAGlance//xhtml:td[contains(.,'=')]=>replace('\* = ','')=>replace('\.','')) 
        else (//u:cboAtAGlance//u:longTermDeficit)"/>
    <sch:let name="metaLongTermDirectSpending" value="if (matches(//u:cboMeta/u:longTermDirectSpending,'(less|greater) than','i'))
        then (//u:cboMeta/u:longTermDirectSpending=> replace('less than','&lt;','i') => replace('greater than','&gt;','i')) else (//u:cboMeta/u:longTermDirectSpending)"/>
    <sch:let name="atAGlanceLongTermDirectSpending" value="if (//u:cboAtAGlance//u:longTermDirectSpending='*')
        then (//u:cboAtAGlance//xhtml:td[contains(.,'=')]=>replace('\* = ','')=>replace('\.','')) 
        else (//u:cboAtAGlance//u:longTermDirectSpending)"/>

    
    <sch:pattern id="cboMeta">
        <sch:rule context="u:cboMeta">
            <sch:assert test="u:about and (some $a in u:about satisfies contains($a,u:cboBillStatus))">CBO Cost Estimates use the about element to say which measure is
                the basis of the estimate. There are two formats: "{dc:type of measure} {docNumber of measure}, {short or official title of measure} {cboBillStatus}
                by {committee} on {date}" (which must be present) and the short-form citableAs of the measure, such as 119hr5301, with or without the bill stage.</sch:assert>
            <sch:assert test="u:cboBillStatus">CBO Cost Estimates use the cboBillStatus element
                to indicate the status of the precise version of the measure the Cost Estimate used. Example: 
                'as ordered reported'.</sch:assert>
            <sch:assert test="u:cboEstimateForm">CBO Cost Estimates use the cboEstimateForm element,
            with values 'short' or 'long', to say which form of estimate is used.</sch:assert>
            <sch:assert test="u:citableAs and (every $c in u:citableAs satisfies matches ($c, u:docNumber))">CBO Cost Estimates use the citableAs element
                to indicate how the estimate can be cited. Two formats: 'CBO Cost Estimate {docNumber}' or the URI for the Cost Estimate on the CBO web site.</sch:assert>
            <sch:assert test="u:congress">CBO Cost Estimates use the congress element
                to indicate the congress number.</sch:assert>
            <sch:assert test="u:currentChamber and matches(u:currentChamber, 'House|Senate')">CBO Cost Estimates use the currentChamber element,
                with values 'House' or 'Senate', to indicate the chamber of the committee requesting the estimate. 
                Example: for a Senate bill marked by a House committee, the content is 'House'.</sch:assert>
            <sch:assert test="u:date">CBO Cost Estimates use the date element for the publication date of the estimate .</sch:assert>
            <sch:assert test="dc:creator and matches(dc:creator, 'Congressional Budget Office')">In CBO Cost Estimates the dc:creator element
                has content 'Congressional Budget Office', to indicate who created the estimate.</sch:assert>
            <sch:assert test="dc:publisher and matches(dc:publisher, 'Congressional Budget Office')">In CBO Cost Estimates the dc:publisher has content 'Congressional Budget Office', to indicate who published the estimate .</sch:assert>
            <sch:assert test="dc:format and matches(dc:format,'text/xml')">In CBO Cost Estimates the dc:format element
                has content 'text/xml' .</sch:assert>
            <sch:assert test="dc:language and matches(dc:language,'EN')">In CBO Cost Estimates the dc:language element
                has content 'EN'.</sch:assert>
            <sch:assert test="dc:rights and matches(dc:rights, 'The information and documents on CBO’s website are not copyrighted. CBO’s products are created by our employees in the course of their employment at CBO and are therefore works of the government. Government documents are in the public domain and are not protected by copyright law.')">In CBO Cost Estimates the copyright 
                statement in the dc:rights element is 'The information and documents on CBO’s website are not copyrighted. CBO’s products are created by our employees in the course of their employment at CBO and are therefore works of the government. Government documents are in the public domain and are not protected by copyright law.'.</sch:assert>
            <sch:assert test="dc:title and matches(dc:title,'CBO Cost Estimate ' || u:docNumber || ': ' || u:about[contains(.,'by')])">In CBO Cost Estimates the dc:title element has the format 'CBO Cost Estimate {docNumber}: {about (long form)}'.</sch:assert>
            <sch:assert test="dc:type and matches(dc:type,'CBO Cost Estimate')">In CBO Cost Estimates the dc:type element is defined as 
            'CBO Cost Estimate'.</sch:assert>
            <sch:assert test="u:session">CBO Cost Estimates use the session element to indicate the session number.</sch:assert>
            <sch:assert test="u:docNumber">CBO Cost Estimates use the docNumber element for the publication number of the estimate.</sch:assert>
            <sch:assert test="u:intergovernmentalMandate and //u:cboMeta/u:intergovernmentalMandate = //u:cboAtAGlance//u:intergovernmentalMandate">CBO Cost Estimates use the intergovernmentalMandate element to contain summary estimated intergovernmental mandate information.</sch:assert>
            <sch:assert test="if (u:congress > 116) then (u:longTermDirectSpending and $atAGlanceLongTermDirectSpending=$metaLongTermDirectSpending) 
                else (true())">CBO Cost Estimates use the longTermDirectSpending element to contain summary estimated long-term direct spending information. The values in the cboMeta (<sch:value-of select="//u:cboMeta/u:longTermDirectSpending"/>) and the At a Glance table (<sch:value-of select="$atAGlanceLongTermDirectSpending"/>) should match when corrected for format.</sch:assert>
            <sch:assert test="u:longTermDeficit and $atAGlanceLongTermDeficit=$metaLongTermDeficit">CBO Cost Estimates use the longTermDeficit element to contain summary estimated long-term deficit information. The values in the cboMeta (<sch:value-of select="//u:cboMeta/u:longTermDeficit"/>) and the At a Glance table (<sch:value-of select="$atAGlanceLongTermDeficit"/>) should match when corrected for format.</sch:assert>
            <sch:assert test="u:payGo and //u:cboMeta/u:payGo = //u:cboAtAGlance//u:payGo">CBO Cost Estimates use the payGo element to contain summary estimated Pay As You Go information. The values in the cboMeta (<sch:value-of select="//u:cboMeta/u:payGo"/>) and the At a Glance table (<sch:value-of select="//u:cboAtAGlance//u:payGo"/>) should match.</sch:assert>
            <sch:assert test="u:privateSectorMandate and //u:cboMeta/u:privateSectorMandate = //u:cboAtAGlance//u:privateSectorMandate">CBO Cost Estimates use the privateSectorMandate element to contain summary estimated private-sector mandate information. The values in the cboMeta (<sch:value-of select="//u:cboMeta/u:privateSectorMandate"/>) and the At a Glance table (<sch:value-of select="//u:cboAtAGlance//u:privateSectorMandate"/>) should match</sch:assert>
        </sch:rule>
    </sch:pattern>
        <sch:pattern>
            <sch:rule context="u:about">
                <sch:assert test="ancestor::u:cboCostEstimate | ancestor::u:cboMeta">The 
                    '<sch:value-of select="local-name(.)"/>' element is allowed in CBO Cost Estimates (including the 
                    metadata for CBO Cost Estimates), not in its current context.</sch:assert>
            </sch:rule>
        </sch:pattern>
        <sch:pattern>
            <sch:rule context="u:analyst">
                <sch:assert test="ancestor::u:cboCostEstimate">The 
                    '<sch:value-of select="local-name(.)"/>' element is allowed in CBO cost estimates, 
                    not in its current context.</sch:assert>
            </sch:rule>
        </sch:pattern>
        <sch:pattern>
            <sch:rule context="u:cboBillStatus">
                <sch:assert test="ancestor::u:cboMeta|ancestor::u:cboCostEstimate">The 
                    '<sch:value-of select="local-name(.)"/>' element is allowed in CBO metadata
                    and CBO Cost Estimates, not in its current context.</sch:assert>
            </sch:rule>
        </sch:pattern>
        <sch:pattern>
            <sch:rule context="u:cboEstimateForm">
                <sch:assert test="ancestor::u:cboMeta">The 
                    '<sch:value-of select="local-name(.)"/>' element is allowed in CBO metadata, 
                    not in its current context.</sch:assert>
                <sch:assert test="matches(., 'short|long')">The value of the cboEstimateForm element is 'short' or 'long'.</sch:assert>
            </sch:rule>
        </sch:pattern>
        <sch:pattern>
            <sch:rule context="u:intergovernmentalMandate">
                <sch:assert test="ancestor::u:cboMeta|ancestor::u:cboCostEstimate">The 
                    '<sch:value-of select="local-name(.)"/>' element is allowed in CBO Cost Estimates, not in its current context.</sch:assert>
                <sch:assert test="if (ancestor::u:cboAtAGlance) then (. = ('No','Yes, Over Threshold','Yes, Under Threshold','Yes, Cannot Determine Costs', 'Excluded from UMRA'))
                    else true()">The value of the <sch:value-of select="local-name(.)"/> element in the At A Glance table is 
                    '<sch:value-of select="."/>' and should be  'No','Yes, Over Threshold','Yes, Under Threshold','Yes, Cannot Determine Costs', or 'Excluded from UMRA'.</sch:assert>
            </sch:rule>
        </sch:pattern>
    <sch:pattern>
        <sch:rule context="u:longTermDeficit">
            <sch:assert test="ancestor::u:cboMeta|ancestor::u:cboCostEstimate">The 
                '<sch:value-of select="local-name(.)"/>' element is allowed in CBO Cost Estimates, not in its current context.</sch:assert>
            <sch:assert test="if (ancestor::u:cboAtAGlance) then (. = ('No','&lt; $5 billion', '&gt; $5 billion', '*'))
                else true()">The value of the <sch:value-of select="local-name(.)"/> element in the At A Glance table is 
                '<sch:value-of select="."/>' and should be 'No','&lt; $5 billion', '&gt; $5 billion', or '*'</sch:assert>
            <sch:assert test="if (ancestor::u:cboMeta) then (matches(., 'No|less than \$5 billion|greater than \$5 billion|between [-$\d,]+ and', 'i'))
                else true()">The value of the <sch:value-of select="local-name(.)"/> element in the cboMeta is 
                '<sch:value-of select="."/>' and should be 'No', 'less than $5 billion', 'greater than $5 billion', or is between two values.</sch:assert>
        </sch:rule>
    </sch:pattern>
        <sch:pattern>
            <sch:rule context="u:longTermDirectSpending">
                <sch:assert test="ancestor::u:cboMeta|ancestor::u:cboCostEstimate">The 
                    '<sch:value-of select="local-name(.)"/>' element is allowed in CBO Cost Estimates, not in its current context.</sch:assert>
                <sch:assert test="if (ancestor::u:cboAtAGlance) then (. = ('No','&lt; $2.5 billion', '&gt; $2.5 billion', '*'))
                    else true()">The value of the <sch:value-of select="local-name(.)"/> element in the At A Glance table is 
                    '<sch:value-of select="."/>' and should be 'No','&lt; $2.5 billion', '&gt; $2.5 billion', or '*'</sch:assert>
                <sch:assert test="if (ancestor::u:cboMeta) then (matches(., 'No|less than \$2.5 billion|greater than \$2.5 billion|between [-$\d,]+ and', 'i'))
                    else true()">The value of the <sch:value-of select="local-name(.)"/> element in the cboMeta is 
                    '<sch:value-of select="."/>' and should be 'No', 'less than $2.5 billion', 'greater than $2.5 billion', or be between two values.</sch:assert>
            </sch:rule>
        </sch:pattern>
        <sch:pattern>
            <sch:rule context="u:privateSectorMandate">
                <sch:assert test="ancestor::u:cboMeta|ancestor::u:cboCostEstimate">The 
                    '<sch:value-of select="local-name(.)"/>' element is allowed in CBO Cost Estimates, not in its current context.</sch:assert>
                <sch:assert test="if (ancestor::u:cboAtAGlance) then (. = ('No','Yes, Over Threshold','Yes, Under Threshold','Yes, Cannot Determine Costs', 'Excluded from UMRA'))
                    else true()">The value of the <sch:value-of select="local-name(.)"/> element in the At A Glance table is 
                    '<sch:value-of select="."/>' and should be 'No','Yes, Over Threshold','Yes, Under Threshold','Yes, Cannot Determine Costs', or 'Excluded from UMRA'.</sch:assert>
            </sch:rule>
        </sch:pattern>
    
</sch:schema>