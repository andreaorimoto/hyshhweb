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

    <!-- The fun starts here -->
    <xsl:for-each select="$currentPage/DevelopmentCategory">
        <!--<a name="{./title}"/>-->
      <h3>
        <xsl:value-of select="./title"/>
      </h3>
      <div class="clearfix">
        <xsl:for-each select="./* [@isDoc and string(umbracoNaviHide) != '1']">
          <div class="block clearfix">
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
    </xsl:for-each>
    <!-- 
    <ul>
      <xsl:for-each select="$currentPage/* [@isDoc and string(umbracoNaviHide) != '1']">
        <li>
          <a href="{umbraco.library:NiceUrl(@id)}">
            <img src="{./videoThumbnail}" />
            <xsl:value-of select="./title"/>
          </a>
          <br/>
          <xsl:value-of select="umbraco.library:StripHtml(./mainText)"/>
        </li>
      </xsl:for-each>
    </ul>
    -->
  </xsl:template>

</xsl:stylesheet>