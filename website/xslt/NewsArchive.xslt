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
    <xsl:variable name="matchedNodes" select="$currentPage//NewsItem" />

    <xsl:if test="count($matchedNodes) &gt; 0">
      <xsl:for-each select="$matchedNodes">
        <xsl:sort select="@updateDate" order="descending"/>

        <table cellpadding="4" cellspacing="4" width="580px" border="0">
          <tr>
            <td valign="top" align="left">
              <div class="news_title">
                <xsl:value-of select="title" />
              </div>
              <div class="news_abstract">
                <!--<xsl:value-of select="description" />-->
              </div>
              <div class="news_more">
                <a>
                  <xsl:attribute name="href">
                    <xsl:value-of select="destinationURL" />
                  </xsl:attribute>
                  Read more &gt;&gt;
                </a>
              </div>
            </td>
            <td valign="top" style="width: 100px">
              <xsl:if test="mainImage != ''">
                <img width="80">
                  <xsl:attribute name="src">
                    <xsl:value-of select="mainImage" />
                  </xsl:attribute>
                  <xsl:attribute name="alt">
                    <xsl:value-of select="title" />
                  </xsl:attribute>
                </img>
              </xsl:if>
            </td>
          </tr>
        </table>
        <hr style="border-style: dotted;" />
      </xsl:for-each>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>