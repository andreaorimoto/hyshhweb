<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#x00A0;">
]>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxml="urn:schemas-microsoft-com:xslt"
  xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets"
  exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets ">


  <xsl:output method="xml" omit-xml-declaration="yes"/>

  <xsl:param name="currentPage"/>

  <xsl:template match="/">
    <xsl:variable name="matchedNodes" select="$currentPage//* [@isDoc][(contains(name(), 'EventsItem') and showInHPNews = '1') or contains(name(), 'NewsItem')]" />
    <xsl:if test="count($matchedNodes) &gt; 0">
      <div id="hpNewsFeed">
      <ul>
        <xsl:for-each select="$matchedNodes">
          <xsl:sort select="@updateDate" order="descending"/>
          <xsl:if test="position() &lt; 4">
          <li>
            <a>
              <xsl:attribute name="href">
                  <xsl:choose>
                    <xsl:when test="name() = 'NewsItem'">
                      <xsl:value-of select="./destinationURL"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="umbraco.library:NiceUrl(@id)"/>
                    </xsl:otherwise>
                  </xsl:choose>
              </xsl:attribute>
              <xsl:value-of select="title" />
            </a>
          </li>
        </xsl:if>
        </xsl:for-each>
      </ul>
    </div>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>