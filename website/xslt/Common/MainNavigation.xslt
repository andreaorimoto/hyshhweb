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
  <xsl:variable name="lower">abcdefghijklmnopqrstuvwxyz</xsl:variable>
  <xsl:variable name="upper">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>

  <xsl:template match="/">
    <xsl:variable name="nodes" select="$currentPage/ancestor-or-self::* [@level=1]/* [@level=2 and string(umbracoNaviHide) != '1']" />
    <div id="siteNavigation">
      <ul id="globalNav" class="clearfix">
        <li>
          <xsl:attribute name="class">
            <xsl:text>home</xsl:text>
            <xsl:if test="$currentPage/@id = '1085'">
              <xsl:text> </xsl:text>current
            </xsl:if>
          </xsl:attribute>
          <a href="/" title="HOME">HOME</a>
        </li>
        <xsl:for-each select="$nodes">
          <li>
            <xsl:attribute name="class">
              <xsl:value-of select="translate(@nodeName, $upper, $lower)"/>
              <xsl:if test="$currentPage/ancestor-or-self::*/@id = current()/@id">
                <xsl:text> </xsl:text>current
              </xsl:if>
            </xsl:attribute>
            <a href="{umbraco.library:NiceUrl(@id)}" title="{title}">
              <xsl:value-of select="title" />
            </a>
          </li>
        </xsl:for-each>
      </ul>
    </div>

  </xsl:template>

</xsl:stylesheet>