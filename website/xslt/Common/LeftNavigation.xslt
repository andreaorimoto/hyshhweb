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

  <xsl:output method="xml" omit-xml-declaration="yes" />

  <xsl:param name="currentPage"/>

  <xsl:variable name="level" select="2"/>

  <xsl:template match="/">
    <div id="leftnav_tree">
      <div id="leftnav">
        <ul>
          <xsl:for-each select="$currentPage/ancestor-or-self::* [@level=$level]">
            <li>
              <a href="{umbraco.library:NiceUrl(@id)}">
                <xsl:if test="$currentPage/@id = @id">
                  <xsl:attribute name="style">
                    <xsl:value-of select="'color: #32AAE9;'" />
                  </xsl:attribute>
                </xsl:if>
                <xsl:choose>
                  <xsl:when test="leftNavTitle != ''">
                    <xsl:value-of select="leftNavTitle"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="title"/>
                  </xsl:otherwise>
                </xsl:choose>
              </a>
            </li>
          </xsl:for-each>
          <xsl:for-each select="$currentPage/ancestor-or-self::* [@level=$level]/* [@level=3 and string(umbracoNaviHide) != '1' and not(contains(name(),'NewsYearMonth'))]">
            <li>
              <a>
                <xsl:attribute name="href">
                  <xsl:value-of select="umbraco.library:NiceUrl(@id)"/>
                </xsl:attribute>
                <xsl:if test="$currentPage/ancestor-or-self::* [@level=3]/@id = @id">
                  <xsl:attribute name="style">
                    <xsl:value-of select="'color: #32AAE9;'" />
                  </xsl:attribute>
                </xsl:if>
                <xsl:value-of select="title"/>
              </a>
            </li>
          </xsl:for-each>
        </ul>
          <xsl:if test="local-name($currentPage/ancestor-or-self::* [@level=$level]) = 'VideosArchive'">
            <hr style="width: 200px"/>
            <ul>  
            <li>
                <a href="http://www.youtube.com/watch?v=D1S7atVhUqc" target="_blank">Budo, the art of killing</a>
              </li>
            </ul>
          </xsl:if>

      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>