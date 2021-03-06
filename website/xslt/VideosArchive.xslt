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
    <xsl:for-each select="$currentPage/VideosCategory">
        <!--<a name="{./title}"/>-->
      <h3>
        <xsl:value-of select="./title"/>
      </h3>
      <div class="clearfix">
        <xsl:for-each select="./* [@isDoc and string(umbracoNaviHide) != '1']">
          <div class="block clearfix">
            <p class="thumb">
              <a href="{umbraco.library:NiceUrl(@id)}">
                <img src="{./videoThumbnail}" alt="{./title}" width="100" />
              </a>
            </p>
            <div class="content">
              <h4 class="txt12">
                <a href="{umbraco.library:NiceUrl(@id)}">
                  <xsl:value-of select="./title"/>
                </a>
              </h4>
              <p class="desc txt10">
                <xsl:value-of select="./mainText" disable-output-escaping="yes"/>
              </p>
            </div>
          </div>
        </xsl:for-each>
        <a href="#top" style="font-size: 10px;">Back to top</a>
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