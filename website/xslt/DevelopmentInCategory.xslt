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

    <!-- start writing XSLT -->
    <div class="clearfix">
      <xsl:for-each select="$currentPage/ancestor-or-self::DevelopmentCategory/DevelopmentItem">
        <div class="block clearfix">
          <!-- 
          <p class="thumb">
            <a href="{umbraco.library:NiceUrl(@id)}">
              <img src="{./videoThumbnail}" alt="{./title}" width="100" />
            </a>
          </p>
          -->
          <div class="content">
            <h4 class="txt12">
              <a href="{umbraco.library:NiceUrl(@id)}">
                <xsl:value-of select="./title"/>
              </a>
              <xsl:if test="./author != ''">
                (by <xsl:value-of select="./author"/>)
              </xsl:if>
            </h4>
          </div>
        </div>
      </xsl:for-each>
    </div>
  </xsl:template>

</xsl:stylesheet>