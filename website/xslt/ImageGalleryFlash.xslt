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

    <xsl:variable name="flashFile" select="'http://www.internationalshitoryu.com/images/flash/evkonyv.swf'" /> <!--$currentPage/flashFile-->
    <xsl:variable name="flashWidth" select="$currentPage/flashWidth" />
    <xsl:variable name="flashHeight" select="$currentPage/flashHeight" />

    <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" 
  codebase="http://fpdownload.adobe.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0">
      <xsl:attribute name="width">
        <xsl:value-of select="$flashWidth"/>
      </xsl:attribute>
      <xsl:attribute name="height">
        <xsl:value-of select="$flashHeight"/>
      </xsl:attribute>
      <param name="movie">
          <xsl:attribute name="value">
            <xsl:value-of select="$flashFile" />
          </xsl:attribute>
        </param>
        <param name="play" value="true" />
        <param name="loop" value="true" />
        <param name="quality" value="high" />
        <param name="menu" value="true" />
        <param name="scale" value="default"/>
        <param name="wmode" value="transparent"/>
        <embed
          play="true"
          loop="true"
          quality="high"
          menu="true"
          scale="default"
          wmode="transparent"
          pluginspage="http://www.adobe.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" >
          <xsl:attribute name="src">
            <xsl:value-of select="$flashFile" />
          </xsl:attribute>
          <xsl:attribute name="width">
            <xsl:value-of select="$flashWidth"/>
          </xsl:attribute>
          <xsl:attribute name="height">
            <xsl:value-of select="$flashHeight"/>
          </xsl:attribute>
        </embed>
      </object>


  </xsl:template>

</xsl:stylesheet>