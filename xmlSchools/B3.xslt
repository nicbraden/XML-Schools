<?xml version="1.0" encoding="utf-8" ?>

<!-- INFO-5064 Final Test Review - Question B3 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" />

    <xsl:template match="/">
        <xsl:element name="country">
            <xsl:apply-templates select="//country" />
        </xsl:element>
    </xsl:template>

    <xsl:template match="country">
        <xsl:if test="/official-languages = 'French'">
        <xsl:element name="name">
            <xsl:value-of select="@name"/>
        </xsl:element>
        </xsl:if>
    </xsl:template>


</xsl:stylesheet>