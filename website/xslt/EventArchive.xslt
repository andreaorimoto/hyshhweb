<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#x00A0;"> ]>
<xsl:stylesheet 
  version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:msxml="urn:schemas-microsoft-com:xslt" 
  xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" 
  exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets ">

<xsl:output method="xml" omit-xml-declaration="yes" />

<xsl:param name="currentPage"/>

<!-- Don't change this but create a 'number' element in your -->
<!-- macro with the alias of 'numberOfItems' -->
<xsl:variable name="numberOfItems" select="/macro/numberOfItems"/>

<xsl:template match="/">

<!-- The fun starts here -->
<ul>
<xsl:for-each select="$currentPage/descendant::*  [@isDoc and string(umbracoNaviHide) != '1' and name() = 'EventsItem']">
<xsl:sort select="eventDate" order="descending"/>
    <li>
      <a href="{umbraco.library:NiceUrl(@id)}">
        <xsl:value-of select="./title"/>
      </a><br/>
      <xsl:value-of select="umbraco.library:FormatDateTime(eventDate, 'dddd, MMM dd, yyyy')"/><br/>
      <xsl:value-of select="eventLocation"/>
    </li>
</xsl:for-each>
</ul>

</xsl:template>

</xsl:stylesheet>