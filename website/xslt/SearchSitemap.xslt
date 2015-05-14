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

  <xsl:variable name="siteURL" select="concat('http://',umbraco.library:RequestServerVariables('HTTP_HOST'))"/>

  <xsl:template match="/">
    <xsl:value-of select="umbraco.library:ChangeContentType('text/xml')"/>
    <xsl:text disable-output-escaping="yes">&lt;?xml version="1.0" encoding="UTF-8"?&gt;</xsl:text>
    <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
      <url>
        <loc>http://www.internationalshitoryu.com/</loc>
        <lastmod>
          <xsl:value-of select="umbraco.library:FormatDateTime(umbraco.library:CurrentDate(),'yyyy-MM-dd')"/>
        </lastmod>
        <changefreq>hourly</changefreq>
        <priority>1</priority>
      </url>
      <xsl:for-each select="$currentPage/ancestor-or-self::* [local-name() = 'HomePage']/descendant::* [@isDoc and string(umbracoNaviHide) != '1' and not(contains(local-name(),'News')) and not(contains(local-name(),'SearchSitemap'))]">
        <url>
          <loc>
            <xsl:value-of select="$siteURL"/>
            <xsl:value-of select="umbraco.library:NiceUrl(@id)"/>
          </loc>
          <lastmod>
            <xsl:value-of select="umbraco.library:FormatDateTime(@updateDate,'yyyy-MM-dd')" />
          </lastmod>
        </url>
      </xsl:for-each>
    </urlset>
  </xsl:template>
</xsl:stylesheet>