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
    <xsl:for-each select="$currentPage/* [@isDoc and string(umbracoNaviHide) != '1']">
      <div class="photo">

        <a href="{umbraco.library:NiceUrl(@id)}">
          <xsl:variable name="media" select="umbraco.library:GetMedia(./imageThumbnail, 0)" />
         <img src="{concat('/umbraco/ImageGen.ashx?image=',$media/umbracoFile,'&amp;width=100&amp;height=100&amp;constrain=true')}" style="border: none;"/>
          <br/>
          <b>
            <span class="photoTitle">
              <xsl:value-of select="@nodeName"/>
            </span>
          </b>
        </a>
      </div>
    </xsl:for-each>

  </xsl:template>

</xsl:stylesheet>