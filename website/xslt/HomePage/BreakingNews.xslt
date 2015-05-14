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
		<div id="headline">
			<xsl:if test="$currentPage/breakingNewsText != '' and $currentPage/breakingNewsUrl != ''">
				<div class="headline_title">
					<span>BREAKING NEWS</span>
				</div>
			</xsl:if>
			<div id="newsticker" class="headline_content">
				<!-- 
				tried with a JS/Jquery version, but still can't click on FF...
				<div id="news-slide">
					<ul id="news-slide-list">
						<li class="news-slide-first">
							<a>
								<xsl:if test="$currentPage/data [@alias = 'BreakingNewsText'] != '' and $currentPage/data [@alias = 'BreakingNewsUrl'] != ''">
									<xsl:attribute name="href">
										<xsl:value-of select="$currentPage/data [@alias = 'BreakingNewsUrl']" />
									</xsl:attribute>
								</xsl:if>
								<xsl:value-of select="$currentPage/data [@alias = 'BreakingNewsText']" />
							</a>
						</li>
						<li>
							<a>
								<xsl:if test="$currentPage/data [@alias = 'BreakingNewsText'] != '' and $currentPage/data [@alias = 'BreakingNewsUrl'] != ''">
									<xsl:attribute name="href">
										<xsl:value-of select="$currentPage/data [@alias = 'BreakingNewsUrl']" />
									</xsl:attribute>
								</xsl:if>
								<xsl:value-of select="$currentPage/data [@alias = 'BreakingNewsText']" />
							</a>
						</li>
					</ul>
				</div>
				-->
				<marquee scrolldelay="120">
					<a>
						<xsl:if test="$currentPage/breakingNewsText != '' and $currentPage/breakingNewsUrl != ''">
							<xsl:attribute name="href">
								<xsl:value-of select="$currentPage/breakingNewsUrl" />
							</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="$currentPage/breakingNewsText" />
					</a>
				</marquee>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>