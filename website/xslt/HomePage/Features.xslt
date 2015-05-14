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
    <xsl:variable name="featureLinks" select="umbraco.library:GetXmlNodeById(1080)" />
    <xsl:if test="count($featureLinks/*) &gt; 0">

      <div id="events_hp_container">
        <xsl:for-each select="$featureLinks/*">
          <xsl:if test="position() &lt;= 4">
            <div class="events_hp">
              <div class="events_hp_top">
                <a>
                  <xsl:attribute name="href">
                    <xsl:value-of select="destinationURL" />
                  </xsl:attribute>
                  <img>
                    <xsl:attribute name="src">
                      <xsl:value-of select="imageCrop//crop [@name = 'hpFeature']/@url " />
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                      <xsl:value-of select="title" />
                    </xsl:attribute>
                  </img>
                </a>
              </div>
              <div class="events_hp_center">
                <a>
                  <xsl:attribute name="href">
                    <xsl:value-of select="destinationURL" />
                  </xsl:attribute>
                  <xsl:value-of select="title" />
                </a>
              </div>
              <div class="events_hp_bottom">
                <span>
                  <xsl:value-of select="description" disable-output-escaping="yes" />
                </span>
              </div>
            </div>
          </xsl:if>
        </xsl:for-each>
      </div>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>