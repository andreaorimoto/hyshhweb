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
    <div id="ad">
      <div id="ad_image">
        <img width="217" height="157">
          <xsl:attribute name="src">
            <xsl:value-of select="$currentPage/leftBanner" />
          </xsl:attribute>
          <xsl:attribute name="alt">
            <xsl:value-of select="$currentPage/leftBannerAlt" />
          </xsl:attribute>
        </img>
        <!-- 
        <a>
					<xsl:attribute name="href">
						<xsl:value-of select="$currentPage/leftBannerUrl" />
					</xsl:attribute>
				</a>
        -->
      </div>

      <div id="ad_sponsor">
        <span id="sponsor_title">&nbsp;</span>
        <span id="sponsor_title_arrow">&nbsp;</span>
        <span id="sponsor_text">
          &nbsp;
          <!-- 
          <xsl:value-of select="$currentPage/leftBannerAlt" />
          -->
        </span>
        <!-- 
        -->
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>