<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#x00A0;">
]>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxml="urn:schemas-microsoft-com:xslt"
	xmlns:umbraco.library="urn:umbraco.library" 
	xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" 
	xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" 
	xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" 
	xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" 
	xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" 
	xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" 
	exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets">


	<xsl:output method="xml" omit-xml-declaration="yes"/>

	<xsl:param name="currentPage"/>
	<xsl:template match="/">
		<xsl:variable name="SEODescription" select="string($currentPage/sEODescription)" />
		<xsl:choose>
			<xsl:when test="$SEODescription != ''">
				<xsl:value-of select="$SEODescription"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="normalize-space(umbraco.library:StripHtml($currentPage/description))"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>