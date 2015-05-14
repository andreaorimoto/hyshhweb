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
    <xsl:variable name="mainFlash" select="$currentPage/mainFlash" />
    <xsl:variable name="youtubeVideo" select="$currentPage/youtubeVideo" />
    <div id="HomePageHero">
      <xsl:choose>
        <xsl:when test="$youtubeVideo != ''">
          <iframe width="618" height="235" src="//www.youtube.com/embed/{$youtubeVideo}" frameborder="0" allowfullscreen="allowfullscreen">
            &nbsp;
          </iframe>
        </xsl:when>
        <xsl:otherwise>
          <xsl:choose>
            <xsl:when test="$mainFlash != ''">
              <xsl:variable name="mainFlashExtension" select="substring($mainFlash,string-length($mainFlash)-3)" />
              <xsl:choose>
                <xsl:when test="$mainFlashExtension = '.swf'">
                  <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="618" height="235"
                    codebase="http://fpdownload.adobe.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0">
                    <param name="movie">
                      <xsl:attribute name="value">
                        <xsl:value-of select="$mainFlash" />
                      </xsl:attribute>
                    </param>
                    <param name="play" value="true" />
                    <param name="loop" value="true" />
                    <param name="quality" value="high" />
                    <param name="menu" value="true" />
                    <img src="" alt="" />
                    <embed
                      width="618"
                      height="235"
                      play="true"
                      loop="true"
                      quality="high"
                      menu="true"
                      pluginspage="http://www.adobe.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" >
                      <xsl:attribute name="src">
                        <xsl:value-of select="$mainFlash" />
                      </xsl:attribute>
                    </embed>
                  </object>

                </xsl:when>
                <xsl:when test="$mainFlashExtension = '.jpg' or $mainFlashExtension = '.gif' or $mainFlashExtension = '.png'">
                  <xsl:choose>
                    <xsl:when test="$currentPage/mainFlashUrl != ''">
                      <a>
                        <xsl:attribute name="href">
                          <xsl:value-of select="$currentPage/mainFlashUrl" />
                        </xsl:attribute>
                        <img width="618" height="235">
                          <xsl:attribute name="src">
                            <xsl:value-of select="$currentPage/imageCrop//crop [@name = 'hpTopstory']/@url " />
                          </xsl:attribute>
                          <xsl:attribute name="alt">
                            <xsl:value-of select="$currentPage/mainFlashTitle" />
                          </xsl:attribute>
                        </img>
                      </a>
                    </xsl:when>
                    <xsl:otherwise>
                      <img width="618" height="235">
                        <xsl:attribute name="src">
                          <xsl:value-of select="$currentPage/imageCrop//crop [@name = 'hpTopstory']/@url " />
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                          <xsl:value-of select="$currentPage/mainFlashTitle" />
                        </xsl:attribute>
                      </img>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="default" />
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="default" />
            </xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </xsl:template>

  <xsl:template name="default">
    <!-- Default dummy Main Flash Image, just in case -->
    <img width="618" height="235" src="/images/MainFlashDefault.png" alt="INTERNATIONAL HAYASHI-HA SHITO-RYU KARATE-DO FEDERATION" />
  </xsl:template>
</xsl:stylesheet>